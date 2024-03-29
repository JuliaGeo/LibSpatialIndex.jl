# LibSpatialIndex

[![CI](https://github.com/JuliaGeo/LibSpatialIndex.jl/workflows/CI/badge.svg)](https://github.com/JuliaGeo/LibSpatialIndex.jl/actions?query=workflow%3ACI)
[![Coverage Status](https://coveralls.io/repos/github/JuliaGeo/LibSpatialIndex.jl/badge.svg?branch=master&service=github)](https://coveralls.io/github/JuliaGeo/LibSpatialIndex.jl?branch=master)

LibSpatialIndex.jl is a julia wrapper around the C API of [libspatialindex](https://github.com/libspatialindex/libspatialindex), for spatially indexing kD bounding box data.  The Julia library (JLL) package is produced by the script at https://github.com/JuliaPackaging/Yggdrasil/tree/master/L/LibSpatialIndex and the resulting binary artifact is downloaded from https://github.com/JuliaBinaryWrappers/LibSpatialIndex_jll.jl.

# Quick Guide

A new RTree with 2 dimensions can be created using this package as follows:

```julia
import LibSpatialIndex
rtree = LibSpatialIndex.RTree(2)
```

## Insertion

Items can be inserted using the `insert!` method, where:

```julia
LibSpatialIndex.insert!(rtree, 1, [0.0, 0.0], [1.0, 1.0])
LibSpatialIndex.insert!(rtree, 2, Extexts.Extent(X=(0.0, 2.0), (0.0, 2.0)))
```

inserts two items,

- the first with `id` 1, associated with the box specified by `[xmin=0.0,ymin=0.0]` and `[xmax=1.0,ymax=1.0]`.
- the second with `id` 2, associated with the box specified by `[xmin=0.0,ymin=0.0]` and `[xmax=2.0,ymax=2.0]`.

## Queries

Thereafter, you can perform queries on the `rtree` using either (i) `intersects(rtree, minvalues, maxvalues)`
for all items intersecting the box specified by `minvalues` and `maxvalues`, or (ii)
`knn(rtree, minvalues, maxvalues, k)` for the `k` nearest items in `rtree` to the box
specified by `minvalues` and `maxvalues`.

### Intersection

So for instance:

```julia
LibSpatialIndex.intersects(rtree, [0.0, 0.0], [1.0, 1.0])
LibSpatialIndex.intersects(rtree, Extents.extent(X=(0.0, 1.0), Y=(0.0, 1.0)))
```

will return the vector `[1, 2]` on the `rtree` constructed earlier, to indicate that items
with ids `1` and `2` intersects the box specified by `[xmin=0.0, ymin=0.0]` and `[xmax=1.0, ymax=1.0]`.

Any GeoInterface.jl or Extents.jl compatible object can be used directly instead
of defining the `Extent` manually - the extent will either be detected or calculated.


You can also perform queries on any individual GeoInterface.jl compatible point, so: 

```julia
LibSpatialIndex.intersects(rtree, (1.0, 1.0))
```

will return the ids `[1, 2]` in the `rtree` constructed earlier, and:

```julia
LibSpatialIndex.intersects(rtree, [2.0, 2.0])
```

will only return the vector `[2]`, because item 1 does not contain the point `[2.0, 2.0]`.

### k Nearest Neighbors

For `knn` queries:

```julia
LibSpatialIndex.knn(rtree, [2.0, 2.0], 1)
```

returns the vector `[2]` because the item with id `2` is closest to the point `[2.0, 2.0]`, and

```julia
sort(LibSpatialIndex.knn(rtree, [2.0, 2.0], 2))
```

returns the vector `[1, 2]`. If the value of `k` exceeds the number of items in the `rtree`,
then fewer than `k` items will be returned, so:

```julia
sort(SI.knn(rtree, [2.0, 2.0], 3))
```

will return the vector `[1, 2]`.
