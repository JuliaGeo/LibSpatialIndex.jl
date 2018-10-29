module LibSpatialIndex

    include("capi.jl")

    version() = unsafe_string(C.SIDX_Version())

    function _checkresult(result::C.RTError, message::String)
        if result == C.RT_Failure || result == C.RT_Fatal
            error(message)
        end
    end

    """
    The RTree index [guttman84] is a balanced tree structure that consists of
    index nodes, leaf nodes and data.

    Every node (leaf and index) has a fixed capacity of entries, (the node
    capacity) chosen at index creation An `RTree` abstracts the data with their
    Minimum Bounding Region (`MBR`) and clusters these MBRs according to various
    heuristics in the leaf nodes. Queries are evaluated from the root of the
    tree down the leaves. Since the index is balanced nodes can be under full.
    They cannot be empty though. A `fillfactor` specifies the minimum number of
    entries allowed in any node. The fill factor is usually close to `70%`.

    # Options

    * `ndim`: Dimensionality of the data that will be inserted.
    * `indextype`: one of `RT_RTree` (default), `RT_MVRTree`, or `RT_TPRTree`.
    * `variant`: one of `RT_Linear`, `RT_Quadratic`, or `RT_Star` (default).
    * `storage`: one of `RT_Memory` (default), `RT_Disk`, or `RT_Custom`.
    * `indexcapacity`: The index node capacity. Default is `100`.
    * `leafcapacity`: The leaf node capacity. Default is `100`.
    * `leafpoolcapacity`: Default is `100`.
    * `indexpoolcapacity`: Default is `100`.
    * `regionpoolcapacity`: Default is `1000`.
    * `pointpoolcapacity`: Default is `500`.
    * `tightMBR`: Default is `true`.
    * `nearminimumoverlapfactor`: Default is `32`.
    * `fillfactor`: The fill factor. Default is `0.7`.
    * `splitdistributionfactor`: Default is `0.4`.
    * `reinsertfactor`: Default is `0.3`.
    
    # Performance

    Dataset size, data density, etc. have nothing to do with capacity and page
    size. What you are trying to achieve is fast reads from the disk and take
    advantage of disk buffering and prefetching.

    Normally, you select the page size to be equal to the disk page size
    (depends on how you format the drive). Then you choose the node capacity to
    be enough to fill the whole page (including data entries if you have any).

    There is a tradeoff though in making node capacity too large. The larger the
    capacity, the longer the “for loops” for inserting, deleting, locating node
    entries take (CPU time). On the other hand, the larger the capacity the
    shorter the tree becomes, reducing the number of random IOs to reach the
    leaves. Hence, you might want to fit multiple nodes (of smaller capacity)
    inside a single page to balance I/O and CPU cost, in case your disk page
    size is too large.

    Finally, if you have enough buffer space to fit most of the index nodes in
    main memory, then large capacities do not make too much sense, because the
    height of the tree does not matter any more. Of course, the smaller the
    capacity, the larger the number of leaf nodes you will have to retrieve from
    disk for range queries (point queries and nearest neighbor queries will not
    suffer that much). So very small capacities hurt as well.

    There is another issue when trying to fit multiple nodes per page: Leftover
    space. You might have leftover space due to data entries that do not have a
    fixed size. Unfortunately, in that case, leftover space per page is lost,
    negatively impacting space usage.

    Selecting the right page size is easy; make it equal to the disk page size.
    Selecting the right node capacity is an art.

    # References
    [guttman84] “R-Trees: A Dynamic Index Structure for Spatial Searching”
        Antonin Guttman, Proc. 1984 ACM-SIGMOD Conference on Management of
        Data (1985), 47-57.
    """
    mutable struct RTree
        index::C.IndexH
        indextype::C.RTIndexType
        ndim::UInt32
        variant::C.RTIndexVariant
        storage::C.RTStorageType
        indexcapacity::UInt32
        leafcapacity::UInt32
        leafpoolcapacity::UInt32
        indexpoolcapacity::UInt32
        regionpoolcapacity::UInt32
        pointpoolcapacity::UInt32
        tightMBR::Bool
        nearminimumoverlapfactor::UInt32
        fillfactor::Float64
        splitdistributionfactor::Float64
        reinsertfactor::Float64

        function RTree(ndim::Integer;
                indextype::C.RTIndexType = C.RT_RTree,
                variant::C.RTIndexVariant = C.RT_Star,
                storage::C.RTStorageType = C.RT_Memory,
                indexcapacity::Integer = 100,
                leafcapacity::Integer = 100,
                leafpoolcapacity::Integer = 100,
                indexpoolcapacity::Integer = 100,
                regionpoolcapacity::Integer = 1000,
                pointpoolcapacity::Integer = 500,
                tightMBR::Bool = true,
                nearminimumoverlapfactor::Integer = 32,
                fillfactor::Real = 0.7,
                splitdistributionfactor::Real = 0.4,
                reinsertfactor::Real = 0.3
            )
            p = C.IndexProperty_Create()
            C.IndexProperty_SetIndexType(p, indextype)
            C.IndexProperty_SetDimension(p, UInt32(ndim))
            C.IndexProperty_SetIndexVariant(p, variant)
            C.IndexProperty_SetIndexStorage(p, storage)
            C.IndexProperty_SetIndexCapacity(p, UInt32(indexcapacity))
            C.IndexProperty_SetLeafCapacity(p, UInt32(leafcapacity))
            C.IndexProperty_SetLeafPoolCapacity(p, UInt32(leafpoolcapacity))
            C.IndexProperty_SetIndexPoolCapacity(p, UInt32(indexpoolcapacity))
            C.IndexProperty_SetRegionPoolCapacity(p, UInt32(regionpoolcapacity))
            C.IndexProperty_SetPointPoolCapacity(p, UInt32(pointpoolcapacity))
            # IndexProperty_SetBufferingCapacity(iprop::IndexPropertyH, value::UInt32)
            C.IndexProperty_SetEnsureTightMBRs(p, UInt32(tightMBR))
            # IndexProperty_SetOverwrite(iprop::IndexPropertyH, value::UInt32)
            C.IndexProperty_SetNearMinimumOverlapFactor(p, UInt32(nearminimumoverlapfactor))
            # IndexProperty_SetWriteThrough(iprop::IndexPropertyH, value::UInt32)
            C.IndexProperty_SetFillFactor(p, fillfactor)
            C.IndexProperty_SetSplitDistributionFactor(p, splitdistributionfactor)
            # IndexProperty_SetTPRHorizon(iprop::IndexPropertyH, value::Cdouble)
            C.IndexProperty_SetReinsertFactor(p, reinsertfactor)
            # IndexProperty_SetFileName(iprop::IndexPropertyH, value)
            # IndexProperty_SetFileNameExtensionDat(iprop::IndexPropertyH, value)
            # IndexProperty_SetFileNameExtensionIdx(iprop::IndexPropertyH, value)
            # IndexProperty_SetCustomStorageCallbacksSize(iprop::IndexPropertyH, value::UInt32)
            # IndexProperty_SetCustomStorageCallbacks(iprop::IndexPropertyH, value)
            # IndexProperty_SetIndexID(iprop::IndexPropertyH, value::Int64)
            index = C.Index_Create(p)
            Bool(C.Index_IsValid(index)) || error("Invalid index")
            C.IndexProperty_Destroy(p)
            rtree = new(index, indextype, ndim, variant, storage, indexcapacity,
                leafcapacity, leafpoolcapacity, indexpoolcapacity,
                regionpoolcapacity, pointpoolcapacity, tightMBR,
                nearminimumoverlapfactor, fillfactor, splitdistributionfactor,
                reinsertfactor)
            finalizer( x -> (C.Index_Destroy(x.index); x.index = C_NULL), rtree)
            rtree
        end
    end

    """
    Inserts an item into the `rtree` with given `id` and boundingbox specified
    by `minvalues` and `maxvalues`, where the item lies within the interval
    `[minvalues[i],maxvalues[i]]` for each axis `i` in 1, ..., `ndim`.
    """
    function insert!(
            rtree::RTree,
            id::Integer,
            minvalues::Vector{Float64},
            maxvalues::Vector{Float64}
        )
        C.Index_InsertData(rtree.index, Int64(id), pointer(minvalues),
            pointer(maxvalues), UInt32(length(minvalues)), Ptr{UInt8}(0), Cint(0)
        )
    end

    """
    Returns a vector of `id`s corresponding to items in `rtree` that intersects
    the box specified by `minvalues` and `maxvalues`.

    Each item intersects the interval `[minvalues[i],maxvalues[i]]` for each
    axis `i` in 1, ..., `ndim`.
    """
    function intersects(
            rtree::RTree,
            minvalues::Vector{Float64},
            maxvalues::Vector{Float64}
        )
        items = Ref{Ptr{Int64}}()
        nresults = Ref{UInt64}()
        result = C.Index_Intersects_id(rtree.index, pointer(minvalues),
            pointer(maxvalues), UInt32(length(minvalues)), items, nresults
        )
        _checkresult(result, "Index_Intersects_id: Failed to evaluate")
        unsafe_wrap(Array, items[], nresults[])
    end

    """
    Returns a vector of `id`s corresponding to items in `rtree` that intersects
    the coordinates specified by `point`.
    """
    intersects(rtree::RTree, point::Vector{Float64}) = intersects(rtree, point, point)

    """
    Returns a vector of `id`s corresponding to the `k` items in `rtree`
    that are nearest to the box specified by `minvalues` and `maxvalues`.

    Each item intersects the interval `[minvalues[i],maxvalues[i]]` for each
    axis `i` in 1, ..., `ndim`. If there are fewer than `k` items in `rtree`,
    it will return less than `k` items. On the other hand, if there are ties
    between some of the items, it might return more than `k` items.
    """
    function knn(
            rtree::RTree,
            minvalues::Vector{Float64},
            maxvalues::Vector{Float64},
            k::Integer
        )
        items = Ref{Ptr{Int64}}()
        nresults = Ref{UInt64}(k)
        result = C.Index_NearestNeighbors_id(rtree.index, pointer(minvalues),
            pointer(maxvalues), UInt32(length(minvalues)), items, nresults)
        _checkresult(result, "Index_NearestNeighbors_id: Failed to evaluate")
        unsafe_wrap(Array, items[], nresults[])
    end

    """
    Returns a vector of `id`s corresponding to the `k` items in `rtree`
    that are nearest to the box specified by `minvalues` and `maxvalues`.

    If there are fewer than `k` items in `rtree`, it will return less than `k`
    items. On the other hand, if there are ties between some of the items,
    it might return more than `k` items.
    """
    knn(rtree::RTree, point::Vector{Float64}, k::Integer) = knn(rtree, point, point, k)
    
end # module
