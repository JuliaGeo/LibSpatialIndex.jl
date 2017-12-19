using BinDeps

@BinDeps.setup

libspatialindex = library_dependency("libspatialindex", aliases=["spatialindex_c-64","libspatialindex_c"])
version = v"1.8.5"

provides(Sources, URI("http://download.osgeo.org/libspatialindex/spatialindex-src-$version.tar.gz"),
    libspatialindex, os=:Unix)

prefix=joinpath(BinDeps.depsdir(libspatialindex),"usr")
patchdir=BinDeps.depsdir(libspatialindex)
srcdir = joinpath(BinDeps.depsdir(libspatialindex),"src","spatialindex-src-$version")

provides(SimpleBuild,
    (@build_steps begin
        GetSources(libspatialindex)
        @build_steps begin
            ChangeDirectory(srcdir)
            `make`
            `make install`
        end
    end), libspatialindex, os=:Unix)

if is_windows()
    url = "http://download.osgeo.org/libspatialindex/"
    archive = "libspatialindex-$version-win-msvc-2013-x64.zip"
    uri = URI("http://download.osgeo.org/libspatialindex/$archive")
    libpath = joinpath(BinDeps.depsdir(libspatialindex), "libspatialindex", "build", "bin")
    provides(Binaries, uri, libspatialindex,
        unpacked_dir=".", installed_libpath=libpath, os=:Windows)
end

if is_apple()
    using Homebrew
    provides(Homebrew.HB, "spatialindex", libspatialindex, os = :Darwin)
end

@BinDeps.install Dict(:libspatialindex => :libspatialindex)
