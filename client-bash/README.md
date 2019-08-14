# Cost Management Bash client

## Overview

This is a Bash client script for accessing Cost Management service.

The script uses cURL underneath for making all REST calls.

## Usage

```shell
# Make sure the script has executable rights
$ chmod u+x 

# Print the list of operations available on the service
$ ./ -h

# Print the service description
$ ./ --about

# Print detailed information about specific operation
$ ./ <operationId> -h

# Make GET request
./ --host http://<hostname>:<port> --accept xml <operationId> <queryParam1>=<value1> <header_key1>:<header_value2>

# Make GET request using arbitrary curl options (must be passed before <operationId>) to an SSL service using username:password
 -k -sS --tlsv1.2 --host https://<hostname> -u <user>:<password> --accept xml <operationId> <queryParam1>=<value1> <header_key1>:<header_value2>

# Make POST request
$ echo '<body_content>' |  --host <hostname> --content-type json <operationId> -

# Make POST request with simple JSON content, e.g.:
# {
#   "key1": "value1",
#   "key2": "value2",
#   "key3": 23
# }
$ echo '<body_content>' |  --host <hostname> --content-type json <operationId> key1==value1 key2=value2 key3:=23 -

# Preview the cURL command without actually executing it
$  --host http://<hostname>:<port> --dry-run <operationid>

```

## Docker image

You can easily create a Docker image containing a preconfigured environment
for using the REST Bash client including working autocompletion and short
welcome message with basic instructions, using the generated Dockerfile:

```shell
docker build -t my-rest-client .
docker run -it my-rest-client
```

By default you will be logged into a Zsh environment which has much more
advanced auto completion, but you can switch to Bash, where basic autocompletion
is also available.

## Shell completion

### Bash

The generated bash-completion script can be either directly loaded to the current Bash session using:

```shell
source .bash-completion
```

Alternatively, the script can be copied to the `/etc/bash-completion.d` (or on OSX with Homebrew to `/usr/local/etc/bash-completion.d`):

```shell
sudo cp .bash-completion /etc/bash-completion.d/
```

#### OS X

On OSX you might need to install bash-completion using Homebrew:

```shell
brew install bash-completion
```

and add the following to the `~/.bashrc`:

```shell
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi
```

### Zsh

In Zsh, the generated `_` Zsh completion file must be copied to one of the folders under `$FPATH` variable.

## Documentation for API Endpoints

All URIs are relative to */r/insights/platform/cost-management/v1*

Class | Method | HTTP request | Description
------------ | ------------- | ------------- | -------------
*AWSReportApi* | [**getAWSCostReports**](docs/AWSReportApi.md#getawscostreports) | **GET** /reports/aws/costs/ | Query to obtain cost reports
*AWSReportApi* | [**getAWSInstanceReports**](docs/AWSReportApi.md#getawsinstancereports) | **GET** /reports/aws/instance-types/ | Query to obtain AWS instance type data
*AWSReportApi* | [**getAWSStorageReports**](docs/AWSReportApi.md#getawsstoragereports) | **GET** /reports/aws/storage/ | Query to obtain AWS storage data
*OpenShiftReportApi* | [**getOpenShiftAWSCostReports**](docs/OpenShiftReportApi.md#getopenshiftawscostreports) | **GET** /reports/openshift/infrastructures/aws/costs/ | Query to obtain OpenShift on AWS cost reports
*OpenShiftReportApi* | [**getOpenShiftAWSInventoryInstanceReport**](docs/OpenShiftReportApi.md#getopenshiftawsinventoryinstancereport) | **GET** /reports/openshift/infrastructures/aws/instance-types/ | Query to obtain OpenShift on AWS instance data
*OpenShiftReportApi* | [**getOpenShiftAWSInventoryStorageReport**](docs/OpenShiftReportApi.md#getopenshiftawsinventorystoragereport) | **GET** /reports/openshift/infrastructures/aws/storage/ | Query to obtain OpenShift on AWS storage data
*OpenShiftReportApi* | [**getOpenShiftComputeReports**](docs/OpenShiftReportApi.md#getopenshiftcomputereports) | **GET** /reports/openshift/compute/ | Query to obtain OpenShift compute usage information
*OpenShiftReportApi* | [**getOpenShiftCostReports**](docs/OpenShiftReportApi.md#getopenshiftcostreports) | **GET** /reports/openshift/costs/ | Query to obtain cost reports
*OpenShiftReportApi* | [**getOpenShiftMemoryReports**](docs/OpenShiftReportApi.md#getopenshiftmemoryreports) | **GET** /reports/openshift/memory/ | Query to obtain OpenShift memory usage information
*OpenShiftReportApi* | [**getOpenShiftVolumeReports**](docs/OpenShiftReportApi.md#getopenshiftvolumereports) | **GET** /reports/openshift/volumes/ | Query to obtain OpenShift volume usage information
*ProviderApi* | [**createProvider**](docs/ProviderApi.md#createprovider) | **POST** /providers/ | Create a provider
*ProviderApi* | [**deleteProvider**](docs/ProviderApi.md#deleteprovider) | **DELETE** /providers/ | Delete a provider
*ProviderApi* | [**getProvider**](docs/ProviderApi.md#getprovider) | **GET** /providers/{uuid}/ | Get a provider
*ProviderApi* | [**listProviders**](docs/ProviderApi.md#listproviders) | **GET** /providers/ | List the providers
*RateApi* | [**createRate**](docs/RateApi.md#createrate) | **POST** /rates/ | Create a rate
*RateApi* | [**deleteRate**](docs/RateApi.md#deleterate) | **DELETE** /rates/{rate_id} | Delete a rate
*RateApi* | [**getRate**](docs/RateApi.md#getrate) | **GET** /rates/{rate_id} | Get a rate
*RateApi* | [**listRates**](docs/RateApi.md#listrates) | **GET** /rates/ | List the rates
*RateApi* | [**updateRate**](docs/RateApi.md#updaterate) | **PUT** /rates/{rate_id} | Update a rate
*StatusApi* | [**getStatus**](docs/StatusApi.md#getstatus) | **GET** /status/ | Obtain server status
*TagsApi* | [**getAWSTagData**](docs/TagsApi.md#getawstagdata) | **GET** /tags/aws/ | Query to obtain AWS tags
*TagsApi* | [**getOpenShiftAWSTagData**](docs/TagsApi.md#getopenshiftawstagdata) | **GET** /tags/openshift/infrastructures/aws/ | Query to obtain OpenShift-on-AWS tags
*TagsApi* | [**getOpenShiftTagData**](docs/TagsApi.md#getopenshifttagdata) | **GET** /tags/openshift/ | Query to obtain OpenShift tags
*UserPreferenceApi* | [**createUserPreference**](docs/UserPreferenceApi.md#createuserpreference) | **POST** /preferences/ | Create a user preference
*UserPreferenceApi* | [**deleteUserPreference**](docs/UserPreferenceApi.md#deleteuserpreference) | **DELETE** /preferences/{pref_uuid}/ | Delete a user preference
*UserPreferenceApi* | [**getUserPreference**](docs/UserPreferenceApi.md#getuserpreference) | **GET** /preferences/{pref_uuid}/ | Get a user preference
*UserPreferenceApi* | [**listUserPreferences**](docs/UserPreferenceApi.md#listuserpreferences) | **GET** /preferences/ | List the user&#39;s preferences
*UserPreferenceApi* | [**updateUserPreference**](docs/UserPreferenceApi.md#updateuserpreference) | **PUT** /preferences/{pref_uuid}/ | Update a user preference


## Documentation For Models

 - [Customer](docs/Customer.md)
 - [CustomerOut](docs/CustomerOut.md)
 - [Error](docs/Error.md)
 - [ListPagination](docs/ListPagination.md)
 - [PaginationLinks](docs/PaginationLinks.md)
 - [PaginationMeta](docs/PaginationMeta.md)
 - [Provider](docs/Provider.md)
 - [ProviderAuthenticationIn](docs/ProviderAuthenticationIn.md)
 - [ProviderAuthenticationOut](docs/ProviderAuthenticationOut.md)
 - [ProviderBillingSourceIn](docs/ProviderBillingSourceIn.md)
 - [ProviderBillingSourceOut](docs/ProviderBillingSourceOut.md)
 - [ProviderIn](docs/ProviderIn.md)
 - [ProviderOut](docs/ProviderOut.md)
 - [ProviderPagination](docs/ProviderPagination.md)
 - [Rate](docs/Rate.md)
 - [RateIn](docs/RateIn.md)
 - [RateOut](docs/RateOut.md)
 - [RatePagination](docs/RatePagination.md)
 - [Report](docs/Report.md)
 - [ReportCost](docs/ReportCost.md)
 - [ReportCosts](docs/ReportCosts.md)
 - [ReportCostsOpenShift](docs/ReportCostsOpenShift.md)
 - [ReportCostsOpenShiftOrdering](docs/ReportCostsOpenShiftOrdering.md)
 - [ReportDelta](docs/ReportDelta.md)
 - [ReportFilter](docs/ReportFilter.md)
 - [ReportFilterOpenShift](docs/ReportFilterOpenShift.md)
 - [ReportGrouping](docs/ReportGrouping.md)
 - [ReportInstanceInventory](docs/ReportInstanceInventory.md)
 - [ReportInventoryOpenShiftOrdering](docs/ReportInventoryOpenShiftOrdering.md)
 - [ReportOpenShiftAWSFilter](docs/ReportOpenShiftAWSFilter.md)
 - [ReportOpenShiftAWSGrouping](docs/ReportOpenShiftAWSGrouping.md)
 - [ReportOpenShiftAWSInstanceInventory](docs/ReportOpenShiftAWSInstanceInventory.md)
 - [ReportOpenShiftAWSOrdering](docs/ReportOpenShiftAWSOrdering.md)
 - [ReportOpenShiftAWSStorageInventory](docs/ReportOpenShiftAWSStorageInventory.md)
 - [ReportOpenShiftCpu](docs/ReportOpenShiftCpu.md)
 - [ReportOpenShiftGrouping](docs/ReportOpenShiftGrouping.md)
 - [ReportOpenShiftMemory](docs/ReportOpenShiftMemory.md)
 - [ReportOpenShiftVolume](docs/ReportOpenShiftVolume.md)
 - [ReportOrdering](docs/ReportOrdering.md)
 - [ReportPaginationMeta](docs/ReportPaginationMeta.md)
 - [ReportResolution](docs/ReportResolution.md)
 - [ReportResourceScope](docs/ReportResourceScope.md)
 - [ReportStorageInventory](docs/ReportStorageInventory.md)
 - [ReportTimeScopeUnits](docs/ReportTimeScopeUnits.md)
 - [ReportTimeScopeValue](docs/ReportTimeScopeValue.md)
 - [Status](docs/Status.md)
 - [Tags](docs/Tags.md)
 - [TagsFilter](docs/TagsFilter.md)
 - [User](docs/User.md)
 - [UserOut](docs/UserOut.md)
 - [UserPreference](docs/UserPreference.md)
 - [UserPreferenceOut](docs/UserPreferenceOut.md)
 - [UserPreferencePagination](docs/UserPreferencePagination.md)


## Documentation For Authorization


## basic_auth

- **Type**: HTTP basic authentication

