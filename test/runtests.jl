using LibSpatialIndex
using Test
const SI = LibSpatialIndex

@testset "Simple Tutorial" begin
    # based on https://github.com/libspatialindex/libspatialindex/wiki/Simple-Tutorial
    println("Testing LibSpatialIndex v$(SI.version())")
    props = SI.C.IndexProperty_Create()
    SI.C.IndexProperty_SetIndexType(props, SI.C.RT_RTree)
    SI.C.IndexProperty_SetIndexStorage(props, SI.C.RT_Memory)
    idx = SI.C.Index_Create(props)
    SI.C.IndexProperty_Destroy(props)
    @test Bool(SI.C.Index_IsValid(idx))

    # load()
    min = [0.5, 0.5]
    max = [0.5, 0.5]
    SI.C.Index_InsertData(idx, 1, min, max, 2, Ptr{UInt8}(C_NULL), 0)

    # query()
    min = [0.0, 0.0]
    max = [1.0, 1.0]
    ndims = UInt32(2)
    nresults = Ref{UInt64}()
    SI.C.Index_Intersects_count(idx, min, max, ndims, nresults)
    @test nresults[] == 1

    # bounds()
    pmins = zeros(2)
    pmaxs = zeros(2)
    ndims = Ref{UInt32}()
    SI.C.Index_GetBounds(idx, pointer(pmins), pointer(pmaxs), ndims);
    @test ndims[] == 2
end

@testset "Simple Operations" begin
    rtree = SI.RTree(2)
    result = SI.insert!(rtree, 1, [0.,0.], [1.,1.])
    @test result == SI.C.RT_None
    result = SI.insert!(rtree, 2, [0.,0.], [2.,2.])
    @test result == SI.C.RT_None
    @test SI.intersects(rtree, [0.,0.],[1.,1.]) == [1,2]
    @test SI.intersects(rtree, [0.,0.]) == [1,2]
    @test SI.intersects(rtree, [2.,2.]) == [2]
    @test SI.intersects(rtree, [1.5,1.5],[2.,2.]) == [2]
    @test sort(SI.knn(rtree, [2.,2.],[2.,2.], 1)) == [2]
    @test sort(SI.knn(rtree, [2.,2.],[2.,2.], 2)) == [1,2]
    @test sort(SI.knn(rtree, [2.,2.],[2.,2.], 3)) == [1,2]
    @test sort(SI.knn(rtree, [2.,2.], 1)) == [2]
    @test sort(SI.knn(rtree, [2.,2.], 2)) == [1,2]
end
