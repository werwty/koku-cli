# CostModelApi

All URIs are relative to */api/cost-management/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createCostModel**](CostModelApi.md#createCostModel) | **POST** /costmodels/ | Create a new cost model.
[**deleteCostModel**](CostModelApi.md#deleteCostModel) | **DELETE** /costmodels/{cost_model_uuid}/ | Delete a Cost Model
[**getCostModel**](CostModelApi.md#getCostModel) | **GET** /costmodels/{cost_model_uuid}/ | Get a Cost Model.
[**listCostModels**](CostModelApi.md#listCostModels) | **GET** /costmodels/ | List the cost models
[**updateCostModel**](CostModelApi.md#updateCostModel) | **PUT** /costmodels/{cost_model_uuid}/ | Update a Cost Model



## createCostModel

Create a new cost model.

### Example

```bash
 createCostModel
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **costModel** | [**CostModel**](CostModel.md) |  |

### Return type

[**CostModelOut**](CostModelOut.md)

### Authorization

[basic_auth](../README.md#basic_auth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## deleteCostModel

Delete a Cost Model

### Example

```bash
 deleteCostModel cost_model_uuid=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **costModelUuid** | [**string**](.md) | UUID of Cost Model to get | [default to null]

### Return type

(empty response body)

### Authorization

[basic_auth](../README.md#basic_auth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## getCostModel

Get a Cost Model.

### Example

```bash
 getCostModel cost_model_uuid=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **costModelUuid** | [**string**](.md) | UUID of Cost Model to get | [default to null]

### Return type

[**CostModelOut**](CostModelOut.md)

### Authorization

[basic_auth](../README.md#basic_auth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## listCostModels

List the cost models

### Example

```bash
 listCostModels  offset=value  limit=value  provider_uuid=value  source_type=value  name=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **offset** | **integer** | Parameter for selecting the offset of data. | [optional] [default to 0]
 **limit** | **integer** | Parameter for selecting the amount of data in a returned. | [optional] [default to 10]
 **providerUuid** | [**string**](.md) | Filter response on provider uuid. | [optional] [default to null]
 **sourceType** | **string** | Filter response on provider source type. | [optional] [default to null]
 **name** | **string** | Filter response on cost model name. | [optional] [default to null]

### Return type

[**CostModelPagination**](CostModelPagination.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## updateCostModel

Update a Cost Model

### Example

```bash
 updateCostModel cost_model_uuid=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **costModelUuid** | [**string**](.md) | UUID of Cost Model to get | [default to null]
 **costModel** | [**CostModel**](CostModel.md) | Update to a Cost Model |

### Return type

[**CostModelOut**](CostModelOut.md)

### Authorization

[basic_auth](../README.md#basic_auth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

