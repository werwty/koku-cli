# OpenShiftReportApi

All URIs are relative to */api/cost-management/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getOpenShiftAWSCostReports**](OpenShiftReportApi.md#getOpenShiftAWSCostReports) | **GET** /reports/openshift/infrastructures/aws/costs/ | Query to obtain OpenShift on AWS cost reports
[**getOpenShiftAWSInventoryInstanceReport**](OpenShiftReportApi.md#getOpenShiftAWSInventoryInstanceReport) | **GET** /reports/openshift/infrastructures/aws/instance-types/ | Query to obtain OpenShift on AWS instance data
[**getOpenShiftAWSInventoryStorageReport**](OpenShiftReportApi.md#getOpenShiftAWSInventoryStorageReport) | **GET** /reports/openshift/infrastructures/aws/storage/ | Query to obtain OpenShift on AWS storage data
[**getOpenShiftComputeReports**](OpenShiftReportApi.md#getOpenShiftComputeReports) | **GET** /reports/openshift/compute/ | Query to obtain OpenShift compute usage information
[**getOpenShiftCostReports**](OpenShiftReportApi.md#getOpenShiftCostReports) | **GET** /reports/openshift/costs/ | Query to obtain cost reports
[**getOpenShiftMemoryReports**](OpenShiftReportApi.md#getOpenShiftMemoryReports) | **GET** /reports/openshift/memory/ | Query to obtain OpenShift memory usage information
[**getOpenShiftVolumeReports**](OpenShiftReportApi.md#getOpenShiftVolumeReports) | **GET** /reports/openshift/volumes/ | Query to obtain OpenShift volume usage information



## getOpenShiftAWSCostReports

Query to obtain OpenShift on AWS cost reports

### Example

```bash
 getOpenShiftAWSCostReports  delta=value  filter=value  group_by=value  order_by=value  offset=value  limit=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **delta** | **string** | Toggle to include delta values in report. | [optional] [default to null]
 **filter** | **string** | The filter to apply to the report as a URL encoded dictionary. | [optional] [default to null]
 **groupBy** | **string** | The grouping to apply to the report as a URL encoded dictionary. | [optional] [default to null]
 **orderBy** | **string** | The ordering to apply to the report as a URL encoded dictionary. | [optional] [default to null]
 **offset** | **integer** | Parameter for selecting the offset of data. | [optional] [default to 0]
 **limit** | **integer** | Parameter for selecting the amount of data in a returned. | [optional] [default to 100]

### Return type

[**ReportCosts**](ReportCosts.md)

### Authorization

[basic_auth](../README.md#basic_auth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json, text/csv

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## getOpenShiftAWSInventoryInstanceReport

Query to obtain OpenShift on AWS instance data

### Example

```bash
 getOpenShiftAWSInventoryInstanceReport  filter=value  group_by=value  order_by=value  units=value  offset=value  limit=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **filter** | **string** | The filter to apply to the report as a URL encoded dictionary. | [optional] [default to null]
 **groupBy** | **string** | The grouping to apply to the report as a URL encoded dictionary. | [optional] [default to null]
 **orderBy** | **string** | The ordering to apply to the report as a URL encoded dictionary. | [optional] [default to null]
 **units** | **string** | The units used to report data. | [optional] [default to null]
 **offset** | **integer** | Parameter for selecting the offset of data. | [optional] [default to 0]
 **limit** | **integer** | Parameter for selecting the amount of data in a returned. | [optional] [default to 100]

### Return type

[**ReportOpenShiftAWSInstanceInventory**](ReportOpenShiftAWSInstanceInventory.md)

### Authorization

[basic_auth](../README.md#basic_auth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json, text/csv

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## getOpenShiftAWSInventoryStorageReport

Query to obtain OpenShift on AWS storage data

### Example

```bash
 getOpenShiftAWSInventoryStorageReport  filter=value  group_by=value  order_by=value  units=value  offset=value  limit=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **filter** | **string** | The filter to apply to the report as a URL encoded dictionary. | [optional] [default to null]
 **groupBy** | **string** | The grouping to apply to the report as a URL encoded dictionary. | [optional] [default to null]
 **orderBy** | **string** | The ordering to apply to the report as a URL encoded dictionary. | [optional] [default to null]
 **units** | **string** | The units used to report data. | [optional] [default to null]
 **offset** | **integer** | Parameter for selecting the offset of data. | [optional] [default to 0]
 **limit** | **integer** | Parameter for selecting the amount of data in a returned. | [optional] [default to 100]

### Return type

[**ReportOpenShiftAWSStorageInventory**](ReportOpenShiftAWSStorageInventory.md)

### Authorization

[basic_auth](../README.md#basic_auth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json, text/csv

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## getOpenShiftComputeReports

Query to obtain OpenShift compute usage information

### Example

```bash
 getOpenShiftComputeReports  filter=value  group_by=value  order_by=value  offset=value  limit=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **filter** | **string** | The filter to apply to the report as a URL encoded dictionary. | [optional] [default to null]
 **groupBy** | **string** | The grouping to apply to the report as a URL encoded dictionary. | [optional] [default to null]
 **orderBy** | **string** | The ordering to apply to the report as a URL encoded dictionary. | [optional] [default to null]
 **offset** | **integer** | Parameter for selecting the offset of data. | [optional] [default to 0]
 **limit** | **integer** | Parameter for selecting the amount of data in a returned. | [optional] [default to 100]

### Return type

[**ReportOpenShiftCpu**](ReportOpenShiftCpu.md)

### Authorization

[basic_auth](../README.md#basic_auth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json, text/csv

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## getOpenShiftCostReports

Query to obtain cost reports

### Example

```bash
 getOpenShiftCostReports  delta=value  filter=value  group_by=value  order_by=value  offset=value  limit=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **delta** | **string** | Toggle to include delta values in report. | [optional] [default to null]
 **filter** | **string** | The filter to apply to the report as a URL encoded dictionary. | [optional] [default to null]
 **groupBy** | **string** | The grouping to apply to the report as a URL encoded dictionary. | [optional] [default to null]
 **orderBy** | **string** | The ordering to apply to the report as a URL encoded dictionary. | [optional] [default to null]
 **offset** | **integer** | Parameter for selecting the offset of data. | [optional] [default to 0]
 **limit** | **integer** | Parameter for selecting the amount of data in a returned. | [optional] [default to 100]

### Return type

[**ReportCost**](ReportCost.md)

### Authorization

[basic_auth](../README.md#basic_auth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json, text/csv

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## getOpenShiftMemoryReports

Query to obtain OpenShift memory usage information

### Example

```bash
 getOpenShiftMemoryReports  filter=value  group_by=value  order_by=value  offset=value  limit=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **filter** | **string** | The filter to apply to the report as a URL encoded dictionary. | [optional] [default to null]
 **groupBy** | **string** | The grouping to apply to the report as a URL encoded dictionary. | [optional] [default to null]
 **orderBy** | **string** | The ordering to apply to the report as a URL encoded dictionary. | [optional] [default to null]
 **offset** | **integer** | Parameter for selecting the offset of data. | [optional] [default to 0]
 **limit** | **integer** | Parameter for selecting the amount of data in a returned. | [optional] [default to 100]

### Return type

[**ReportOpenShiftMemory**](ReportOpenShiftMemory.md)

### Authorization

[basic_auth](../README.md#basic_auth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json, text/csv

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## getOpenShiftVolumeReports

Query to obtain OpenShift volume usage information

### Example

```bash
 getOpenShiftVolumeReports  filter=value  group_by=value  order_by=value  offset=value  limit=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **filter** | **string** | The filter to apply to the report as a URL encoded dictionary. | [optional] [default to null]
 **groupBy** | **string** | The grouping to apply to the report as a URL encoded dictionary. | [optional] [default to null]
 **orderBy** | **string** | The ordering to apply to the report as a URL encoded dictionary. | [optional] [default to null]
 **offset** | **integer** | Parameter for selecting the offset of data. | [optional] [default to 0]
 **limit** | **integer** | Parameter for selecting the amount of data in a returned. | [optional] [default to 100]

### Return type

[**ReportOpenShiftVolume**](ReportOpenShiftVolume.md)

### Authorization

[basic_auth](../README.md#basic_auth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json, text/csv

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

