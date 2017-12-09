module LibSpatialIndex

    include("capi.jl")

    version() = unsafe_string(SIDX_Version())

end # module
