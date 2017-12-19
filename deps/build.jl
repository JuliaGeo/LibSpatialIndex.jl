using BinDeps

@BinDeps.setup

libspatialindex = library_dependency("libspatialindex",
    aliases=["libspatialindex_c", "spatialindex_c-64", "spatialindex_c"])
version = v"1.8.5"

if is_unix()
    url = "http://download.osgeo.org/libspatialindex/"
    spatialindexname = "spatialindex-src-$version"
    srcdir = joinpath(BinDeps.depsdir(libspatialindex), "src", spatialindexname)
    provides(Sources, URI("http://download.osgeo.org/libspatialindex/$spatialindexname.tar.gz"),
             libspatialindex, os=:Unix)
    provides(SimpleBuild,
        (@build_steps begin
            GetSources(libspatialindex)
            @build_steps begin
                ChangeDirectory(srcdir)
                `./configure`
                `make`
                `make install`
            end
        end), libspatialindex, os=:Unix)
end

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
