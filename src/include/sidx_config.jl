const Tools_PropertySet = Cvoid

const IndexPropertyH = Ptr{Tools_PropertySet}

const IndexS = Cvoid

const IndexH = Ptr{IndexS}

@enum RTError::UInt32 begin
    RT_None = 0
    RT_Debug = 1
    RT_Warning = 2
    RT_Failure = 3
    RT_Fatal = 4
end

const SpatialIndex_IData = Cvoid

const IndexItemH = Ptr{SpatialIndex_IData}

@enum RTIndexType::Int32 begin
    RT_RTree = 0
    RT_MVRTree = 1
    RT_TPRTree = 2
    RT_InvalidIndexType = -99
end

@enum RTIndexVariant::Int32 begin
    RT_Linear = 0
    RT_Quadratic = 1
    RT_Star = 2
    RT_InvalidIndexVariant = -99
end

@enum RTStorageType::Int32 begin
    RT_Memory = 0
    RT_Disk = 1
    RT_Custom = 2
    RT_InvalidStorageType = -99
end

