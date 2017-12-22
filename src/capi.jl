module C

    const depfile = joinpath(@__DIR__, "..", "deps", "deps.jl")
    if isfile(depfile)
        include(depfile)
    else
        error("libspatialindex not properly installed. Please run Pkg.build(\"LibSpatialIndex\")")
    end

    include("include/sidx_config.jl")
    include("include/sidx_api.jl")

end
