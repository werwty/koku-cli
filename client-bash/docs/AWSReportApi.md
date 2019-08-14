# AWSReportApi

All URIs are relative to */r/insights/platform/cost-management/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getAWSCostReports**](AWSReportApi.md#getAWSCostReports) | **GET** /reports/aws/costs/ | Query to obtain cost reports
[**getAWSInstanceReports**](AWSReportApi.md#getAWSInstanceReports) | **GET** /reports/aws/instance-types/ | Query to obtain AWS instance type data
[**getAWSStorageReports**](AWSReportApi.md#getAWSStorageReports) | **GET** /reports/aws/storage/ | Query to obtain AWS storage data



## getAWSCostReports

Query to obtain cost reports

### Example

```bash
 getAWSCostReports  delta=value  filter=value  group_by=value  order_by=value  offset=value  limit=value
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


## getAWSInstanceReports

Query to obtain AWS instance type data

### Example

```bash
 getAWSInstanceReports  filter=value  group_by=value  order_by=value  units=value  offset=value  limit=value
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

[**ReportInstanceInventory**](ReportInstanceInventory.md)

### Authorization

[basic_auth](../README.md#basic_auth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json, text/csv

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## getAWSStorageReports

Query to obtain AWS storage data

### Example

```bash
 getAWSStorageReports  filter=value  group_by=value  order_by=value  units=value  offset=value  limit=value
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

[**ReportStorageInventory**](ReportStorageInventory.md)

### Authorization

[basic_auth](../README.md#basic_auth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json, text/csv

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

