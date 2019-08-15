# DefaultApi

All URIs are relative to */api/cost-management/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createCostModel**](DefaultApi.md#createCostModel) | **POST** /costmodels/ | 
[**createProvider**](DefaultApi.md#createProvider) | **POST** /providers/ | 
[**createUserPreference**](DefaultApi.md#createUserPreference) | **POST** /preferences/ | 
[**destroyCostModel**](DefaultApi.md#destroyCostModel) | **DELETE** /costmodels/{uuid}/ | 
[**destroyProvider**](DefaultApi.md#destroyProvider) | **DELETE** /providers/{uuid}/ | 
[**destroyUserPreference**](DefaultApi.md#destroyUserPreference) | **DELETE** /preferences/{uuid}/ | 
[**listAWSCosts**](DefaultApi.md#listAWSCosts) | **GET** /reports/aws/costs/ | 
[**listAWSInstanceTypes**](DefaultApi.md#listAWSInstanceTypes) | **GET** /reports/aws/instance-types/ | 
[**listAWSStorages**](DefaultApi.md#listAWSStorages) | **GET** /reports/aws/storage/ | 
[**listAWSTags**](DefaultApi.md#listAWSTags) | **GET** /tags/aws/ | 
[**listCostModelMetricsMaps**](DefaultApi.md#listCostModelMetricsMaps) | **GET** /metrics/ | 
[**listCostModels**](DefaultApi.md#listCostModels) | **GET** /costmodels/ | 
[**listOCPAWSCosts**](DefaultApi.md#listOCPAWSCosts) | **GET** /reports/openshift/infrastructures/aws/costs/ | 
[**listOCPAWSInstanceTypes**](DefaultApi.md#listOCPAWSInstanceTypes) | **GET** /reports/openshift/infrastructures/aws/instance-types/ | 
[**listOCPAWSStorages**](DefaultApi.md#listOCPAWSStorages) | **GET** /reports/openshift/infrastructures/aws/storage/ | 
[**listOCPAWSTags**](DefaultApi.md#listOCPAWSTags) | **GET** /tags/openshift/infrastructures/aws/ | 
[**listOCPCosts**](DefaultApi.md#listOCPCosts) | **GET** /reports/openshift/costs/ | 
[**listOCPCpus**](DefaultApi.md#listOCPCpus) | **GET** /reports/openshift/compute/ | 
[**listOCPMemorys**](DefaultApi.md#listOCPMemorys) | **GET** /reports/openshift/memory/ | 
[**listOCPTags**](DefaultApi.md#listOCPTags) | **GET** /tags/openshift/ | 
[**listOCPVolumes**](DefaultApi.md#listOCPVolumes) | **GET** /reports/openshift/volumes/ | 
[**listProviders**](DefaultApi.md#listProviders) | **GET** /providers/ | 
[**listStatus**](DefaultApi.md#listStatus) | **GET** /status/ | 
[**listUserPreferences**](DefaultApi.md#listUserPreferences) | **GET** /preferences/ | 
[**partialUpdateCostModel**](DefaultApi.md#partialUpdateCostModel) | **PATCH** /costmodels/{uuid}/ | 
[**partialUpdateUserPreference**](DefaultApi.md#partialUpdateUserPreference) | **PATCH** /preferences/{uuid}/ | 
[**retrieveCostModel**](DefaultApi.md#retrieveCostModel) | **GET** /costmodels/{uuid}/ | 
[**retrieveProvider**](DefaultApi.md#retrieveProvider) | **GET** /providers/{uuid}/ | 
[**retrieveUserPreference**](DefaultApi.md#retrieveUserPreference) | **GET** /preferences/{uuid}/ | 
[**updateCostModel**](DefaultApi.md#updateCostModel) | **PUT** /costmodels/{uuid}/ | 
[**updateUserPreference**](DefaultApi.md#updateUserPreference) | **PUT** /preferences/{uuid}/ | 



## createCostModel



### Example

```bash
 createCostModel
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uNKNOWNBASETYPE** | [**UNKNOWN_BASE_TYPE**](UNKNOWN_BASE_TYPE.md) |  | [optional]

### Return type

**map**

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## createProvider



### Example

```bash
 createProvider
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uNKNOWNBASETYPE** | [**UNKNOWN_BASE_TYPE**](UNKNOWN_BASE_TYPE.md) |  | [optional]

### Return type

**map**

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## createUserPreference



### Example

```bash
 createUserPreference
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uNKNOWNBASETYPE** | [**UNKNOWN_BASE_TYPE**](UNKNOWN_BASE_TYPE.md) |  | [optional]

### Return type

**map**

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## destroyCostModel



### Example

```bash
 destroyCostModel uuid=value  source_type=value  name=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uuid** | **string** | A UUID string identifying this cost model. | [default to null]
 **sourceType** | **string** | source_type | [optional] [default to null]
 **name** | **string** | name | [optional] [default to null]

### Return type

(empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: Not Applicable

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## destroyProvider



### Example

```bash
 destroyProvider uuid=value  type=value  name=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uuid** | **string** |  | [default to null]
 **type** | **string** | type | [optional] [default to null]
 **name** | **string** | name | [optional] [default to null]

### Return type

(empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: Not Applicable

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## destroyUserPreference



### Example

```bash
 destroyUserPreference uuid=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uuid** | **string** |  | [default to null]

### Return type

(empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: Not Applicable

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## listAWSCosts



### Example

```bash
 listAWSCosts  limit=value  offset=value  delta=value  units=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **limit** | **integer** | The  URL encoded limit to apply to the query | [optional] [default to null]
 **offset** | **integer** | The  URL encoded offset to apply to the query | [optional] [default to null]
 **delta** | **string** | The  URL encoded delta to apply to the query | [optional] [default to null]
 **units** | **string** | The  URL encoded units to apply to the query | [optional] [default to null]

### Return type

[**InlineResponse2003**](InlineResponse2003.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## listAWSInstanceTypes



### Example

```bash
 listAWSInstanceTypes  limit=value  offset=value  delta=value  units=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **limit** | **integer** | The  URL encoded limit to apply to the query | [optional] [default to null]
 **offset** | **integer** | The  URL encoded offset to apply to the query | [optional] [default to null]
 **delta** | **string** | The  URL encoded delta to apply to the query | [optional] [default to null]
 **units** | **string** | The  URL encoded units to apply to the query | [optional] [default to null]

### Return type

[**InlineResponse2003**](InlineResponse2003.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## listAWSStorages



### Example

```bash
 listAWSStorages  limit=value  offset=value  delta=value  units=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **limit** | **integer** | The  URL encoded limit to apply to the query | [optional] [default to null]
 **offset** | **integer** | The  URL encoded offset to apply to the query | [optional] [default to null]
 **delta** | **string** | The  URL encoded delta to apply to the query | [optional] [default to null]
 **units** | **string** | The  URL encoded units to apply to the query | [optional] [default to null]

### Return type

[**InlineResponse2003**](InlineResponse2003.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## listAWSTags



### Example

```bash
 listAWSTags  filter=value  key_only=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **filter** | [**Filter**](.md) | The  URL encoded filter to apply to the query | [optional] [default to null]
 **keyOnly** | **boolean** | The  URL encoded key_only to apply to the query | [optional] [default to null]

### Return type

[**InlineResponse200**](InlineResponse200.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## listCostModelMetricsMaps



### Example

```bash
 listCostModelMetricsMaps  limit=value  offset=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **limit** | **integer** | Number of results to return per page. | [optional] [default to null]
 **offset** | **integer** | The initial index from which to return the results. | [optional] [default to null]

### Return type

[**InlineResponse2006**](InlineResponse2006.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## listCostModels



### Example

```bash
 listCostModels  limit=value  offset=value  source_type=value  name=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **limit** | **integer** | Number of results to return per page. | [optional] [default to null]
 **offset** | **integer** | The initial index from which to return the results. | [optional] [default to null]
 **sourceType** | **string** | source_type | [optional] [default to null]
 **name** | **string** | name | [optional] [default to null]

### Return type

**array[map]**

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## listOCPAWSCosts



### Example

```bash
 listOCPAWSCosts  limit=value  offset=value  delta=value  units=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **limit** | **integer** | The  URL encoded limit to apply to the query | [optional] [default to null]
 **offset** | **integer** | The  URL encoded offset to apply to the query | [optional] [default to null]
 **delta** | **string** | The  URL encoded delta to apply to the query | [optional] [default to null]
 **units** | **string** | The  URL encoded units to apply to the query | [optional] [default to null]

### Return type

[**InlineResponse2003**](InlineResponse2003.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## listOCPAWSInstanceTypes



### Example

```bash
 listOCPAWSInstanceTypes  limit=value  offset=value  delta=value  units=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **limit** | **integer** | The  URL encoded limit to apply to the query | [optional] [default to null]
 **offset** | **integer** | The  URL encoded offset to apply to the query | [optional] [default to null]
 **delta** | **string** | The  URL encoded delta to apply to the query | [optional] [default to null]
 **units** | **string** | The  URL encoded units to apply to the query | [optional] [default to null]

### Return type

[**InlineResponse2003**](InlineResponse2003.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## listOCPAWSStorages



### Example

```bash
 listOCPAWSStorages  limit=value  offset=value  delta=value  units=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **limit** | **integer** | The  URL encoded limit to apply to the query | [optional] [default to null]
 **offset** | **integer** | The  URL encoded offset to apply to the query | [optional] [default to null]
 **delta** | **string** | The  URL encoded delta to apply to the query | [optional] [default to null]
 **units** | **string** | The  URL encoded units to apply to the query | [optional] [default to null]

### Return type

[**InlineResponse2003**](InlineResponse2003.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## listOCPAWSTags



### Example

```bash
 listOCPAWSTags  filter=value  key_only=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **filter** | [**Filter2**](.md) | The  URL encoded filter to apply to the query | [optional] [default to null]
 **keyOnly** | **boolean** | The  URL encoded key_only to apply to the query | [optional] [default to null]

### Return type

[**InlineResponse2002**](InlineResponse2002.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## listOCPCosts



### Example

```bash
 listOCPCosts  limit=value  offset=value  units=value  delta=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **limit** | **integer** | The  URL encoded limit to apply to the query | [optional] [default to null]
 **offset** | **integer** | The  URL encoded offset to apply to the query | [optional] [default to null]
 **units** | **string** | The  URL encoded units to apply to the query | [optional] [default to null]
 **delta** | **string** | The  URL encoded delta to apply to the query | [optional] [default to null]

### Return type

[**InlineResponse2004**](InlineResponse2004.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## listOCPCpus



### Example

```bash
 listOCPCpus  limit=value  offset=value  units=value  delta=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **limit** | **integer** | The  URL encoded limit to apply to the query | [optional] [default to null]
 **offset** | **integer** | The  URL encoded offset to apply to the query | [optional] [default to null]
 **units** | **string** | The  URL encoded units to apply to the query | [optional] [default to null]
 **delta** | **string** | The  URL encoded delta to apply to the query | [optional] [default to null]

### Return type

[**InlineResponse2005**](InlineResponse2005.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## listOCPMemorys



### Example

```bash
 listOCPMemorys  limit=value  offset=value  units=value  delta=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **limit** | **integer** | The  URL encoded limit to apply to the query | [optional] [default to null]
 **offset** | **integer** | The  URL encoded offset to apply to the query | [optional] [default to null]
 **units** | **string** | The  URL encoded units to apply to the query | [optional] [default to null]
 **delta** | **string** | The  URL encoded delta to apply to the query | [optional] [default to null]

### Return type

[**InlineResponse2005**](InlineResponse2005.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## listOCPTags



### Example

```bash
 listOCPTags  filter=value  key_only=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **filter** | [**Filter1**](.md) | The  URL encoded filter to apply to the query | [optional] [default to null]
 **keyOnly** | **boolean** | The  URL encoded key_only to apply to the query | [optional] [default to null]

### Return type

[**InlineResponse2001**](InlineResponse2001.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## listOCPVolumes



### Example

```bash
 listOCPVolumes  limit=value  offset=value  units=value  delta=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **limit** | **integer** | The  URL encoded limit to apply to the query | [optional] [default to null]
 **offset** | **integer** | The  URL encoded offset to apply to the query | [optional] [default to null]
 **units** | **string** | The  URL encoded units to apply to the query | [optional] [default to null]
 **delta** | **string** | The  URL encoded delta to apply to the query | [optional] [default to null]

### Return type

[**InlineResponse2005**](InlineResponse2005.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## listProviders



### Example

```bash
 listProviders  limit=value  offset=value  type=value  name=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **limit** | **integer** | Number of results to return per page. | [optional] [default to null]
 **offset** | **integer** | The initial index from which to return the results. | [optional] [default to null]
 **type** | **string** | type | [optional] [default to null]
 **name** | **string** | name | [optional] [default to null]

### Return type

[**InlineResponse2007**](InlineResponse2007.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## listStatus



### Example

```bash
 listStatus
```

### Parameters

This endpoint does not need any parameter.

### Return type

**array[map]**

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## listUserPreferences



### Example

```bash
 listUserPreferences  limit=value  offset=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **limit** | **integer** | Number of results to return per page. | [optional] [default to null]
 **offset** | **integer** | The initial index from which to return the results. | [optional] [default to null]

### Return type

[**InlineResponse2008**](InlineResponse2008.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## partialUpdateCostModel



### Example

```bash
 partialUpdateCostModel uuid=value  source_type=value  name=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uuid** | **string** | A UUID string identifying this cost model. | [default to null]
 **sourceType** | **string** | source_type | [optional] [default to null]
 **name** | **string** | name | [optional] [default to null]
 **uNKNOWNBASETYPE** | [**UNKNOWN_BASE_TYPE**](UNKNOWN_BASE_TYPE.md) |  | [optional]

### Return type

**map**

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## partialUpdateUserPreference



### Example

```bash
 partialUpdateUserPreference uuid=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uuid** | **string** |  | [default to null]
 **uNKNOWNBASETYPE** | [**UNKNOWN_BASE_TYPE**](UNKNOWN_BASE_TYPE.md) |  | [optional]

### Return type

**map**

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## retrieveCostModel



### Example

```bash
 retrieveCostModel uuid=value  source_type=value  name=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uuid** | **string** | A UUID string identifying this cost model. | [default to null]
 **sourceType** | **string** | source_type | [optional] [default to null]
 **name** | **string** | name | [optional] [default to null]

### Return type

**map**

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## retrieveProvider



### Example

```bash
 retrieveProvider uuid=value  type=value  name=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uuid** | **string** |  | [default to null]
 **type** | **string** | type | [optional] [default to null]
 **name** | **string** | name | [optional] [default to null]

### Return type

**map**

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## retrieveUserPreference



### Example

```bash
 retrieveUserPreference uuid=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uuid** | **string** |  | [default to null]

### Return type

**map**

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## updateCostModel



### Example

```bash
 updateCostModel uuid=value  source_type=value  name=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uuid** | **string** | A UUID string identifying this cost model. | [default to null]
 **sourceType** | **string** | source_type | [optional] [default to null]
 **name** | **string** | name | [optional] [default to null]
 **uNKNOWNBASETYPE** | [**UNKNOWN_BASE_TYPE**](UNKNOWN_BASE_TYPE.md) |  | [optional]

### Return type

**map**

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## updateUserPreference



### Example

```bash
 updateUserPreference uuid=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uuid** | **string** |  | [default to null]
 **uNKNOWNBASETYPE** | [**UNKNOWN_BASE_TYPE**](UNKNOWN_BASE_TYPE.md) |  | [optional]

### Return type

**map**

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

