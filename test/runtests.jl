using LibSpatialIndex
using Test
import GeoInterface as GI
import LibSpatialIndex as SI
import Aqua

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
    pmins_p = Ref{Ptr{Float64}}()
    pmaxs_p = Ref{Ptr{Float64}}()
    ndims = Ref{UInt32}()

    SI.C.Index_GetBounds(idx, pmins_p, pmaxs_p, ndims);

    # somehow in here the object gets messed up, but only during testing - wtf?  
    # but only on 1.11 and 1.12? gotta be some kind of bug in Julia itself
    # Does not happen when running from the REPL or the command line, even in test mode
    # Only happens with Pkg.test()
    @test ndims[] == 2

    pmins = unsafe_wrap(Vector{Float64}, pmins_p[], ndims[], own=true)
    pmaxs = unsafe_wrap(Vector{Float64}, pmaxs_p[], ndims[], own=true)

    @test isapprox(pmins, [0.5, 0.5])
    @test isapprox(pmaxs, [0.5, 0.5])
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

@testset "GeoInterface/Extents Operations" begin
    rtree = SI.RTree(2)
    result = SI.insert!(rtree, 1, GI.Extent(X=(0.0, 1.0), Y=(0.0, 1.0)))
    @test result == SI.C.RT_None

    polygon = GI.Polygon([GI.LinearRing([(0.0, 0.0), (0.5, 0.0), (2.0, 0.5), (0.0, 2.0), (0.0, 0.0)])])
    result = SI.insert!(rtree, 2, polygon)

    @test result == SI.C.RT_None
    @test SI.intersects(rtree, GI.LineString([(0.0, 0.0), (1.0, 1.0)])) == [1, 2]
    @test SI.intersects(rtree, GI.Point(0.0, 0.0)) == [1, 2]
    @test SI.intersects(rtree, (X=2.0, Y=2.0)) == [2]
    @test sort(SI.knn(rtree, GI.Extent(X=(2.0, 2.0), Y=(2.0, 2.0)), 1)) == [2]
    @test sort(SI.knn(rtree, (2.0, 2.0), 1)) == [2]
end

@testset "Bounds checks" begin
    # confirm that bounds checks on the Julia side are working
    tree = SI.RTree(2)
    @test_throws DimensionMismatch SI.insert!(tree, 0, [0.0], [0.0, 0.1])
    @test_throws DimensionMismatch SI.insert!(tree, 0, [0.0, 1.0], [0.1])
    # should throw even if they're the same length if they don't match dimensions
    @test_throws DimensionMismatch SI.insert!(tree, 0, [0.0, 0.1, 1.1], [0.0, 0.1, 1.1])

    @test_throws DimensionMismatch SI.intersects(tree, [0.0], [0.0, 0.1])
    @test_throws DimensionMismatch SI.intersects(tree, [0.0, 1.0], [0.1])
    @test_throws DimensionMismatch SI.intersects(tree, [0.0, 0.1, 1.1], [0.0, 0.1, 1.1])

    @test_throws DimensionMismatch SI.knn(tree, [0.0], [0.0, 0.1], 1)
    @test_throws DimensionMismatch SI.knn(tree, [0.0, 1.0], [0.1], 1)
    @test_throws DimensionMismatch SI.knn(tree, [0.0, 0.1, 1.1], [0.0, 0.1, 1.1], 1)
end

@testset "Aqua" begin
    Aqua.test_all(LibSpatialIndex)
end
