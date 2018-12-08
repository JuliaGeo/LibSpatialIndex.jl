@enum RTError::Int32 RT_None = 0 RT_Debug = 1 RT_Warning = 2 RT_Failure = 3 RT_Fatal = 4
@enum RTIndexType::Int32 RT_RTree = 0 RT_MVRTree = 1 RT_TPRTree = 2 RT_InvalidIndexType = -99
@enum RTStorageType::Int32 RT_Memory = 0 RT_Disk = 1 RT_Custom = 2 RT_InvalidStorageType = -99
@enum RTIndexVariant::Int32 RT_Linear = 0 RT_Quadratic = 1 RT_Star = 2 RT_InvalidIndexVariant = -99

IndexH = Ptr{Nothing}
IndexItemH = Ptr{Nothing}
IndexPropertyH = Ptr{Nothing}