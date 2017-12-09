using LibSpatialIndex, Base.Test; const SI = LibSpatialIndex

@testset "Simple Tutorial" begin
    # based on https://github.com/libspatialindex/libspatialindex/wiki/Simple-Tutorial
    SI.version()
    props = SI.IndexProperty_Create()
    SI.IndexProperty_SetIndexType(props, SI.RT_RTree)
    SI.IndexProperty_SetIndexStorage(props, SI.RT_Memory)
    idx = SI.Index_Create(props)
    SI.IndexProperty_Destroy(props)
    @test Bool(SI.Index_IsValid(idx))

    # load()
    min = [0.5, 0.5]
    max = [0.5, 0.5]
    SI.Index_InsertData(idx, 1, min, max, UInt32(2), Ptr{UInt8}(C_NULL), Int32(0))

    # query()
    min = [0.0, 0.0]
    max = [1.0, 1.0]
    ndims = UInt32(2)
    nresults = Ref{UInt}()
    SI.Index_Intersects_count(idx, min, max, ndims, nresults)
    @test nresults[] == 1

    # bounds()
    pmins = zeros(2)
    pmaxs = zeros(2)
    ndims = Ref{UInt32}()
    SI.Index_GetBounds(idx, pointer(pmins), pointer(pmaxs), ndims);
    @test ndims[] == 2
end
