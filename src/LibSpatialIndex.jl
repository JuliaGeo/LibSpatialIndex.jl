module LibSpatialIndex

    include("capi.jl")

    version() = unsafe_string(C.SIDX_Version())

    mutable struct RTree
        index::C.IndexH
        indextype::C.RTIndexType
        ndim::Integer
        nitems::Int
        variant::C.RTIndexVariant
        storage::C.RTStorageType
        indexcapacity::Integer
        leafcapacity::Integer
        leafpoolcapacity::Integer
        indexpoolcapacity::Integer
        regionpoolcapacity::Integer
        pointpoolcapacity::Integer
        tightMBR::Bool
        nearminimumoverlapfactor::Integer
        fillfactor::Real
        splitdistributionfactor::Real
        reinsertfactor::Real

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
            rtree = new(index, indextype, ndim, 0, variant, storage, indexcapacity,
                leafcapacity, leafpoolcapacity, indexpoolcapacity, regionpoolcapacity,
                pointpoolcapacity, tightMBR, nearminimumoverlapfactor, fillfactor,
                splitdistributionfactor, reinsertfactor)
            finalizer(rtree, x -> (C.Index_Destroy(x.index); x.index = C_NULL))
            rtree
        end
    end

    function insert!(rtree::RTree, id::Int, minvalues, maxvalues)
        @assert length(minvalues) == length(maxvalues)
        C.Index_InsertData(rtree.index, id, pointer(minvalues),
            pointer(maxvalues), UInt32(length(minvalues)), Ptr{UInt8}(0), Cint(0)
        )
    end

    function intersects(rtree::RTree, minvalues, maxvalues)
        ndim = length(minvalues)
        @assert ndim == length(maxvalues)
        items = Ref{Ptr{Int64}}()
        nresults = Ref{UInt64}()
        result = C.Index_Intersects_id(rtree.index, pointer(minvalues),
            pointer(maxvalues), UInt32(ndim), items, nresults
        )
        if result == C.RT_Failure || result == C.RT_Fatal
            error("Index_Intersects_id: Failed to evaluate")
        else
            return unsafe_wrap(Array, items[], nresults[])
        end
    end

    function knn(rtree::RTree, minvalues, maxvalues, k::Integer)
        ndim = length(minvalues)
        @assert ndim == length(maxvalues)
        items = Ref{Ptr{Int64}}()
        nresults = Ref{UInt64}(k)
        result = C.Index_NearestNeighbors_id(rtree.index, pointer(minvalues),
            pointer(maxvalues), UInt32(ndim), items, nresults)
        if result == C.RT_Failure || result == C.RT_Fatal
            error("Index_NearestNeighbors_id: Failed to evaluate")
        else
            return unsafe_wrap(Array, items[], nresults[])
        end
    end
    
end # module
