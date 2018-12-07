# Julia wrapper for header: /Users/yeesian/Downloads/libspatialindex_c-master/include/spatialindex/capi/sidx_api.h
# Automatically generated using Clang.jl wrap_c, version 0.0.0


function Index_Create(properties::IndexPropertyH)
    ccall((:Index_Create, libspatialindex_c), IndexH, (IndexPropertyH,), properties)
end

function Index_CreateWithStream(properties::IndexPropertyH, readNext)
    ccall((:Index_CreateWithStream, libspatialindex_c), IndexH, (IndexPropertyH, Ptr{Nothing}), properties, readNext)
end

function Index_Destroy(index::IndexH)
    ccall((:Index_Destroy, libspatialindex_c), Nothing, (IndexH,), index)
end

function Index_GetProperties(index::IndexH)
    ccall((:Index_GetProperties, libspatialindex_c), IndexPropertyH, (IndexH,), index)
end

function Index_DeleteData(index::IndexH, id::Integer, pdMin, pdMax, nDimension::Integer)
    ccall((:Index_DeleteData, libspatialindex_c), RTError, (IndexH, Int64, Ptr{Cdouble}, Ptr{Cdouble}, UInt32), index, id, pdMin, pdMax, nDimension)
end

function Index_DeleteTPData(index::IndexH, id::Integer, pdMin, pdMax, pdVMin, pdVMax, tStart::Cdouble, tEnd::Cdouble, nDimension::Integer)
    ccall((:Index_DeleteTPData, libspatialindex_c), RTError, (IndexH, Int64, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Cdouble, Cdouble, UInt32), index, id, pdMin, pdMax, pdVMin, pdVMax, tStart, tEnd, nDimension)
end

function Index_DeleteMVRData(index::IndexH, id::Integer, pdMin, pdMax, tStart::Cdouble, tEnd::Cdouble, nDimension::Integer)
    ccall((:Index_DeleteMVRData, libspatialindex_c), RTError, (IndexH, Int64, Ptr{Cdouble}, Ptr{Cdouble}, Cdouble, Cdouble, UInt32), index, id, pdMin, pdMax, tStart, tEnd, nDimension)
end

function Index_InsertData(index::IndexH, id::Integer, pdMin, pdMax, nDimension::Integer, pData, nDataLength::Integer)
    ccall((:Index_InsertData, libspatialindex_c), RTError, (IndexH, Int64, Ptr{Cdouble}, Ptr{Cdouble}, UInt32, Ptr{UInt8}, Cint), index, id, pdMin, pdMax, nDimension, pData, nDataLength)
end

function Index_InsertTPData(index::IndexH, id::Integer, pdMin, pdMax, pdVMin, pdVMax, tStart::Cdouble, tEnd::Cdouble, nDimension::Integer, pData, nDataLength::Integer)
    ccall((:Index_InsertTPData, libspatialindex_c), RTError, (IndexH, Int64, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Cdouble, Cdouble, UInt32, Ptr{UInt8}, Cint), index, id, pdMin, pdMax, pdVMin, pdVMax, tStart, tEnd, nDimension, pData, nDataLength)
end

function Index_InsertMVRData(index::IndexH, id::Integer, pdMin, pdMax, tStart::Cdouble, tEnd::Cdouble, nDimension::Integer, pData, nDataLength::Integer)
    ccall((:Index_InsertMVRData, libspatialindex_c), RTError, (IndexH, Int64, Ptr{Cdouble}, Ptr{Cdouble}, Cdouble, Cdouble, UInt32, Ptr{UInt8}, Cint), index, id, pdMin, pdMax, tStart, tEnd, nDimension, pData, nDataLength)
end

function Index_IsValid(index::IndexH)
    ccall((:Index_IsValid, libspatialindex_c), UInt32, (IndexH,), index)
end

function Index_TPIntersects_obj(index::IndexH, pdMin, pdMax, pdVMin, pdVMax, tStart::Cdouble, tEnd::Cdouble, nDimension::Integer, items, nResults)
    ccall((:Index_TPIntersects_obj, libspatialindex_c), RTError, (IndexH, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Cdouble, Cdouble, UInt32, Ptr{Ptr{IndexItemH}}, Ptr{UInt64}), index, pdMin, pdMax, pdVMin, pdVMax, tStart, tEnd, nDimension, items, nResults)
end

function Index_MVRIntersects_obj(index::IndexH, pdMin, pdMax, tStart::Cdouble, tEnd::Cdouble, nDimension::Integer, items, nResults)
    ccall((:Index_MVRIntersects_obj, libspatialindex_c), RTError, (IndexH, Ptr{Cdouble}, Ptr{Cdouble}, Cdouble, Cdouble, UInt32, Ptr{Ptr{IndexItemH}}, Ptr{UInt64}), index, pdMin, pdMax, tStart, tEnd, nDimension, items, nResults)
end

function Index_Intersects_obj(index::IndexH, pdMin, pdMax, nDimension::Integer, items, nResults)
    ccall((:Index_Intersects_obj, libspatialindex_c), RTError, (IndexH, Ptr{Cdouble}, Ptr{Cdouble}, UInt32, Ptr{Ptr{IndexItemH}}, Ptr{UInt64}), index, pdMin, pdMax, nDimension, items, nResults)
end

function Index_TPIntersects_id(index::IndexH, pdMin, pdMax, pdVMin, pdVMax, tStart::Cdouble, tEnd::Cdouble, nDimension::Integer, ids, nResults)
    ccall((:Index_TPIntersects_id, libspatialindex_c), RTError, (IndexH, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Cdouble, Cdouble, UInt32, Ptr{Ptr{Int64}}, Ptr{UInt64}), index, pdMin, pdMax, pdVMin, pdVMax, tStart, tEnd, nDimension, ids, nResults)
end

function Index_MVRIntersects_id(index::IndexH, pdMin, pdMax, tStart::Cdouble, tEnd::Cdouble, nDimension::Integer, ids, nResults)
    ccall((:Index_MVRIntersects_id, libspatialindex_c), RTError, (IndexH, Ptr{Cdouble}, Ptr{Cdouble}, Cdouble, Cdouble, UInt32, Ptr{Ptr{Int64}}, Ptr{UInt64}), index, pdMin, pdMax, tStart, tEnd, nDimension, ids, nResults)
end

function Index_Intersects_id(index::IndexH, pdMin, pdMax, nDimension::Integer, items, nResults)
    ccall((:Index_Intersects_id, libspatialindex_c), RTError, (IndexH, Ptr{Cdouble}, Ptr{Cdouble}, UInt32, Ptr{Ptr{Int64}}, Ptr{UInt64}), index, pdMin, pdMax, nDimension, items, nResults)
end

function Index_TPIntersects_count(index::IndexH, pdMin, pdMax, pdVMin, pdVMax, tStart::Cdouble, tEnd::Cdouble, nDimension::Integer, nResults)
    ccall((:Index_TPIntersects_count, libspatialindex_c), RTError, (IndexH, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Cdouble, Cdouble, UInt32, Ptr{UInt64}), index, pdMin, pdMax, pdVMin, pdVMax, tStart, tEnd, nDimension, nResults)
end

function Index_MVRIntersects_count(index::IndexH, pdMin, pdMax, tStart::Cdouble, tEnd::Cdouble, nDimension::Integer, nResults)
    ccall((:Index_MVRIntersects_count, libspatialindex_c), RTError, (IndexH, Ptr{Cdouble}, Ptr{Cdouble}, Cdouble, Cdouble, UInt32, Ptr{UInt64}), index, pdMin, pdMax, tStart, tEnd, nDimension, nResults)
end

function Index_Intersects_count(index::IndexH, pdMin, pdMax, nDimension::Integer, nResults)
    ccall((:Index_Intersects_count, libspatialindex_c), RTError, (IndexH, Ptr{Cdouble}, Ptr{Cdouble}, UInt32, Ptr{UInt64}), index, pdMin, pdMax, nDimension, nResults)
end

function Index_TPNearestNeighbors_obj(index::IndexH, pdMin, pdMax, pdVMin, pdVMax, tStart::Cdouble, tEnd::Cdouble, nDimension::Integer, items, nResults)
    ccall((:Index_TPNearestNeighbors_obj, libspatialindex_c), RTError, (IndexH, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Cdouble, Cdouble, UInt32, Ptr{Ptr{IndexItemH}}, Ptr{UInt64}), index, pdMin, pdMax, pdVMin, pdVMax, tStart, tEnd, nDimension, items, nResults)
end

function Index_MVRNearestNeighbors_obj(index::IndexH, pdMin, pdMax, tStart::Cdouble, tEnd::Cdouble, nDimension::Integer, items, nResults)
    ccall((:Index_MVRNearestNeighbors_obj, libspatialindex_c), RTError, (IndexH, Ptr{Cdouble}, Ptr{Cdouble}, Cdouble, Cdouble, UInt32, Ptr{Ptr{IndexItemH}}, Ptr{UInt64}), index, pdMin, pdMax, tStart, tEnd, nDimension, items, nResults)
end

function Index_NearestNeighbors_obj(index::IndexH, pdMin, pdMax, nDimension::Integer, items, nResults)
    ccall((:Index_NearestNeighbors_obj, libspatialindex_c), RTError, (IndexH, Ptr{Cdouble}, Ptr{Cdouble}, UInt32, Ptr{Ptr{IndexItemH}}, Ptr{UInt64}), index, pdMin, pdMax, nDimension, items, nResults)
end

function Index_TPNearestNeighbors_id(index::IndexH, pdMin, pdMax, pdVMin, pdVMax, tStart::Cdouble, tEnd::Cdouble, nDimension::Integer, ids, nResults)
    ccall((:Index_TPNearestNeighbors_id, libspatialindex_c), RTError, (IndexH, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Cdouble, Cdouble, UInt32, Ptr{Ptr{Int64}}, Ptr{UInt64}), index, pdMin, pdMax, pdVMin, pdVMax, tStart, tEnd, nDimension, ids, nResults)
end

function Index_MVRNearestNeighbors_id(index::IndexH, pdMin, pdMax, tStart::Cdouble, tEnd::Cdouble, nDimension::Integer, ids, nResults)
    ccall((:Index_MVRNearestNeighbors_id, libspatialindex_c), RTError, (IndexH, Ptr{Cdouble}, Ptr{Cdouble}, Cdouble, Cdouble, UInt32, Ptr{Ptr{Int64}}, Ptr{UInt64}), index, pdMin, pdMax, tStart, tEnd, nDimension, ids, nResults)
end

function Index_NearestNeighbors_id(index::IndexH, pdMin, pdMax, nDimension::Integer, items, nResults)
    ccall((:Index_NearestNeighbors_id, libspatialindex_c), RTError, (IndexH, Ptr{Cdouble}, Ptr{Cdouble}, UInt32, Ptr{Ptr{Int64}}, Ptr{UInt64}), index, pdMin, pdMax, nDimension, items, nResults)
end

function Index_GetBounds(index::IndexH, ppdMin, ppdMax, nDimension)
    ccall((:Index_GetBounds, libspatialindex_c), RTError, (IndexH, Ptr{Ptr{Cdouble}}, Ptr{Ptr{Cdouble}}, Ptr{UInt32}), index, ppdMin, ppdMax, nDimension)
end

function Index_GetLeaves(index::IndexH, nLeafNodes, nLeafSizes, nLeafIDs, nLeafChildIDs, pppdMin, pppdMax, nDimension)
    ccall((:Index_GetLeaves, libspatialindex_c), RTError, (IndexH, Ptr{UInt32}, Ptr{Ptr{UInt32}}, Ptr{Ptr{Int64}}, Ptr{Ptr{Ptr{Int64}}}, Ptr{Ptr{Ptr{Cdouble}}}, Ptr{Ptr{Ptr{Cdouble}}}, Ptr{UInt32}), index, nLeafNodes, nLeafSizes, nLeafIDs, nLeafChildIDs, pppdMin, pppdMax, nDimension)
end

function Index_SetResultSetOffset(index::IndexH, value::Integer)
    ccall((:Index_SetResultSetOffset, libspatialindex_c), RTError, (IndexH, Int64), index, value)
end

function Index_GetResultSetOffset(index::IndexH)
    ccall((:Index_GetResultSetOffset, libspatialindex_c), Int64, (IndexH,), index)
end

function Index_SetResultSetLimit(index::IndexH, value::Integer)
    ccall((:Index_SetResultSetLimit, libspatialindex_c), RTError, (IndexH, Int64), index, value)
end

function Index_GetResultSetLimit(index::IndexH)
    ccall((:Index_GetResultSetLimit, libspatialindex_c), Int64, (IndexH,), index)
end

function Index_DestroyObjResults(results, nResults::Integer)
    ccall((:Index_DestroyObjResults, libspatialindex_c), Nothing, (Ptr{IndexItemH}, UInt32), results, nResults)
end

function Index_ClearBuffer(index::IndexH)
    ccall((:Index_ClearBuffer, libspatialindex_c), Nothing, (IndexH,), index)
end

function Index_Free(object)
    ccall((:Index_Free, libspatialindex_c), Nothing, (Ptr{Nothing},), object)
end

function Index_Flush(index::IndexH)
    ccall((:Index_Flush, libspatialindex_c), Nothing, (IndexH,), index)
end

function IndexItem_Destroy(item::IndexItemH)
    ccall((:IndexItem_Destroy, libspatialindex_c), Nothing, (IndexItemH,), item)
end

function IndexItem_GetID(item::IndexItemH)
    ccall((:IndexItem_GetID, libspatialindex_c), Int64, (IndexItemH,), item)
end

function IndexItem_GetData(item::IndexItemH, data, length)
    ccall((:IndexItem_GetData, libspatialindex_c), RTError, (IndexItemH, Ptr{Ptr{UInt8}}, Ptr{UInt64}), item, data, length)
end

function IndexItem_GetBounds(item::IndexItemH, ppdMin, ppdMax, nDimension)
    ccall((:IndexItem_GetBounds, libspatialindex_c), RTError, (IndexItemH, Ptr{Ptr{Cdouble}}, Ptr{Ptr{Cdouble}}, Ptr{UInt32}), item, ppdMin, ppdMax, nDimension)
end

function IndexProperty_Create()
    ccall((:IndexProperty_Create, libspatialindex_c), IndexPropertyH, ())
end

function IndexProperty_Destroy(hProp::IndexPropertyH)
    ccall((:IndexProperty_Destroy, libspatialindex_c), Nothing, (IndexPropertyH,), hProp)
end

function IndexProperty_SetIndexType(iprop::IndexPropertyH, value::RTIndexType)
    ccall((:IndexProperty_SetIndexType, libspatialindex_c), RTError, (IndexPropertyH, RTIndexType), iprop, value)
end

function IndexProperty_GetIndexType(iprop::IndexPropertyH)
    ccall((:IndexProperty_GetIndexType, libspatialindex_c), RTIndexType, (IndexPropertyH,), iprop)
end

function IndexProperty_SetDimension(iprop::IndexPropertyH, value::Integer)
    ccall((:IndexProperty_SetDimension, libspatialindex_c), RTError, (IndexPropertyH, UInt32), iprop, value)
end

function IndexProperty_GetDimension(iprop::IndexPropertyH)
    ccall((:IndexProperty_GetDimension, libspatialindex_c), UInt32, (IndexPropertyH,), iprop)
end

function IndexProperty_SetIndexVariant(iprop::IndexPropertyH, value::RTIndexVariant)
    ccall((:IndexProperty_SetIndexVariant, libspatialindex_c), RTError, (IndexPropertyH, RTIndexVariant), iprop, value)
end

function IndexProperty_GetIndexVariant(iprop::IndexPropertyH)
    ccall((:IndexProperty_GetIndexVariant, libspatialindex_c), RTIndexVariant, (IndexPropertyH,), iprop)
end

function IndexProperty_SetIndexStorage(iprop::IndexPropertyH, value::RTStorageType)
    ccall((:IndexProperty_SetIndexStorage, libspatialindex_c), RTError, (IndexPropertyH, RTStorageType), iprop, value)
end

function IndexProperty_GetIndexStorage(iprop::IndexPropertyH)
    ccall((:IndexProperty_GetIndexStorage, libspatialindex_c), RTStorageType, (IndexPropertyH,), iprop)
end

function IndexProperty_SetPagesize(iprop::IndexPropertyH, value::Integer)
    ccall((:IndexProperty_SetPagesize, libspatialindex_c), RTError, (IndexPropertyH, UInt32), iprop, value)
end

function IndexProperty_GetPagesize(iprop::IndexPropertyH)
    ccall((:IndexProperty_GetPagesize, libspatialindex_c), UInt32, (IndexPropertyH,), iprop)
end

function IndexProperty_SetIndexCapacity(iprop::IndexPropertyH, value::Integer)
    ccall((:IndexProperty_SetIndexCapacity, libspatialindex_c), RTError, (IndexPropertyH, UInt32), iprop, value)
end

function IndexProperty_GetIndexCapacity(iprop::IndexPropertyH)
    ccall((:IndexProperty_GetIndexCapacity, libspatialindex_c), UInt32, (IndexPropertyH,), iprop)
end

function IndexProperty_SetLeafCapacity(iprop::IndexPropertyH, value::Integer)
    ccall((:IndexProperty_SetLeafCapacity, libspatialindex_c), RTError, (IndexPropertyH, UInt32), iprop, value)
end

function IndexProperty_GetLeafCapacity(iprop::IndexPropertyH)
    ccall((:IndexProperty_GetLeafCapacity, libspatialindex_c), UInt32, (IndexPropertyH,), iprop)
end

function IndexProperty_SetLeafPoolCapacity(iprop::IndexPropertyH, value::Integer)
    ccall((:IndexProperty_SetLeafPoolCapacity, libspatialindex_c), RTError, (IndexPropertyH, UInt32), iprop, value)
end

function IndexProperty_GetLeafPoolCapacity(iprop::IndexPropertyH)
    ccall((:IndexProperty_GetLeafPoolCapacity, libspatialindex_c), UInt32, (IndexPropertyH,), iprop)
end

function IndexProperty_SetIndexPoolCapacity(iprop::IndexPropertyH, value::Integer)
    ccall((:IndexProperty_SetIndexPoolCapacity, libspatialindex_c), RTError, (IndexPropertyH, UInt32), iprop, value)
end

function IndexProperty_GetIndexPoolCapacity(iprop::IndexPropertyH)
    ccall((:IndexProperty_GetIndexPoolCapacity, libspatialindex_c), UInt32, (IndexPropertyH,), iprop)
end

function IndexProperty_SetRegionPoolCapacity(iprop::IndexPropertyH, value::Integer)
    ccall((:IndexProperty_SetRegionPoolCapacity, libspatialindex_c), RTError, (IndexPropertyH, UInt32), iprop, value)
end

function IndexProperty_GetRegionPoolCapacity(iprop::IndexPropertyH)
    ccall((:IndexProperty_GetRegionPoolCapacity, libspatialindex_c), UInt32, (IndexPropertyH,), iprop)
end

function IndexProperty_SetPointPoolCapacity(iprop::IndexPropertyH, value::Integer)
    ccall((:IndexProperty_SetPointPoolCapacity, libspatialindex_c), RTError, (IndexPropertyH, UInt32), iprop, value)
end

function IndexProperty_GetPointPoolCapacity(iprop::IndexPropertyH)
    ccall((:IndexProperty_GetPointPoolCapacity, libspatialindex_c), UInt32, (IndexPropertyH,), iprop)
end

function IndexProperty_SetBufferingCapacity(iprop::IndexPropertyH, value::Integer)
    ccall((:IndexProperty_SetBufferingCapacity, libspatialindex_c), RTError, (IndexPropertyH, UInt32), iprop, value)
end

function IndexProperty_GetBufferingCapacity(iprop::IndexPropertyH)
    ccall((:IndexProperty_GetBufferingCapacity, libspatialindex_c), UInt32, (IndexPropertyH,), iprop)
end

function IndexProperty_SetEnsureTightMBRs(iprop::IndexPropertyH, value::Integer)
    ccall((:IndexProperty_SetEnsureTightMBRs, libspatialindex_c), RTError, (IndexPropertyH, UInt32), iprop, value)
end

function IndexProperty_GetEnsureTightMBRs(iprop::IndexPropertyH)
    ccall((:IndexProperty_GetEnsureTightMBRs, libspatialindex_c), UInt32, (IndexPropertyH,), iprop)
end

function IndexProperty_SetOverwrite(iprop::IndexPropertyH, value::Integer)
    ccall((:IndexProperty_SetOverwrite, libspatialindex_c), RTError, (IndexPropertyH, UInt32), iprop, value)
end

function IndexProperty_GetOverwrite(iprop::IndexPropertyH)
    ccall((:IndexProperty_GetOverwrite, libspatialindex_c), UInt32, (IndexPropertyH,), iprop)
end

function IndexProperty_SetNearMinimumOverlapFactor(iprop::IndexPropertyH, value::Integer)
    ccall((:IndexProperty_SetNearMinimumOverlapFactor, libspatialindex_c), RTError, (IndexPropertyH, UInt32), iprop, value)
end

function IndexProperty_GetNearMinimumOverlapFactor(iprop::IndexPropertyH)
    ccall((:IndexProperty_GetNearMinimumOverlapFactor, libspatialindex_c), UInt32, (IndexPropertyH,), iprop)
end

function IndexProperty_SetWriteThrough(iprop::IndexPropertyH, value::Integer)
    ccall((:IndexProperty_SetWriteThrough, libspatialindex_c), RTError, (IndexPropertyH, UInt32), iprop, value)
end

function IndexProperty_GetWriteThrough(iprop::IndexPropertyH)
    ccall((:IndexProperty_GetWriteThrough, libspatialindex_c), UInt32, (IndexPropertyH,), iprop)
end

function IndexProperty_SetFillFactor(iprop::IndexPropertyH, value::Cdouble)
    ccall((:IndexProperty_SetFillFactor, libspatialindex_c), RTError, (IndexPropertyH, Cdouble), iprop, value)
end

function IndexProperty_GetFillFactor(iprop::IndexPropertyH)
    ccall((:IndexProperty_GetFillFactor, libspatialindex_c), Cdouble, (IndexPropertyH,), iprop)
end

function IndexProperty_SetSplitDistributionFactor(iprop::IndexPropertyH, value::Cdouble)
    ccall((:IndexProperty_SetSplitDistributionFactor, libspatialindex_c), RTError, (IndexPropertyH, Cdouble), iprop, value)
end

function IndexProperty_GetSplitDistributionFactor(iprop::IndexPropertyH)
    ccall((:IndexProperty_GetSplitDistributionFactor, libspatialindex_c), Cdouble, (IndexPropertyH,), iprop)
end

function IndexProperty_SetTPRHorizon(iprop::IndexPropertyH, value::Cdouble)
    ccall((:IndexProperty_SetTPRHorizon, libspatialindex_c), RTError, (IndexPropertyH, Cdouble), iprop, value)
end

function IndexProperty_GetTPRHorizon(iprop::IndexPropertyH)
    ccall((:IndexProperty_GetTPRHorizon, libspatialindex_c), Cdouble, (IndexPropertyH,), iprop)
end

function IndexProperty_SetReinsertFactor(iprop::IndexPropertyH, value::Cdouble)
    ccall((:IndexProperty_SetReinsertFactor, libspatialindex_c), RTError, (IndexPropertyH, Cdouble), iprop, value)
end

function IndexProperty_GetReinsertFactor(iprop::IndexPropertyH)
    ccall((:IndexProperty_GetReinsertFactor, libspatialindex_c), Cdouble, (IndexPropertyH,), iprop)
end

function IndexProperty_SetFileName(iprop::IndexPropertyH, value)
    ccall((:IndexProperty_SetFileName, libspatialindex_c), RTError, (IndexPropertyH, Cstring), iprop, value)
end

function IndexProperty_GetFileName(iprop::IndexPropertyH)
    ccall((:IndexProperty_GetFileName, libspatialindex_c), Cstring, (IndexPropertyH,), iprop)
end

function IndexProperty_SetFileNameExtensionDat(iprop::IndexPropertyH, value)
    ccall((:IndexProperty_SetFileNameExtensionDat, libspatialindex_c), RTError, (IndexPropertyH, Cstring), iprop, value)
end

function IndexProperty_GetFileNameExtensionDat(iprop::IndexPropertyH)
    ccall((:IndexProperty_GetFileNameExtensionDat, libspatialindex_c), Cstring, (IndexPropertyH,), iprop)
end

function IndexProperty_SetFileNameExtensionIdx(iprop::IndexPropertyH, value)
    ccall((:IndexProperty_SetFileNameExtensionIdx, libspatialindex_c), RTError, (IndexPropertyH, Cstring), iprop, value)
end

function IndexProperty_GetFileNameExtensionIdx(iprop::IndexPropertyH)
    ccall((:IndexProperty_GetFileNameExtensionIdx, libspatialindex_c), Cstring, (IndexPropertyH,), iprop)
end

function IndexProperty_SetCustomStorageCallbacksSize(iprop::IndexPropertyH, value::Integer)
    ccall((:IndexProperty_SetCustomStorageCallbacksSize, libspatialindex_c), RTError, (IndexPropertyH, UInt32), iprop, value)
end

function IndexProperty_GetCustomStorageCallbacksSize(iprop::IndexPropertyH)
    ccall((:IndexProperty_GetCustomStorageCallbacksSize, libspatialindex_c), UInt32, (IndexPropertyH,), iprop)
end

function IndexProperty_SetCustomStorageCallbacks(iprop::IndexPropertyH, value)
    ccall((:IndexProperty_SetCustomStorageCallbacks, libspatialindex_c), RTError, (IndexPropertyH, Ptr{Nothing}), iprop, value)
end

function IndexProperty_GetCustomStorageCallbacks(iprop::IndexPropertyH)
    ccall((:IndexProperty_GetCustomStorageCallbacks, libspatialindex_c), Ptr{Nothing}, (IndexPropertyH,), iprop)
end

function IndexProperty_SetIndexID(iprop::IndexPropertyH, value::Integer)
    ccall((:IndexProperty_SetIndexID, libspatialindex_c), RTError, (IndexPropertyH, Int64), iprop, value)
end

function IndexProperty_GetIndexID(iprop::IndexPropertyH)
    ccall((:IndexProperty_GetIndexID, libspatialindex_c), Int64, (IndexPropertyH,), iprop)
end

function SIDX_NewBuffer(bytes::Integer)
    ccall((:SIDX_NewBuffer, libspatialindex_c), Ptr{Nothing}, (Cint,), bytes)
end

function SIDX_DeleteBuffer(buffer)
    ccall((:SIDX_DeleteBuffer, libspatialindex_c), Nothing, (Ptr{Nothing},), buffer)
end

function IndexProperty_SetResultSetLimit(iprop::IndexPropertyH, value::UInt64)
    ccall((:IndexProperty_SetResultSetLimit, libspatialindex_c), RTError, (IndexPropertyH, UInt64), iprop, value)
end

function IndexProperty_GetResultSetLimit(iprop::IndexPropertyH)
    ccall((:IndexProperty_GetResultSetLimit, libspatialindex_c), UInt64, (IndexPropertyH,), iprop)
end

function SIDX_Version()
    ccall((:SIDX_Version, libspatialindex_c), Cstring, ())
end

function Error_GetLastErrorMsg()
    ccall((:Error_GetLastErrorMsg, libspatialindex_c), Cstring, ())
end