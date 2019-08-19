# UserPreferenceApi

All URIs are relative to */api/cost-management/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createUserPreference**](UserPreferenceApi.md#createUserPreference) | **POST** /preferences/ | Create a user preference
[**deleteUserPreference**](UserPreferenceApi.md#deleteUserPreference) | **DELETE** /preferences/{pref_uuid}/ | Delete a user preference
[**getUserPreference**](UserPreferenceApi.md#getUserPreference) | **GET** /preferences/{pref_uuid}/ | Get a user preference
[**listUserPreferences**](UserPreferenceApi.md#listUserPreferences) | **GET** /preferences/ | List the user&#39;s preferences
[**updateUserPreference**](UserPreferenceApi.md#updateUserPreference) | **PUT** /preferences/{pref_uuid}/ | Update a user preference



## createUserPreference

Create a user preference

### Example

```bash
 createUserPreference
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userPreference** | [**UserPreference**](UserPreference.md) | Preference to add to a Preference |

### Return type

[**UserPreferenceOut**](UserPreferenceOut.md)

### Authorization

[basic_auth](../README.md#basic_auth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## deleteUserPreference

Delete a user preference

### Example

```bash
 deleteUserPreference pref_uuid=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **prefUuid** | [**string**](.md) | ID of preference to get | [default to null]

### Return type

(empty response body)

### Authorization

[basic_auth](../README.md#basic_auth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## getUserPreference

Get a user preference

### Example

```bash
 getUserPreference pref_uuid=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **prefUuid** | [**string**](.md) | ID of preference to get | [default to null]

### Return type

[**UserPreferenceOut**](UserPreferenceOut.md)

### Authorization

[basic_auth](../README.md#basic_auth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## listUserPreferences

List the user's preferences

### Example

```bash
 listUserPreferences  offset=value  limit=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **offset** | **integer** | Parameter for selecting the offset of data. | [optional] [default to 0]
 **limit** | **integer** | Parameter for selecting the amount of data in a returned. | [optional] [default to 10]

### Return type

[**UserPreferencePagination**](UserPreferencePagination.md)

### Authorization

[basic_auth](../README.md#basic_auth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## updateUserPreference

Update a user preference

### Example

```bash
 updateUserPreference pref_uuid=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **prefUuid** | [**string**](.md) | ID of preference to get | [default to null]
 **userPreference** | [**UserPreference**](UserPreference.md) | Update to a Preference |

### Return type

(empty response body)

### Authorization

[basic_auth](../README.md#basic_auth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

