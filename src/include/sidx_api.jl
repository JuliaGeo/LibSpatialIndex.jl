function Index_Create(properties)
    @ccall libspatialindex_c.Index_Create(properties::IndexPropertyH)::IndexH
end

function Index_CreateWithStream(properties, readNext)
    @ccall libspatialindex_c.Index_CreateWithStream(properties::IndexPropertyH, readNext::Ptr{Cvoid})::IndexH
end

function Index_Destroy(index)
    @ccall libspatialindex_c.Index_Destroy(index::IndexH)::Cvoid
end

function Index_GetProperties(index)
    @ccall libspatialindex_c.Index_GetProperties(index::IndexH)::IndexPropertyH
end

function Index_DeleteData(index, id, pdMin, pdMax, nDimension)
    @ccall libspatialindex_c.Index_DeleteData(index::IndexH, id::Int64, pdMin::Ptr{Cdouble}, pdMax::Ptr{Cdouble}, nDimension::UInt32)::RTError
end

function Index_DeleteTPData(index, id, pdMin, pdMax, pdVMin, pdVMax, tStart, tEnd, nDimension)
    @ccall libspatialindex_c.Index_DeleteTPData(index::IndexH, id::Int64, pdMin::Ptr{Cdouble}, pdMax::Ptr{Cdouble}, pdVMin::Ptr{Cdouble}, pdVMax::Ptr{Cdouble}, tStart::Cdouble, tEnd::Cdouble, nDimension::UInt32)::RTError
end

function Index_DeleteMVRData(index, id, pdMin, pdMax, tStart, tEnd, nDimension)
    @ccall libspatialindex_c.Index_DeleteMVRData(index::IndexH, id::Int64, pdMin::Ptr{Cdouble}, pdMax::Ptr{Cdouble}, tStart::Cdouble, tEnd::Cdouble, nDimension::UInt32)::RTError
end

function Index_InsertData(index, id, pdMin, pdMax, nDimension, pData, nDataLength)
    @ccall libspatialindex_c.Index_InsertData(index::IndexH, id::Int64, pdMin::Ptr{Cdouble}, pdMax::Ptr{Cdouble}, nDimension::UInt32, pData::Ptr{UInt8}, nDataLength::Cint)::RTError
end

function Index_InsertTPData(index, id, pdMin, pdMax, pdVMin, pdVMax, tStart, tEnd, nDimension, pData, nDataLength)
    @ccall libspatialindex_c.Index_InsertTPData(index::IndexH, id::Int64, pdMin::Ptr{Cdouble}, pdMax::Ptr{Cdouble}, pdVMin::Ptr{Cdouble}, pdVMax::Ptr{Cdouble}, tStart::Cdouble, tEnd::Cdouble, nDimension::UInt32, pData::Ptr{UInt8}, nDataLength::Cint)::RTError
end

function Index_InsertMVRData(index, id, pdMin, pdMax, tStart, tEnd, nDimension, pData, nDataLength)
    @ccall libspatialindex_c.Index_InsertMVRData(index::IndexH, id::Int64, pdMin::Ptr{Cdouble}, pdMax::Ptr{Cdouble}, tStart::Cdouble, tEnd::Cdouble, nDimension::UInt32, pData::Ptr{UInt8}, nDataLength::Cint)::RTError
end

function Index_IsValid(index)
    @ccall libspatialindex_c.Index_IsValid(index::IndexH)::UInt32
end

function Index_TPIntersects_obj(index, pdMin, pdMax, pdVMin, pdVMax, tStart, tEnd, nDimension, items, nResults)
    @ccall libspatialindex_c.Index_TPIntersects_obj(index::IndexH, pdMin::Ptr{Cdouble}, pdMax::Ptr{Cdouble}, pdVMin::Ptr{Cdouble}, pdVMax::Ptr{Cdouble}, tStart::Cdouble, tEnd::Cdouble, nDimension::UInt32, items::Ptr{Ptr{IndexItemH}}, nResults::Ptr{UInt64})::RTError
end

function Index_MVRIntersects_obj(index, pdMin, pdMax, tStart, tEnd, nDimension, items, nResults)
    @ccall libspatialindex_c.Index_MVRIntersects_obj(index::IndexH, pdMin::Ptr{Cdouble}, pdMax::Ptr{Cdouble}, tStart::Cdouble, tEnd::Cdouble, nDimension::UInt32, items::Ptr{Ptr{IndexItemH}}, nResults::Ptr{UInt64})::RTError
end

function Index_Intersects_obj(index, pdMin, pdMax, nDimension, items, nResults)
    @ccall libspatialindex_c.Index_Intersects_obj(index::IndexH, pdMin::Ptr{Cdouble}, pdMax::Ptr{Cdouble}, nDimension::UInt32, items::Ptr{Ptr{IndexItemH}}, nResults::Ptr{UInt64})::RTError
end

function Index_Contains_obj(index, pdMin, pdMax, nDimension, items, nResults)
    @ccall libspatialindex_c.Index_Contains_obj(index::IndexH, pdMin::Ptr{Cdouble}, pdMax::Ptr{Cdouble}, nDimension::UInt32, items::Ptr{Ptr{IndexItemH}}, nResults::Ptr{UInt64})::RTError
end

function Index_TPIntersects_id(index, pdMin, pdMax, pdVMin, pdVMax, tStart, tEnd, nDimension, ids, nResults)
    @ccall libspatialindex_c.Index_TPIntersects_id(index::IndexH, pdMin::Ptr{Cdouble}, pdMax::Ptr{Cdouble}, pdVMin::Ptr{Cdouble}, pdVMax::Ptr{Cdouble}, tStart::Cdouble, tEnd::Cdouble, nDimension::UInt32, ids::Ptr{Ptr{Int64}}, nResults::Ptr{UInt64})::RTError
end

function Index_MVRIntersects_id(index, pdMin, pdMax, tStart, tEnd, nDimension, ids, nResults)
    @ccall libspatialindex_c.Index_MVRIntersects_id(index::IndexH, pdMin::Ptr{Cdouble}, pdMax::Ptr{Cdouble}, tStart::Cdouble, tEnd::Cdouble, nDimension::UInt32, ids::Ptr{Ptr{Int64}}, nResults::Ptr{UInt64})::RTError
end

function Index_Intersects_id(index, pdMin, pdMax, nDimension, items, nResults)
    @ccall libspatialindex_c.Index_Intersects_id(index::IndexH, pdMin::Ptr{Cdouble}, pdMax::Ptr{Cdouble}, nDimension::UInt32, items::Ptr{Ptr{Int64}}, nResults::Ptr{UInt64})::RTError
end

function Index_Contains_id(index, pdMin, pdMax, nDimension, ids, nResults)
    @ccall libspatialindex_c.Index_Contains_id(index::IndexH, pdMin::Ptr{Cdouble}, pdMax::Ptr{Cdouble}, nDimension::UInt32, ids::Ptr{Ptr{Int64}}, nResults::Ptr{UInt64})::RTError
end

function Index_TPIntersects_count(index, pdMin, pdMax, pdVMin, pdVMax, tStart, tEnd, nDimension, nResults)
    @ccall libspatialindex_c.Index_TPIntersects_count(index::IndexH, pdMin::Ptr{Cdouble}, pdMax::Ptr{Cdouble}, pdVMin::Ptr{Cdouble}, pdVMax::Ptr{Cdouble}, tStart::Cdouble, tEnd::Cdouble, nDimension::UInt32, nResults::Ptr{UInt64})::RTError
end

function Index_MVRIntersects_count(index, pdMin, pdMax, tStart, tEnd, nDimension, nResults)
    @ccall libspatialindex_c.Index_MVRIntersects_count(index::IndexH, pdMin::Ptr{Cdouble}, pdMax::Ptr{Cdouble}, tStart::Cdouble, tEnd::Cdouble, nDimension::UInt32, nResults::Ptr{UInt64})::RTError
end

function Index_Intersects_count(index, pdMin, pdMax, nDimension, nResults)
    @ccall libspatialindex_c.Index_Intersects_count(index::IndexH, pdMin::Ptr{Cdouble}, pdMax::Ptr{Cdouble}, nDimension::UInt32, nResults::Ptr{UInt64})::RTError
end

function Index_Contains_count(index, pdMin, pdMax, nDimension, nResults)
    @ccall libspatialindex_c.Index_Contains_count(index::IndexH, pdMin::Ptr{Cdouble}, pdMax::Ptr{Cdouble}, nDimension::UInt32, nResults::Ptr{UInt64})::RTError
end

function Index_TPNearestNeighbors_obj(index, pdMin, pdMax, pdVMin, pdVMax, tStart, tEnd, nDimension, items, nResults)
    @ccall libspatialindex_c.Index_TPNearestNeighbors_obj(index::IndexH, pdMin::Ptr{Cdouble}, pdMax::Ptr{Cdouble}, pdVMin::Ptr{Cdouble}, pdVMax::Ptr{Cdouble}, tStart::Cdouble, tEnd::Cdouble, nDimension::UInt32, items::Ptr{Ptr{IndexItemH}}, nResults::Ptr{UInt64})::RTError
end

function Index_MVRNearestNeighbors_obj(index, pdMin, pdMax, tStart, tEnd, nDimension, items, nResults)
    @ccall libspatialindex_c.Index_MVRNearestNeighbors_obj(index::IndexH, pdMin::Ptr{Cdouble}, pdMax::Ptr{Cdouble}, tStart::Cdouble, tEnd::Cdouble, nDimension::UInt32, items::Ptr{Ptr{IndexItemH}}, nResults::Ptr{UInt64})::RTError
end

function Index_NearestNeighbors_obj(index, pdMin, pdMax, nDimension, items, nResults)
    @ccall libspatialindex_c.Index_NearestNeighbors_obj(index::IndexH, pdMin::Ptr{Cdouble}, pdMax::Ptr{Cdouble}, nDimension::UInt32, items::Ptr{Ptr{IndexItemH}}, nResults::Ptr{UInt64})::RTError
end

function Index_TPNearestNeighbors_id(index, pdMin, pdMax, pdVMin, pdVMax, tStart, tEnd, nDimension, ids, nResults)
    @ccall libspatialindex_c.Index_TPNearestNeighbors_id(index::IndexH, pdMin::Ptr{Cdouble}, pdMax::Ptr{Cdouble}, pdVMin::Ptr{Cdouble}, pdVMax::Ptr{Cdouble}, tStart::Cdouble, tEnd::Cdouble, nDimension::UInt32, ids::Ptr{Ptr{Int64}}, nResults::Ptr{UInt64})::RTError
end

function Index_MVRNearestNeighbors_id(index, pdMin, pdMax, tStart, tEnd, nDimension, ids, nResults)
    @ccall libspatialindex_c.Index_MVRNearestNeighbors_id(index::IndexH, pdMin::Ptr{Cdouble}, pdMax::Ptr{Cdouble}, tStart::Cdouble, tEnd::Cdouble, nDimension::UInt32, ids::Ptr{Ptr{Int64}}, nResults::Ptr{UInt64})::RTError
end

function Index_NearestNeighbors_id(index, pdMin, pdMax, nDimension, items, nResults)
    @ccall libspatialindex_c.Index_NearestNeighbors_id(index::IndexH, pdMin::Ptr{Cdouble}, pdMax::Ptr{Cdouble}, nDimension::UInt32, items::Ptr{Ptr{Int64}}, nResults::Ptr{UInt64})::RTError
end

function Index_Intersects_internal(index, pdMin, pdMax, nDimension, items, nResults)
    @ccall libspatialindex_c.Index_Intersects_internal(index::IndexH, pdMin::Ptr{Cdouble}, pdMax::Ptr{Cdouble}, nDimension::UInt32, items::Ptr{Ptr{IndexItemH}}, nResults::Ptr{UInt64})::RTError
end

function Index_GetBounds(index, ppdMin, ppdMax, nDimension)
    @ccall libspatialindex_c.Index_GetBounds(index::IndexH, ppdMin::Ptr{Ptr{Cdouble}}, ppdMax::Ptr{Ptr{Cdouble}}, nDimension::Ptr{UInt32})::RTError
end

function Index_GetLeaves(index, nLeafNodes, nLeafSizes, nLeafIDs, nLeafChildIDs, pppdMin, pppdMax, nDimension)
    @ccall libspatialindex_c.Index_GetLeaves(index::IndexH, nLeafNodes::Ptr{UInt32}, nLeafSizes::Ptr{Ptr{UInt32}}, nLeafIDs::Ptr{Ptr{Int64}}, nLeafChildIDs::Ptr{Ptr{Ptr{Int64}}}, pppdMin::Ptr{Ptr{Ptr{Cdouble}}}, pppdMax::Ptr{Ptr{Ptr{Cdouble}}}, nDimension::Ptr{UInt32})::RTError
end

function Index_SetResultSetOffset(index, value)
    @ccall libspatialindex_c.Index_SetResultSetOffset(index::IndexH, value::Int64)::RTError
end

function Index_GetResultSetOffset(index)
    @ccall libspatialindex_c.Index_GetResultSetOffset(index::IndexH)::Int64
end

function Index_SetResultSetLimit(index, value)
    @ccall libspatialindex_c.Index_SetResultSetLimit(index::IndexH, value::Int64)::RTError
end

function Index_GetResultSetLimit(index)
    @ccall libspatialindex_c.Index_GetResultSetLimit(index::IndexH)::Int64
end

function Index_DestroyObjResults(results, nResults)
    @ccall libspatialindex_c.Index_DestroyObjResults(results::Ptr{IndexItemH}, nResults::UInt32)::Cvoid
end

function Index_ClearBuffer(index)
    @ccall libspatialindex_c.Index_ClearBuffer(index::IndexH)::Cvoid
end

function Index_Free(object)
    @ccall libspatialindex_c.Index_Free(object::Ptr{Cvoid})::Cvoid
end

function Index_Flush(index)
    @ccall libspatialindex_c.Index_Flush(index::IndexH)::Cvoid
end

function IndexItem_Destroy(item)
    @ccall libspatialindex_c.IndexItem_Destroy(item::IndexItemH)::Cvoid
end

function IndexItem_GetID(item)
    @ccall libspatialindex_c.IndexItem_GetID(item::IndexItemH)::Int64
end

function IndexItem_GetData(item, data, length)
    @ccall libspatialindex_c.IndexItem_GetData(item::IndexItemH, data::Ptr{Ptr{UInt8}}, length::Ptr{UInt64})::RTError
end

function IndexItem_GetBounds(item, ppdMin, ppdMax, nDimension)
    @ccall libspatialindex_c.IndexItem_GetBounds(item::IndexItemH, ppdMin::Ptr{Ptr{Cdouble}}, ppdMax::Ptr{Ptr{Cdouble}}, nDimension::Ptr{UInt32})::RTError
end

function IndexProperty_Create()
    @ccall libspatialindex_c.IndexProperty_Create()::IndexPropertyH
end

function IndexProperty_Destroy(hProp)
    @ccall libspatialindex_c.IndexProperty_Destroy(hProp::IndexPropertyH)::Cvoid
end

function IndexProperty_SetIndexType(iprop, value)
    @ccall libspatialindex_c.IndexProperty_SetIndexType(iprop::IndexPropertyH, value::RTIndexType)::RTError
end

function IndexProperty_GetIndexType(iprop)
    @ccall libspatialindex_c.IndexProperty_GetIndexType(iprop::IndexPropertyH)::RTIndexType
end

function IndexProperty_SetDimension(iprop, value)
    @ccall libspatialindex_c.IndexProperty_SetDimension(iprop::IndexPropertyH, value::UInt32)::RTError
end

function IndexProperty_GetDimension(iprop)
    @ccall libspatialindex_c.IndexProperty_GetDimension(iprop::IndexPropertyH)::UInt32
end

function IndexProperty_SetIndexVariant(iprop, value)
    @ccall libspatialindex_c.IndexProperty_SetIndexVariant(iprop::IndexPropertyH, value::RTIndexVariant)::RTError
end

function IndexProperty_GetIndexVariant(iprop)
    @ccall libspatialindex_c.IndexProperty_GetIndexVariant(iprop::IndexPropertyH)::RTIndexVariant
end

function IndexProperty_SetIndexStorage(iprop, value)
    @ccall libspatialindex_c.IndexProperty_SetIndexStorage(iprop::IndexPropertyH, value::RTStorageType)::RTError
end

function IndexProperty_GetIndexStorage(iprop)
    @ccall libspatialindex_c.IndexProperty_GetIndexStorage(iprop::IndexPropertyH)::RTStorageType
end

function IndexProperty_SetPagesize(iprop, value)
    @ccall libspatialindex_c.IndexProperty_SetPagesize(iprop::IndexPropertyH, value::UInt32)::RTError
end

function IndexProperty_GetPagesize(iprop)
    @ccall libspatialindex_c.IndexProperty_GetPagesize(iprop::IndexPropertyH)::UInt32
end

function IndexProperty_SetIndexCapacity(iprop, value)
    @ccall libspatialindex_c.IndexProperty_SetIndexCapacity(iprop::IndexPropertyH, value::UInt32)::RTError
end

function IndexProperty_GetIndexCapacity(iprop)
    @ccall libspatialindex_c.IndexProperty_GetIndexCapacity(iprop::IndexPropertyH)::UInt32
end

function IndexProperty_SetLeafCapacity(iprop, value)
    @ccall libspatialindex_c.IndexProperty_SetLeafCapacity(iprop::IndexPropertyH, value::UInt32)::RTError
end

function IndexProperty_GetLeafCapacity(iprop)
    @ccall libspatialindex_c.IndexProperty_GetLeafCapacity(iprop::IndexPropertyH)::UInt32
end

function IndexProperty_SetLeafPoolCapacity(iprop, value)
    @ccall libspatialindex_c.IndexProperty_SetLeafPoolCapacity(iprop::IndexPropertyH, value::UInt32)::RTError
end

function IndexProperty_GetLeafPoolCapacity(iprop)
    @ccall libspatialindex_c.IndexProperty_GetLeafPoolCapacity(iprop::IndexPropertyH)::UInt32
end

function IndexProperty_SetIndexPoolCapacity(iprop, value)
    @ccall libspatialindex_c.IndexProperty_SetIndexPoolCapacity(iprop::IndexPropertyH, value::UInt32)::RTError
end

function IndexProperty_GetIndexPoolCapacity(iprop)
    @ccall libspatialindex_c.IndexProperty_GetIndexPoolCapacity(iprop::IndexPropertyH)::UInt32
end

function IndexProperty_SetRegionPoolCapacity(iprop, value)
    @ccall libspatialindex_c.IndexProperty_SetRegionPoolCapacity(iprop::IndexPropertyH, value::UInt32)::RTError
end

function IndexProperty_GetRegionPoolCapacity(iprop)
    @ccall libspatialindex_c.IndexProperty_GetRegionPoolCapacity(iprop::IndexPropertyH)::UInt32
end

function IndexProperty_SetPointPoolCapacity(iprop, value)
    @ccall libspatialindex_c.IndexProperty_SetPointPoolCapacity(iprop::IndexPropertyH, value::UInt32)::RTError
end

function IndexProperty_GetPointPoolCapacity(iprop)
    @ccall libspatialindex_c.IndexProperty_GetPointPoolCapacity(iprop::IndexPropertyH)::UInt32
end

function IndexProperty_SetBufferingCapacity(iprop, value)
    @ccall libspatialindex_c.IndexProperty_SetBufferingCapacity(iprop::IndexPropertyH, value::UInt32)::RTError
end

function IndexProperty_GetBufferingCapacity(iprop)
    @ccall libspatialindex_c.IndexProperty_GetBufferingCapacity(iprop::IndexPropertyH)::UInt32
end

function IndexProperty_SetEnsureTightMBRs(iprop, value)
    @ccall libspatialindex_c.IndexProperty_SetEnsureTightMBRs(iprop::IndexPropertyH, value::UInt32)::RTError
end

function IndexProperty_GetEnsureTightMBRs(iprop)
    @ccall libspatialindex_c.IndexProperty_GetEnsureTightMBRs(iprop::IndexPropertyH)::UInt32
end

function IndexProperty_SetOverwrite(iprop, value)
    @ccall libspatialindex_c.IndexProperty_SetOverwrite(iprop::IndexPropertyH, value::UInt32)::RTError
end

function IndexProperty_GetOverwrite(iprop)
    @ccall libspatialindex_c.IndexProperty_GetOverwrite(iprop::IndexPropertyH)::UInt32
end

function IndexProperty_SetNearMinimumOverlapFactor(iprop, value)
    @ccall libspatialindex_c.IndexProperty_SetNearMinimumOverlapFactor(iprop::IndexPropertyH, value::UInt32)::RTError
end

function IndexProperty_GetNearMinimumOverlapFactor(iprop)
    @ccall libspatialindex_c.IndexProperty_GetNearMinimumOverlapFactor(iprop::IndexPropertyH)::UInt32
end

function IndexProperty_SetWriteThrough(iprop, value)
    @ccall libspatialindex_c.IndexProperty_SetWriteThrough(iprop::IndexPropertyH, value::UInt32)::RTError
end

function IndexProperty_GetWriteThrough(iprop)
    @ccall libspatialindex_c.IndexProperty_GetWriteThrough(iprop::IndexPropertyH)::UInt32
end

function IndexProperty_SetFillFactor(iprop, value)
    @ccall libspatialindex_c.IndexProperty_SetFillFactor(iprop::IndexPropertyH, value::Cdouble)::RTError
end

function IndexProperty_GetFillFactor(iprop)
    @ccall libspatialindex_c.IndexProperty_GetFillFactor(iprop::IndexPropertyH)::Cdouble
end

function IndexProperty_SetSplitDistributionFactor(iprop, value)
    @ccall libspatialindex_c.IndexProperty_SetSplitDistributionFactor(iprop::IndexPropertyH, value::Cdouble)::RTError
end

function IndexProperty_GetSplitDistributionFactor(iprop)
    @ccall libspatialindex_c.IndexProperty_GetSplitDistributionFactor(iprop::IndexPropertyH)::Cdouble
end

function IndexProperty_SetTPRHorizon(iprop, value)
    @ccall libspatialindex_c.IndexProperty_SetTPRHorizon(iprop::IndexPropertyH, value::Cdouble)::RTError
end

function IndexProperty_GetTPRHorizon(iprop)
    @ccall libspatialindex_c.IndexProperty_GetTPRHorizon(iprop::IndexPropertyH)::Cdouble
end

function IndexProperty_SetReinsertFactor(iprop, value)
    @ccall libspatialindex_c.IndexProperty_SetReinsertFactor(iprop::IndexPropertyH, value::Cdouble)::RTError
end

function IndexProperty_GetReinsertFactor(iprop)
    @ccall libspatialindex_c.IndexProperty_GetReinsertFactor(iprop::IndexPropertyH)::Cdouble
end

function IndexProperty_SetFileName(iprop, value)
    @ccall libspatialindex_c.IndexProperty_SetFileName(iprop::IndexPropertyH, value::Cstring)::RTError
end

function IndexProperty_GetFileName(iprop)
    @ccall libspatialindex_c.IndexProperty_GetFileName(iprop::IndexPropertyH)::Cstring
end

function IndexProperty_SetFileNameExtensionDat(iprop, value)
    @ccall libspatialindex_c.IndexProperty_SetFileNameExtensionDat(iprop::IndexPropertyH, value::Cstring)::RTError
end

function IndexProperty_GetFileNameExtensionDat(iprop)
    @ccall libspatialindex_c.IndexProperty_GetFileNameExtensionDat(iprop::IndexPropertyH)::Cstring
end

function IndexProperty_SetFileNameExtensionIdx(iprop, value)
    @ccall libspatialindex_c.IndexProperty_SetFileNameExtensionIdx(iprop::IndexPropertyH, value::Cstring)::RTError
end

function IndexProperty_GetFileNameExtensionIdx(iprop)
    @ccall libspatialindex_c.IndexProperty_GetFileNameExtensionIdx(iprop::IndexPropertyH)::Cstring
end

function IndexProperty_SetCustomStorageCallbacksSize(iprop, value)
    @ccall libspatialindex_c.IndexProperty_SetCustomStorageCallbacksSize(iprop::IndexPropertyH, value::UInt32)::RTError
end

function IndexProperty_GetCustomStorageCallbacksSize(iprop)
    @ccall libspatialindex_c.IndexProperty_GetCustomStorageCallbacksSize(iprop::IndexPropertyH)::UInt32
end

function IndexProperty_SetCustomStorageCallbacks(iprop, value)
    @ccall libspatialindex_c.IndexProperty_SetCustomStorageCallbacks(iprop::IndexPropertyH, value::Ptr{Cvoid})::RTError
end

function IndexProperty_GetCustomStorageCallbacks(iprop)
    @ccall libspatialindex_c.IndexProperty_GetCustomStorageCallbacks(iprop::IndexPropertyH)::Ptr{Cvoid}
end

function IndexProperty_SetIndexID(iprop, value)
    @ccall libspatialindex_c.IndexProperty_SetIndexID(iprop::IndexPropertyH, value::Int64)::RTError
end

function IndexProperty_GetIndexID(iprop)
    @ccall libspatialindex_c.IndexProperty_GetIndexID(iprop::IndexPropertyH)::Int64
end

function SIDX_NewBuffer(bytes)
    @ccall libspatialindex_c.SIDX_NewBuffer(bytes::Cint)::Ptr{Cvoid}
end

function SIDX_DeleteBuffer(buffer)
    @ccall libspatialindex_c.SIDX_DeleteBuffer(buffer::Ptr{Cvoid})::Cvoid
end

function IndexProperty_SetResultSetLimit(iprop, value)
    @ccall libspatialindex_c.IndexProperty_SetResultSetLimit(iprop::IndexPropertyH, value::UInt64)::RTError
end

function IndexProperty_GetResultSetLimit(iprop)
    @ccall libspatialindex_c.IndexProperty_GetResultSetLimit(iprop::IndexPropertyH)::UInt64
end

function SIDX_Version()
    @ccall libspatialindex_c.SIDX_Version()::Cstring
end

function Error_GetLastErrorMsg()
    @ccall libspatialindex_c.Error_GetLastErrorMsg()::Cstring
end

