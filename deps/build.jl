using BinDeps

@BinDeps.setup

const version = v"1.8.5"

function version_check(name, handle)
    fptr = Libdl.dlsym_e(handle, :SIDX_Version)
    if fptr == C_NULL  # lookup failure
        return false
    end
    versionptr = ccall(fptr, Cstring, ())
    versionstring = unsafe_string(versionptr)
    foundversion = convert(VersionNumber, versionstring)
    foundversion >= version
end

libspatialindex = library_dependency("libspatialindex",
    aliases=["libspatialindex_c", "spatialindex_c-64", "spatialindex_c"],
    validate=version_check)

if is_unix()
    url = "http://download.osgeo.org/libspatialindex/"
    spatialindexname = "spatialindex-src-$version"
    srcdir = joinpath(BinDeps.depsdir(libspatialindex), "src", spatialindexname)
    usrdir = joinpath(BinDeps.depsdir(libspatialindex), "usr")
    provides(Sources, URI("$url$spatialindexname.tar.gz"),
             libspatialindex, os=:Unix)
    provides(SimpleBuild,
        (@build_steps begin
            GetSources(libspatialindex)
            @build_steps begin
                ChangeDirectory(srcdir)
                `./configure --prefix=$usrdir`
                `make`
                `make install`
            end
        end), libspatialindex, os=:Unix)
end

if is_windows()
    url = "http://download.osgeo.org/libspatialindex/"
    archive = "libspatialindex-$version-win-msvc-2013-x64.zip"
    uri = URI("$url$archive")
    libpath = joinpath(BinDeps.depsdir(libspatialindex), "libspatialindex", "build", "bin")
    provides(Binaries, uri, libspatialindex,
        unpacked_dir=".", installed_libpath=libpath, os=:Windows)
end

if is_apple()
    using Homebrew
    provides(Homebrew.HB, "spatialindex", libspatialindex, os = :Darwin)
end

@BinDeps.install Dict(:libspatialindex => :libspatialindex)
