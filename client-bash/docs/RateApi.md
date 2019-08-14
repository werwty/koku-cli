# RateApi

All URIs are relative to */r/insights/platform/cost-management/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createRate**](RateApi.md#createRate) | **POST** /rates/ | Create a rate
[**deleteRate**](RateApi.md#deleteRate) | **DELETE** /rates/{rate_id} | Delete a rate
[**getRate**](RateApi.md#getRate) | **GET** /rates/{rate_id} | Get a rate
[**listRates**](RateApi.md#listRates) | **GET** /rates/ | List the rates
[**updateRate**](RateApi.md#updateRate) | **PUT** /rates/{rate_id} | Update a rate



## createRate

Create a rate

### Example

```bash
 createRate
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **rateIn** | [**RateIn**](RateIn.md) | Rate to add to a Rate |

### Return type

[**RateOut**](RateOut.md)

### Authorization

[basic_auth](../README.md#basic_auth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## deleteRate

Delete a rate

### Example

```bash
 deleteRate rate_id=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **rateId** | **integer** | ID of rate to get | [default to null]

### Return type

(empty response body)

### Authorization

[basic_auth](../README.md#basic_auth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## getRate

Get a rate

### Example

```bash
 getRate rate_id=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **rateId** | [**string**](.md) | ID of rate to get | [default to null]

### Return type

[**RateOut**](RateOut.md)

### Authorization

[basic_auth](../README.md#basic_auth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## listRates

List the rates

### Example

```bash
 listRates  offset=value  limit=value  provider_uuid=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **offset** | **integer** | Parameter for selecting the offset of data. | [optional] [default to 0]
 **limit** | **integer** | Parameter for selecting the amount of data in a returned. | [optional] [default to 10]
 **providerUuid** | [**string**](.md) | Filter response onprovider uuid. | [optional] [default to null]

### Return type

[**RatePagination**](RatePagination.md)

### Authorization

[basic_auth](../README.md#basic_auth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## updateRate

Update a rate

### Example

```bash
 updateRate rate_id=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **rateId** | **integer** | ID of rate to get | [default to null]
 **rateIn** | [**RateIn**](RateIn.md) | Update to a Rate |

### Return type

(empty response body)

### Authorization

[basic_auth](../README.md#basic_auth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

