function Index_Create(properties)
    ccall((:Index_Create, libspatialindex_c), IndexH, (IndexPropertyH,), properties)
end

function Index_CreateWithStream(properties, readNext)
    ccall((:Index_CreateWithStream, libspatialindex_c), IndexH, (IndexPropertyH, Ptr{Cvoid}), properties, readNext)
end

function Index_Destroy(index)
    ccall((:Index_Destroy, libspatialindex_c), Cvoid, (IndexH,), index)
end

function Index_GetProperties(index)
    ccall((:Index_GetProperties, libspatialindex_c), IndexPropertyH, (IndexH,), index)
end

function Index_DeleteData(index, id, pdMin, pdMax, nDimension)
    ccall((:Index_DeleteData, libspatialindex_c), RTError, (IndexH, Int64, Ptr{Cdouble}, Ptr{Cdouble}, UInt32), index, id, pdMin, pdMax, nDimension)
end

function Index_DeleteTPData(index, id, pdMin, pdMax, pdVMin, pdVMax, tStart, tEnd, nDimension)
    ccall((:Index_DeleteTPData, libspatialindex_c), RTError, (IndexH, Int64, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Cdouble, Cdouble, UInt32), index, id, pdMin, pdMax, pdVMin, pdVMax, tStart, tEnd, nDimension)
end

function Index_DeleteMVRData(index, id, pdMin, pdMax, tStart, tEnd, nDimension)
    ccall((:Index_DeleteMVRData, libspatialindex_c), RTError, (IndexH, Int64, Ptr{Cdouble}, Ptr{Cdouble}, Cdouble, Cdouble, UInt32), index, id, pdMin, pdMax, tStart, tEnd, nDimension)
end

function Index_InsertData(index, id, pdMin, pdMax, nDimension, pData, nDataLength)
    ccall((:Index_InsertData, libspatialindex_c), RTError, (IndexH, Int64, Ptr{Cdouble}, Ptr{Cdouble}, UInt32, Ptr{UInt8}, Cint), index, id, pdMin, pdMax, nDimension, pData, nDataLength)
end

function Index_InsertTPData(index, id, pdMin, pdMax, pdVMin, pdVMax, tStart, tEnd, nDimension, pData, nDataLength)
    ccall((:Index_InsertTPData, libspatialindex_c), RTError, (IndexH, Int64, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Cdouble, Cdouble, UInt32, Ptr{UInt8}, Cint), index, id, pdMin, pdMax, pdVMin, pdVMax, tStart, tEnd, nDimension, pData, nDataLength)
end

function Index_InsertMVRData(index, id, pdMin, pdMax, tStart, tEnd, nDimension, pData, nDataLength)
    ccall((:Index_InsertMVRData, libspatialindex_c), RTError, (IndexH, Int64, Ptr{Cdouble}, Ptr{Cdouble}, Cdouble, Cdouble, UInt32, Ptr{UInt8}, Cint), index, id, pdMin, pdMax, tStart, tEnd, nDimension, pData, nDataLength)
end

function Index_IsValid(index)
    ccall((:Index_IsValid, libspatialindex_c), UInt32, (IndexH,), index)
end

function Index_TPIntersects_obj(index, pdMin, pdMax, pdVMin, pdVMax, tStart, tEnd, nDimension, items, nResults)
    ccall((:Index_TPIntersects_obj, libspatialindex_c), RTError, (IndexH, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Cdouble, Cdouble, UInt32, Ptr{Ptr{IndexItemH}}, Ptr{UInt64}), index, pdMin, pdMax, pdVMin, pdVMax, tStart, tEnd, nDimension, items, nResults)
end

function Index_MVRIntersects_obj(index, pdMin, pdMax, tStart, tEnd, nDimension, items, nResults)
    ccall((:Index_MVRIntersects_obj, libspatialindex_c), RTError, (IndexH, Ptr{Cdouble}, Ptr{Cdouble}, Cdouble, Cdouble, UInt32, Ptr{Ptr{IndexItemH}}, Ptr{UInt64}), index, pdMin, pdMax, tStart, tEnd, nDimension, items, nResults)
end

function Index_Intersects_obj(index, pdMin, pdMax, nDimension, items, nResults)
    ccall((:Index_Intersects_obj, libspatialindex_c), RTError, (IndexH, Ptr{Cdouble}, Ptr{Cdouble}, UInt32, Ptr{Ptr{IndexItemH}}, Ptr{UInt64}), index, pdMin, pdMax, nDimension, items, nResults)
end

function Index_Contains_obj(index, pdMin, pdMax, nDimension, items, nResults)
    ccall((:Index_Contains_obj, libspatialindex_c), RTError, (IndexH, Ptr{Cdouble}, Ptr{Cdouble}, UInt32, Ptr{Ptr{IndexItemH}}, Ptr{UInt64}), index, pdMin, pdMax, nDimension, items, nResults)
end

function Index_TPIntersects_id(index, pdMin, pdMax, pdVMin, pdVMax, tStart, tEnd, nDimension, ids, nResults)
    ccall((:Index_TPIntersects_id, libspatialindex_c), RTError, (IndexH, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Cdouble, Cdouble, UInt32, Ptr{Ptr{Int64}}, Ptr{UInt64}), index, pdMin, pdMax, pdVMin, pdVMax, tStart, tEnd, nDimension, ids, nResults)
end

function Index_MVRIntersects_id(index, pdMin, pdMax, tStart, tEnd, nDimension, ids, nResults)
    ccall((:Index_MVRIntersects_id, libspatialindex_c), RTError, (IndexH, Ptr{Cdouble}, Ptr{Cdouble}, Cdouble, Cdouble, UInt32, Ptr{Ptr{Int64}}, Ptr{UInt64}), index, pdMin, pdMax, tStart, tEnd, nDimension, ids, nResults)
end

function Index_Intersects_id(index, pdMin, pdMax, nDimension, items, nResults)
    ccall((:Index_Intersects_id, libspatialindex_c), RTError, (IndexH, Ptr{Cdouble}, Ptr{Cdouble}, UInt32, Ptr{Ptr{Int64}}, Ptr{UInt64}), index, pdMin, pdMax, nDimension, items, nResults)
end

function Index_Contains_id(index, pdMin, pdMax, nDimension, ids, nResults)
    ccall((:Index_Contains_id, libspatialindex_c), RTError, (IndexH, Ptr{Cdouble}, Ptr{Cdouble}, UInt32, Ptr{Ptr{Int64}}, Ptr{UInt64}), index, pdMin, pdMax, nDimension, ids, nResults)
end

function Index_TPIntersects_count(index, pdMin, pdMax, pdVMin, pdVMax, tStart, tEnd, nDimension, nResults)
    ccall((:Index_TPIntersects_count, libspatialindex_c), RTError, (IndexH, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Cdouble, Cdouble, UInt32, Ptr{UInt64}), index, pdMin, pdMax, pdVMin, pdVMax, tStart, tEnd, nDimension, nResults)
end

function Index_MVRIntersects_count(index, pdMin, pdMax, tStart, tEnd, nDimension, nResults)
    ccall((:Index_MVRIntersects_count, libspatialindex_c), RTError, (IndexH, Ptr{Cdouble}, Ptr{Cdouble}, Cdouble, Cdouble, UInt32, Ptr{UInt64}), index, pdMin, pdMax, tStart, tEnd, nDimension, nResults)
end

function Index_Intersects_count(index, pdMin, pdMax, nDimension, nResults)
    ccall((:Index_Intersects_count, libspatialindex_c), RTError, (IndexH, Ptr{Cdouble}, Ptr{Cdouble}, UInt32, Ptr{UInt64}), index, pdMin, pdMax, nDimension, nResults)
end

function Index_Contains_count(index, pdMin, pdMax, nDimension, nResults)
    ccall((:Index_Contains_count, libspatialindex_c), RTError, (IndexH, Ptr{Cdouble}, Ptr{Cdouble}, UInt32, Ptr{UInt64}), index, pdMin, pdMax, nDimension, nResults)
end

function Index_TPNearestNeighbors_obj(index, pdMin, pdMax, pdVMin, pdVMax, tStart, tEnd, nDimension, items, nResults)
    ccall((:Index_TPNearestNeighbors_obj, libspatialindex_c), RTError, (IndexH, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Cdouble, Cdouble, UInt32, Ptr{Ptr{IndexItemH}}, Ptr{UInt64}), index, pdMin, pdMax, pdVMin, pdVMax, tStart, tEnd, nDimension, items, nResults)
end

function Index_MVRNearestNeighbors_obj(index, pdMin, pdMax, tStart, tEnd, nDimension, items, nResults)
    ccall((:Index_MVRNearestNeighbors_obj, libspatialindex_c), RTError, (IndexH, Ptr{Cdouble}, Ptr{Cdouble}, Cdouble, Cdouble, UInt32, Ptr{Ptr{IndexItemH}}, Ptr{UInt64}), index, pdMin, pdMax, tStart, tEnd, nDimension, items, nResults)
end

function Index_NearestNeighbors_obj(index, pdMin, pdMax, nDimension, items, nResults)
    ccall((:Index_NearestNeighbors_obj, libspatialindex_c), RTError, (IndexH, Ptr{Cdouble}, Ptr{Cdouble}, UInt32, Ptr{Ptr{IndexItemH}}, Ptr{UInt64}), index, pdMin, pdMax, nDimension, items, nResults)
end

function Index_TPNearestNeighbors_id(index, pdMin, pdMax, pdVMin, pdVMax, tStart, tEnd, nDimension, ids, nResults)
    ccall((:Index_TPNearestNeighbors_id, libspatialindex_c), RTError, (IndexH, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Cdouble, Cdouble, UInt32, Ptr{Ptr{Int64}}, Ptr{UInt64}), index, pdMin, pdMax, pdVMin, pdVMax, tStart, tEnd, nDimension, ids, nResults)
end

function Index_MVRNearestNeighbors_id(index, pdMin, pdMax, tStart, tEnd, nDimension, ids, nResults)
    ccall((:Index_MVRNearestNeighbors_id, libspatialindex_c), RTError, (IndexH, Ptr{Cdouble}, Ptr{Cdouble}, Cdouble, Cdouble, UInt32, Ptr{Ptr{Int64}}, Ptr{UInt64}), index, pdMin, pdMax, tStart, tEnd, nDimension, ids, nResults)
end

function Index_NearestNeighbors_id(index, pdMin, pdMax, nDimension, items, nResults)
    ccall((:Index_NearestNeighbors_id, libspatialindex_c), RTError, (IndexH, Ptr{Cdouble}, Ptr{Cdouble}, UInt32, Ptr{Ptr{Int64}}, Ptr{UInt64}), index, pdMin, pdMax, nDimension, items, nResults)
end

function Index_Intersects_internal(index, pdMin, pdMax, nDimension, items, nResults)
    ccall((:Index_Intersects_internal, libspatialindex_c), RTError, (IndexH, Ptr{Cdouble}, Ptr{Cdouble}, UInt32, Ptr{Ptr{IndexItemH}}, Ptr{UInt64}), index, pdMin, pdMax, nDimension, items, nResults)
end

function Index_GetBounds(index, ppdMin, ppdMax, nDimension)
    ccall((:Index_GetBounds, libspatialindex_c), RTError, (IndexH, Ptr{Ptr{Cdouble}}, Ptr{Ptr{Cdouble}}, Ptr{UInt32}), index, ppdMin, ppdMax, nDimension)
end

function Index_GetLeaves(index, nLeafNodes, nLeafSizes, nLeafIDs, nLeafChildIDs, pppdMin, pppdMax, nDimension)
    ccall((:Index_GetLeaves, libspatialindex_c), RTError, (IndexH, Ptr{UInt32}, Ptr{Ptr{UInt32}}, Ptr{Ptr{Int64}}, Ptr{Ptr{Ptr{Int64}}}, Ptr{Ptr{Ptr{Cdouble}}}, Ptr{Ptr{Ptr{Cdouble}}}, Ptr{UInt32}), index, nLeafNodes, nLeafSizes, nLeafIDs, nLeafChildIDs, pppdMin, pppdMax, nDimension)
end

function Index_SetResultSetOffset(index, value)
    ccall((:Index_SetResultSetOffset, libspatialindex_c), RTError, (IndexH, Int64), index, value)
end

function Index_GetResultSetOffset(index)
    ccall((:Index_GetResultSetOffset, libspatialindex_c), Int64, (IndexH,), index)
end

function Index_SetResultSetLimit(index, value)
    ccall((:Index_SetResultSetLimit, libspatialindex_c), RTError, (IndexH, Int64), index, value)
end

function Index_GetResultSetLimit(index)
    ccall((:Index_GetResultSetLimit, libspatialindex_c), Int64, (IndexH,), index)
end

function Index_DestroyObjResults(results, nResults)
    ccall((:Index_DestroyObjResults, libspatialindex_c), Cvoid, (Ptr{IndexItemH}, UInt32), results, nResults)
end

function Index_ClearBuffer(index)
    ccall((:Index_ClearBuffer, libspatialindex_c), Cvoid, (IndexH,), index)
end

function Index_Free(object)
    ccall((:Index_Free, libspatialindex_c), Cvoid, (Ptr{Cvoid},), object)
end

function Index_Flush(index)
    ccall((:Index_Flush, libspatialindex_c), Cvoid, (IndexH,), index)
end

function IndexItem_Destroy(item)
    ccall((:IndexItem_Destroy, libspatialindex_c), Cvoid, (IndexItemH,), item)
end

function IndexItem_GetID(item)
    ccall((:IndexItem_GetID, libspatialindex_c), Int64, (IndexItemH,), item)
end

function IndexItem_GetData(item, data, length)
    ccall((:IndexItem_GetData, libspatialindex_c), RTError, (IndexItemH, Ptr{Ptr{UInt8}}, Ptr{UInt64}), item, data, length)
end

function IndexItem_GetBounds(item, ppdMin, ppdMax, nDimension)
    ccall((:IndexItem_GetBounds, libspatialindex_c), RTError, (IndexItemH, Ptr{Ptr{Cdouble}}, Ptr{Ptr{Cdouble}}, Ptr{UInt32}), item, ppdMin, ppdMax, nDimension)
end

function IndexProperty_Create()
    ccall((:IndexProperty_Create, libspatialindex_c), IndexPropertyH, ())
end

function IndexProperty_Destroy(hProp)
    ccall((:IndexProperty_Destroy, libspatialindex_c), Cvoid, (IndexPropertyH,), hProp)
end

function IndexProperty_SetIndexType(iprop, value)
    ccall((:IndexProperty_SetIndexType, libspatialindex_c), RTError, (IndexPropertyH, RTIndexType), iprop, value)
end

function IndexProperty_GetIndexType(iprop)
    ccall((:IndexProperty_GetIndexType, libspatialindex_c), RTIndexType, (IndexPropertyH,), iprop)
end

function IndexProperty_SetDimension(iprop, value)
    ccall((:IndexProperty_SetDimension, libspatialindex_c), RTError, (IndexPropertyH, UInt32), iprop, value)
end

function IndexProperty_GetDimension(iprop)
    ccall((:IndexProperty_GetDimension, libspatialindex_c), UInt32, (IndexPropertyH,), iprop)
end

function IndexProperty_SetIndexVariant(iprop, value)
    ccall((:IndexProperty_SetIndexVariant, libspatialindex_c), RTError, (IndexPropertyH, RTIndexVariant), iprop, value)
end

function IndexProperty_GetIndexVariant(iprop)
    ccall((:IndexProperty_GetIndexVariant, libspatialindex_c), RTIndexVariant, (IndexPropertyH,), iprop)
end

function IndexProperty_SetIndexStorage(iprop, value)
    ccall((:IndexProperty_SetIndexStorage, libspatialindex_c), RTError, (IndexPropertyH, RTStorageType), iprop, value)
end

function IndexProperty_GetIndexStorage(iprop)
    ccall((:IndexProperty_GetIndexStorage, libspatialindex_c), RTStorageType, (IndexPropertyH,), iprop)
end

function IndexProperty_SetPagesize(iprop, value)
    ccall((:IndexProperty_SetPagesize, libspatialindex_c), RTError, (IndexPropertyH, UInt32), iprop, value)
end

function IndexProperty_GetPagesize(iprop)
    ccall((:IndexProperty_GetPagesize, libspatialindex_c), UInt32, (IndexPropertyH,), iprop)
end

function IndexProperty_SetIndexCapacity(iprop, value)
    ccall((:IndexProperty_SetIndexCapacity, libspatialindex_c), RTError, (IndexPropertyH, UInt32), iprop, value)
end

function IndexProperty_GetIndexCapacity(iprop)
    ccall((:IndexProperty_GetIndexCapacity, libspatialindex_c), UInt32, (IndexPropertyH,), iprop)
end

function IndexProperty_SetLeafCapacity(iprop, value)
    ccall((:IndexProperty_SetLeafCapacity, libspatialindex_c), RTError, (IndexPropertyH, UInt32), iprop, value)
end

function IndexProperty_GetLeafCapacity(iprop)
    ccall((:IndexProperty_GetLeafCapacity, libspatialindex_c), UInt32, (IndexPropertyH,), iprop)
end

function IndexProperty_SetLeafPoolCapacity(iprop, value)
    ccall((:IndexProperty_SetLeafPoolCapacity, libspatialindex_c), RTError, (IndexPropertyH, UInt32), iprop, value)
end

function IndexProperty_GetLeafPoolCapacity(iprop)
    ccall((:IndexProperty_GetLeafPoolCapacity, libspatialindex_c), UInt32, (IndexPropertyH,), iprop)
end

function IndexProperty_SetIndexPoolCapacity(iprop, value)
    ccall((:IndexProperty_SetIndexPoolCapacity, libspatialindex_c), RTError, (IndexPropertyH, UInt32), iprop, value)
end

function IndexProperty_GetIndexPoolCapacity(iprop)
    ccall((:IndexProperty_GetIndexPoolCapacity, libspatialindex_c), UInt32, (IndexPropertyH,), iprop)
end

function IndexProperty_SetRegionPoolCapacity(iprop, value)
    ccall((:IndexProperty_SetRegionPoolCapacity, libspatialindex_c), RTError, (IndexPropertyH, UInt32), iprop, value)
end

function IndexProperty_GetRegionPoolCapacity(iprop)
    ccall((:IndexProperty_GetRegionPoolCapacity, libspatialindex_c), UInt32, (IndexPropertyH,), iprop)
end

function IndexProperty_SetPointPoolCapacity(iprop, value)
    ccall((:IndexProperty_SetPointPoolCapacity, libspatialindex_c), RTError, (IndexPropertyH, UInt32), iprop, value)
end

function IndexProperty_GetPointPoolCapacity(iprop)
    ccall((:IndexProperty_GetPointPoolCapacity, libspatialindex_c), UInt32, (IndexPropertyH,), iprop)
end

function IndexProperty_SetBufferingCapacity(iprop, value)
    ccall((:IndexProperty_SetBufferingCapacity, libspatialindex_c), RTError, (IndexPropertyH, UInt32), iprop, value)
end

function IndexProperty_GetBufferingCapacity(iprop)
    ccall((:IndexProperty_GetBufferingCapacity, libspatialindex_c), UInt32, (IndexPropertyH,), iprop)
end

function IndexProperty_SetEnsureTightMBRs(iprop, value)
    ccall((:IndexProperty_SetEnsureTightMBRs, libspatialindex_c), RTError, (IndexPropertyH, UInt32), iprop, value)
end

function IndexProperty_GetEnsureTightMBRs(iprop)
    ccall((:IndexProperty_GetEnsureTightMBRs, libspatialindex_c), UInt32, (IndexPropertyH,), iprop)
end

function IndexProperty_SetOverwrite(iprop, value)
    ccall((:IndexProperty_SetOverwrite, libspatialindex_c), RTError, (IndexPropertyH, UInt32), iprop, value)
end

function IndexProperty_GetOverwrite(iprop)
    ccall((:IndexProperty_GetOverwrite, libspatialindex_c), UInt32, (IndexPropertyH,), iprop)
end

function IndexProperty_SetNearMinimumOverlapFactor(iprop, value)
    ccall((:IndexProperty_SetNearMinimumOverlapFactor, libspatialindex_c), RTError, (IndexPropertyH, UInt32), iprop, value)
end

function IndexProperty_GetNearMinimumOverlapFactor(iprop)
    ccall((:IndexProperty_GetNearMinimumOverlapFactor, libspatialindex_c), UInt32, (IndexPropertyH,), iprop)
end

function IndexProperty_SetWriteThrough(iprop, value)
    ccall((:IndexProperty_SetWriteThrough, libspatialindex_c), RTError, (IndexPropertyH, UInt32), iprop, value)
end

function IndexProperty_GetWriteThrough(iprop)
    ccall((:IndexProperty_GetWriteThrough, libspatialindex_c), UInt32, (IndexPropertyH,), iprop)
end

function IndexProperty_SetFillFactor(iprop, value)
    ccall((:IndexProperty_SetFillFactor, libspatialindex_c), RTError, (IndexPropertyH, Cdouble), iprop, value)
end

function IndexProperty_GetFillFactor(iprop)
    ccall((:IndexProperty_GetFillFactor, libspatialindex_c), Cdouble, (IndexPropertyH,), iprop)
end

function IndexProperty_SetSplitDistributionFactor(iprop, value)
    ccall((:IndexProperty_SetSplitDistributionFactor, libspatialindex_c), RTError, (IndexPropertyH, Cdouble), iprop, value)
end

function IndexProperty_GetSplitDistributionFactor(iprop)
    ccall((:IndexProperty_GetSplitDistributionFactor, libspatialindex_c), Cdouble, (IndexPropertyH,), iprop)
end

function IndexProperty_SetTPRHorizon(iprop, value)
    ccall((:IndexProperty_SetTPRHorizon, libspatialindex_c), RTError, (IndexPropertyH, Cdouble), iprop, value)
end

function IndexProperty_GetTPRHorizon(iprop)
    ccall((:IndexProperty_GetTPRHorizon, libspatialindex_c), Cdouble, (IndexPropertyH,), iprop)
end

function IndexProperty_SetReinsertFactor(iprop, value)
    ccall((:IndexProperty_SetReinsertFactor, libspatialindex_c), RTError, (IndexPropertyH, Cdouble), iprop, value)
end

function IndexProperty_GetReinsertFactor(iprop)
    ccall((:IndexProperty_GetReinsertFactor, libspatialindex_c), Cdouble, (IndexPropertyH,), iprop)
end

function IndexProperty_SetFileName(iprop, value)
    ccall((:IndexProperty_SetFileName, libspatialindex_c), RTError, (IndexPropertyH, Cstring), iprop, value)
end

function IndexProperty_GetFileName(iprop)
    ccall((:IndexProperty_GetFileName, libspatialindex_c), Cstring, (IndexPropertyH,), iprop)
end

function IndexProperty_SetFileNameExtensionDat(iprop, value)
    ccall((:IndexProperty_SetFileNameExtensionDat, libspatialindex_c), RTError, (IndexPropertyH, Cstring), iprop, value)
end

function IndexProperty_GetFileNameExtensionDat(iprop)
    ccall((:IndexProperty_GetFileNameExtensionDat, libspatialindex_c), Cstring, (IndexPropertyH,), iprop)
end

function IndexProperty_SetFileNameExtensionIdx(iprop, value)
    ccall((:IndexProperty_SetFileNameExtensionIdx, libspatialindex_c), RTError, (IndexPropertyH, Cstring), iprop, value)
end

function IndexProperty_GetFileNameExtensionIdx(iprop)
    ccall((:IndexProperty_GetFileNameExtensionIdx, libspatialindex_c), Cstring, (IndexPropertyH,), iprop)
end

function IndexProperty_SetCustomStorageCallbacksSize(iprop, value)
    ccall((:IndexProperty_SetCustomStorageCallbacksSize, libspatialindex_c), RTError, (IndexPropertyH, UInt32), iprop, value)
end

function IndexProperty_GetCustomStorageCallbacksSize(iprop)
    ccall((:IndexProperty_GetCustomStorageCallbacksSize, libspatialindex_c), UInt32, (IndexPropertyH,), iprop)
end

function IndexProperty_SetCustomStorageCallbacks(iprop, value)
    ccall((:IndexProperty_SetCustomStorageCallbacks, libspatialindex_c), RTError, (IndexPropertyH, Ptr{Cvoid}), iprop, value)
end

function IndexProperty_GetCustomStorageCallbacks(iprop)
    ccall((:IndexProperty_GetCustomStorageCallbacks, libspatialindex_c), Ptr{Cvoid}, (IndexPropertyH,), iprop)
end

function IndexProperty_SetIndexID(iprop, value)
    ccall((:IndexProperty_SetIndexID, libspatialindex_c), RTError, (IndexPropertyH, Int64), iprop, value)
end

function IndexProperty_GetIndexID(iprop)
    ccall((:IndexProperty_GetIndexID, libspatialindex_c), Int64, (IndexPropertyH,), iprop)
end

function SIDX_NewBuffer(bytes)
    ccall((:SIDX_NewBuffer, libspatialindex_c), Ptr{Cvoid}, (Cint,), bytes)
end

function SIDX_DeleteBuffer(buffer)
    ccall((:SIDX_DeleteBuffer, libspatialindex_c), Cvoid, (Ptr{Cvoid},), buffer)
end

function IndexProperty_SetResultSetLimit(iprop, value)
    ccall((:IndexProperty_SetResultSetLimit, libspatialindex_c), RTError, (IndexPropertyH, UInt64), iprop, value)
end

function IndexProperty_GetResultSetLimit(iprop)
    ccall((:IndexProperty_GetResultSetLimit, libspatialindex_c), UInt64, (IndexPropertyH,), iprop)
end

function SIDX_Version()
    ccall((:SIDX_Version, libspatialindex_c), Cstring, ())
end

function Error_GetLastErrorMsg()
    ccall((:Error_GetLastErrorMsg, libspatialindex_c), Cstring, ())
end

