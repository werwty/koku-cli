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

All URIs are relative to */api/cost-management/v1*

Class | Method | HTTP request | Description
------------ | ------------- | ------------- | -------------
*DefaultApi* | [**createCostModel**](docs/DefaultApi.md#createcostmodel) | **POST** /costmodels/ | 
*DefaultApi* | [**createProvider**](docs/DefaultApi.md#createprovider) | **POST** /providers/ | 
*DefaultApi* | [**createUserPreference**](docs/DefaultApi.md#createuserpreference) | **POST** /preferences/ | 
*DefaultApi* | [**destroyCostModel**](docs/DefaultApi.md#destroycostmodel) | **DELETE** /costmodels/{uuid}/ | 
*DefaultApi* | [**destroyProvider**](docs/DefaultApi.md#destroyprovider) | **DELETE** /providers/{uuid}/ | 
*DefaultApi* | [**destroyUserPreference**](docs/DefaultApi.md#destroyuserpreference) | **DELETE** /preferences/{uuid}/ | 
*DefaultApi* | [**listAWSCosts**](docs/DefaultApi.md#listawscosts) | **GET** /reports/aws/costs/ | 
*DefaultApi* | [**listAWSInstanceTypes**](docs/DefaultApi.md#listawsinstancetypes) | **GET** /reports/aws/instance-types/ | 
*DefaultApi* | [**listAWSStorages**](docs/DefaultApi.md#listawsstorages) | **GET** /reports/aws/storage/ | 
*DefaultApi* | [**listAWSTags**](docs/DefaultApi.md#listawstags) | **GET** /tags/aws/ | 
*DefaultApi* | [**listCostModelMetricsMaps**](docs/DefaultApi.md#listcostmodelmetricsmaps) | **GET** /metrics/ | 
*DefaultApi* | [**listCostModels**](docs/DefaultApi.md#listcostmodels) | **GET** /costmodels/ | 
*DefaultApi* | [**listOCPAWSCosts**](docs/DefaultApi.md#listocpawscosts) | **GET** /reports/openshift/infrastructures/aws/costs/ | 
*DefaultApi* | [**listOCPAWSInstanceTypes**](docs/DefaultApi.md#listocpawsinstancetypes) | **GET** /reports/openshift/infrastructures/aws/instance-types/ | 
*DefaultApi* | [**listOCPAWSStorages**](docs/DefaultApi.md#listocpawsstorages) | **GET** /reports/openshift/infrastructures/aws/storage/ | 
*DefaultApi* | [**listOCPAWSTags**](docs/DefaultApi.md#listocpawstags) | **GET** /tags/openshift/infrastructures/aws/ | 
*DefaultApi* | [**listOCPCosts**](docs/DefaultApi.md#listocpcosts) | **GET** /reports/openshift/costs/ | 
*DefaultApi* | [**listOCPCpus**](docs/DefaultApi.md#listocpcpus) | **GET** /reports/openshift/compute/ | 
*DefaultApi* | [**listOCPMemorys**](docs/DefaultApi.md#listocpmemorys) | **GET** /reports/openshift/memory/ | 
*DefaultApi* | [**listOCPTags**](docs/DefaultApi.md#listocptags) | **GET** /tags/openshift/ | 
*DefaultApi* | [**listOCPVolumes**](docs/DefaultApi.md#listocpvolumes) | **GET** /reports/openshift/volumes/ | 
*DefaultApi* | [**listProviders**](docs/DefaultApi.md#listproviders) | **GET** /providers/ | 
*DefaultApi* | [**listStatus**](docs/DefaultApi.md#liststatus) | **GET** /status/ | 
*DefaultApi* | [**listUserPreferences**](docs/DefaultApi.md#listuserpreferences) | **GET** /preferences/ | 
*DefaultApi* | [**partialUpdateCostModel**](docs/DefaultApi.md#partialupdatecostmodel) | **PATCH** /costmodels/{uuid}/ | 
*DefaultApi* | [**partialUpdateUserPreference**](docs/DefaultApi.md#partialupdateuserpreference) | **PATCH** /preferences/{uuid}/ | 
*DefaultApi* | [**retrieveCostModel**](docs/DefaultApi.md#retrievecostmodel) | **GET** /costmodels/{uuid}/ | 
*DefaultApi* | [**retrieveProvider**](docs/DefaultApi.md#retrieveprovider) | **GET** /providers/{uuid}/ | 
*DefaultApi* | [**retrieveUserPreference**](docs/DefaultApi.md#retrieveuserpreference) | **GET** /preferences/{uuid}/ | 
*DefaultApi* | [**updateCostModel**](docs/DefaultApi.md#updatecostmodel) | **PUT** /costmodels/{uuid}/ | 
*DefaultApi* | [**updateUserPreference**](docs/DefaultApi.md#updateuserpreference) | **PUT** /preferences/{uuid}/ | 


## Documentation For Models

 - [Filter](docs/Filter.md)
 - [Filter1](docs/Filter1.md)
 - [Filter2](docs/Filter2.md)
 - [InlineResponse200](docs/InlineResponse200.md)
 - [InlineResponse2001](docs/InlineResponse2001.md)
 - [InlineResponse2001Meta](docs/InlineResponse2001Meta.md)
 - [InlineResponse2001MetaFilter](docs/InlineResponse2001MetaFilter.md)
 - [InlineResponse2002](docs/InlineResponse2002.md)
 - [InlineResponse2002Meta](docs/InlineResponse2002Meta.md)
 - [InlineResponse2002MetaFilter](docs/InlineResponse2002MetaFilter.md)
 - [InlineResponse2003](docs/InlineResponse2003.md)
 - [InlineResponse2003Meta](docs/InlineResponse2003Meta.md)
 - [InlineResponse2004](docs/InlineResponse2004.md)
 - [InlineResponse2004Meta](docs/InlineResponse2004Meta.md)
 - [InlineResponse2005](docs/InlineResponse2005.md)
 - [InlineResponse2005Meta](docs/InlineResponse2005Meta.md)
 - [InlineResponse2006](docs/InlineResponse2006.md)
 - [InlineResponse2006Meta](docs/InlineResponse2006Meta.md)
 - [InlineResponse2007](docs/InlineResponse2007.md)
 - [InlineResponse2008](docs/InlineResponse2008.md)
 - [InlineResponse200Links](docs/InlineResponse200Links.md)
 - [InlineResponse200Meta](docs/InlineResponse200Meta.md)
 - [InlineResponse200MetaFilter](docs/InlineResponse200MetaFilter.md)


## Documentation For Authorization

 All endpoints do not require authorization.

