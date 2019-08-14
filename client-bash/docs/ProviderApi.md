# ProviderApi

All URIs are relative to */r/insights/platform/cost-management/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createProvider**](ProviderApi.md#createProvider) | **POST** /providers/ | Create a provider
[**deleteProvider**](ProviderApi.md#deleteProvider) | **DELETE** /providers/ | Delete a provider
[**getProvider**](ProviderApi.md#getProvider) | **GET** /providers/{uuid}/ | Get a provider
[**listProviders**](ProviderApi.md#listProviders) | **GET** /providers/ | List the providers



## createProvider

Create a provider

### Example

```bash
 createProvider
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **providerIn** | [**ProviderIn**](ProviderIn.md) | Provider to add to a Customer |

### Return type

[**ProviderOut**](ProviderOut.md)

### Authorization

[basic_auth](../README.md#basic_auth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## deleteProvider

Delete a provider

### Example

```bash
 deleteProvider uuid=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uuid** | [**string**](.md) | ID of provider to delete | [default to null]

### Return type

(empty response body)

### Authorization

[basic_auth](../README.md#basic_auth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## getProvider

Get a provider

### Example

```bash
 getProvider uuid=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uuid** | [**string**](.md) | ID of provider to get | [default to null]

### Return type

[**ProviderOut**](ProviderOut.md)

### Authorization

[basic_auth](../README.md#basic_auth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## listProviders

List the providers

### Example

```bash
 listProviders  type=value  name=value  offset=value  limit=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **type** | **string** | The type of provider to filter for. | [optional] [default to null]
 **name** | **string** | The name of the provider to filter for. | [optional] [default to null]
 **offset** | **integer** | Parameter for selecting the offset of data. | [optional] [default to 0]
 **limit** | **integer** | Parameter for selecting the amount of data in a returned. | [optional] [default to 10]

### Return type

[**ProviderPagination**](ProviderPagination.md)

### Authorization

[basic_auth](../README.md#basic_auth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

