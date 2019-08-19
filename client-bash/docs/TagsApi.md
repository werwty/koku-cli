# TagsApi

All URIs are relative to */api/cost-management/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getAWSTagData**](TagsApi.md#getAWSTagData) | **GET** /tags/aws/ | Query to obtain AWS tags
[**getOpenShiftAWSTagData**](TagsApi.md#getOpenShiftAWSTagData) | **GET** /tags/openshift/infrastructures/aws/ | Query to obtain OpenShift-on-AWS tags
[**getOpenShiftTagData**](TagsApi.md#getOpenShiftTagData) | **GET** /tags/openshift/ | Query to obtain OpenShift tags



## getAWSTagData

Query to obtain AWS tags

### Example

```bash
 getAWSTagData  filter=value  key_only=value  offset=value  limit=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **filter** | **string** | The filter to apply to the query as a URL encoded dictionary. | [optional] [default to null]
 **keyOnly** | **boolean** | Flag to indicate whether or not only the tag key values will be returned. | [optional] [default to null]
 **offset** | **integer** | Parameter for selecting the offset of data. | [optional] [default to 0]
 **limit** | **integer** | Parameter for selecting the amount of data in a returned. | [optional] [default to 100]

### Return type

[**Tags**](Tags.md)

### Authorization

[basic_auth](../README.md#basic_auth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## getOpenShiftAWSTagData

Query to obtain OpenShift-on-AWS tags

### Example

```bash
 getOpenShiftAWSTagData  filter=value  key_only=value  offset=value  limit=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **filter** | **string** | The filter to apply to the query as a URL encoded dictionary. | [optional] [default to null]
 **keyOnly** | **boolean** | Flag to indicate whether or not only the tag key values will be returned. | [optional] [default to null]
 **offset** | **integer** | Parameter for selecting the offset of data. | [optional] [default to 0]
 **limit** | **integer** | Parameter for selecting the amount of data in a returned. | [optional] [default to 100]

### Return type

[**Tags**](Tags.md)

### Authorization

[basic_auth](../README.md#basic_auth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## getOpenShiftTagData

Query to obtain OpenShift tags

### Example

```bash
 getOpenShiftTagData  filter=value  key_only=value  offset=value  limit=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **filter** | **string** | The filter to apply to the query as a URL encoded dictionary. | [optional] [default to null]
 **keyOnly** | **boolean** | Flag to indicate whether or not only the tag key values will be returned. | [optional] [default to null]
 **offset** | **integer** | Parameter for selecting the offset of data. | [optional] [default to 0]
 **limit** | **integer** | Parameter for selecting the amount of data in a returned. | [optional] [default to 100]

### Return type

[**Tags**](Tags.md)

### Authorization

[basic_auth](../README.md#basic_auth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

