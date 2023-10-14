using Clang
using Clang.Generators
using LibSpatialIndex_jll

# several functions for building docstrings
includedir = joinpath(LibSpatialIndex_jll.artifact_dir, "include/spatialindex/capi")
headerfiles = joinpath.(includedir, ["sidx_api.h", "sidx_config.h"])
for headerfile in headerfiles
    if !isfile(headerfile)
        error("Header file missing `($headerfile)")
    end
end

options = load_options(joinpath(@__DIR__, "generator.toml"))

# add compiler flags, e.g. "-DXXXXXXXXX"
args = get_default_args()
push!(args, "-I$includedir")

# create context
ctx = create_context(headerfiles, args, options)

# run generator
build!(ctx)

close(loghandle)
