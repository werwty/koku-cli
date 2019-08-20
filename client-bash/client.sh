#!/usr/bin/env bash

# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
# !
# ! Note:
# !
# ! THIS SCRIPT HAS BEEN AUTOMATICALLY GENERATED USING
# ! openapi-generator (https://openapi-generator.tech)
# ! FROM OPENAPI SPECIFICATION IN JSON.
# !
# !
# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

#
# This is a Bash client for Cost Management.
#
# LICENSE:
# https://opensource.org/licenses/AGPL-3.0
#
# CONTACT:
# 
#
# MORE INFORMATION:
# https://github.com/project-koku/
#

# For improved pattern matching in case statemets
shopt -s extglob

###############################################################################
#
# Make sure Bash is at least in version 4.3
#
###############################################################################
if ! ( (("${BASH_VERSION:0:1}" == "4")) && (("${BASH_VERSION:2:1}" >= "3")) ) \
  && ! (("${BASH_VERSION:0:1}" >= "5")); then
    echo ""
    echo "Sorry - your Bash version is ${BASH_VERSION}"
    echo ""
    echo "You need at least Bash 4.3 to run this script."
    echo ""
    exit 1
fi

###############################################################################
#
# Global variables
#
###############################################################################

##
# The filename of this script for help messages
script_name=$(basename "$0")

##
# Map for headers passed after operation as KEY:VALUE
declare -A header_arguments


##
# Map for operation parameters passed after operation as PARAMETER=VALUE
# These will be mapped to appropriate path or query parameters
# The values in operation_parameters are arrays, so that multiple values
# can be provided for the same parameter if allowed by API specification
declare -A operation_parameters

##
# Declare colors with autodection if output is terminal
if [ -t 1 ]; then
    RED="$(tput setaf 1)"
    GREEN="$(tput setaf 2)"
    YELLOW="$(tput setaf 3)"
    BLUE="$(tput setaf 4)"
    MAGENTA="$(tput setaf 5)"
    CYAN="$(tput setaf 6)"
    WHITE="$(tput setaf 7)"
    BOLD="$(tput bold)"
    OFF="$(tput sgr0)"
else
    RED=""
    GREEN=""
    YELLOW=""
    BLUE=""
    MAGENTA=""
    CYAN=""
    WHITE=""
    BOLD=""
    OFF=""
fi

declare -a result_color_table=( "$WHITE" "$WHITE" "$GREEN" "$YELLOW" "$WHITE" "$MAGENTA" "$WHITE" )

##
# This array stores the minimum number of required occurrences for parameter
# 0 - optional
# 1 - required
declare -A operation_parameters_minimum_occurrences
operation_parameters_minimum_occurrences["getAWSCostReports:::delta"]=0
operation_parameters_minimum_occurrences["getAWSCostReports:::filter"]=0
operation_parameters_minimum_occurrences["getAWSCostReports:::group_by"]=0
operation_parameters_minimum_occurrences["getAWSCostReports:::order_by"]=0
operation_parameters_minimum_occurrences["getAWSCostReports:::offset"]=0
operation_parameters_minimum_occurrences["getAWSCostReports:::limit"]=0
operation_parameters_minimum_occurrences["getAWSInstanceReports:::filter"]=0
operation_parameters_minimum_occurrences["getAWSInstanceReports:::group_by"]=0
operation_parameters_minimum_occurrences["getAWSInstanceReports:::order_by"]=0
operation_parameters_minimum_occurrences["getAWSInstanceReports:::units"]=0
operation_parameters_minimum_occurrences["getAWSInstanceReports:::offset"]=0
operation_parameters_minimum_occurrences["getAWSInstanceReports:::limit"]=0
operation_parameters_minimum_occurrences["getAWSStorageReports:::filter"]=0
operation_parameters_minimum_occurrences["getAWSStorageReports:::group_by"]=0
operation_parameters_minimum_occurrences["getAWSStorageReports:::order_by"]=0
operation_parameters_minimum_occurrences["getAWSStorageReports:::units"]=0
operation_parameters_minimum_occurrences["getAWSStorageReports:::offset"]=0
operation_parameters_minimum_occurrences["getAWSStorageReports:::limit"]=0
operation_parameters_minimum_occurrences["createCostModel:::CostModel"]=1
operation_parameters_minimum_occurrences["deleteCostModel:::cost_model_uuid"]=1
operation_parameters_minimum_occurrences["getCostModel:::cost_model_uuid"]=1
operation_parameters_minimum_occurrences["listCostModels:::offset"]=0
operation_parameters_minimum_occurrences["listCostModels:::limit"]=0
operation_parameters_minimum_occurrences["listCostModels:::provider_uuid"]=0
operation_parameters_minimum_occurrences["listCostModels:::source_type"]=0
operation_parameters_minimum_occurrences["listCostModels:::name"]=0
operation_parameters_minimum_occurrences["updateCostModel:::cost_model_uuid"]=1
operation_parameters_minimum_occurrences["updateCostModel:::CostModel"]=1
operation_parameters_minimum_occurrences["getOpenShiftAWSCostReports:::delta"]=0
operation_parameters_minimum_occurrences["getOpenShiftAWSCostReports:::filter"]=0
operation_parameters_minimum_occurrences["getOpenShiftAWSCostReports:::group_by"]=0
operation_parameters_minimum_occurrences["getOpenShiftAWSCostReports:::order_by"]=0
operation_parameters_minimum_occurrences["getOpenShiftAWSCostReports:::offset"]=0
operation_parameters_minimum_occurrences["getOpenShiftAWSCostReports:::limit"]=0
operation_parameters_minimum_occurrences["getOpenShiftAWSInventoryInstanceReport:::filter"]=0
operation_parameters_minimum_occurrences["getOpenShiftAWSInventoryInstanceReport:::group_by"]=0
operation_parameters_minimum_occurrences["getOpenShiftAWSInventoryInstanceReport:::order_by"]=0
operation_parameters_minimum_occurrences["getOpenShiftAWSInventoryInstanceReport:::units"]=0
operation_parameters_minimum_occurrences["getOpenShiftAWSInventoryInstanceReport:::offset"]=0
operation_parameters_minimum_occurrences["getOpenShiftAWSInventoryInstanceReport:::limit"]=0
operation_parameters_minimum_occurrences["getOpenShiftAWSInventoryStorageReport:::filter"]=0
operation_parameters_minimum_occurrences["getOpenShiftAWSInventoryStorageReport:::group_by"]=0
operation_parameters_minimum_occurrences["getOpenShiftAWSInventoryStorageReport:::order_by"]=0
operation_parameters_minimum_occurrences["getOpenShiftAWSInventoryStorageReport:::units"]=0
operation_parameters_minimum_occurrences["getOpenShiftAWSInventoryStorageReport:::offset"]=0
operation_parameters_minimum_occurrences["getOpenShiftAWSInventoryStorageReport:::limit"]=0
operation_parameters_minimum_occurrences["getOpenShiftComputeReports:::filter"]=0
operation_parameters_minimum_occurrences["getOpenShiftComputeReports:::group_by"]=0
operation_parameters_minimum_occurrences["getOpenShiftComputeReports:::order_by"]=0
operation_parameters_minimum_occurrences["getOpenShiftComputeReports:::offset"]=0
operation_parameters_minimum_occurrences["getOpenShiftComputeReports:::limit"]=0
operation_parameters_minimum_occurrences["getOpenShiftCostReports:::delta"]=0
operation_parameters_minimum_occurrences["getOpenShiftCostReports:::filter"]=0
operation_parameters_minimum_occurrences["getOpenShiftCostReports:::group_by"]=0
operation_parameters_minimum_occurrences["getOpenShiftCostReports:::order_by"]=0
operation_parameters_minimum_occurrences["getOpenShiftCostReports:::offset"]=0
operation_parameters_minimum_occurrences["getOpenShiftCostReports:::limit"]=0
operation_parameters_minimum_occurrences["getOpenShiftMemoryReports:::filter"]=0
operation_parameters_minimum_occurrences["getOpenShiftMemoryReports:::group_by"]=0
operation_parameters_minimum_occurrences["getOpenShiftMemoryReports:::order_by"]=0
operation_parameters_minimum_occurrences["getOpenShiftMemoryReports:::offset"]=0
operation_parameters_minimum_occurrences["getOpenShiftMemoryReports:::limit"]=0
operation_parameters_minimum_occurrences["getOpenShiftVolumeReports:::filter"]=0
operation_parameters_minimum_occurrences["getOpenShiftVolumeReports:::group_by"]=0
operation_parameters_minimum_occurrences["getOpenShiftVolumeReports:::order_by"]=0
operation_parameters_minimum_occurrences["getOpenShiftVolumeReports:::offset"]=0
operation_parameters_minimum_occurrences["getOpenShiftVolumeReports:::limit"]=0
operation_parameters_minimum_occurrences["createProvider:::ProviderIn"]=1
operation_parameters_minimum_occurrences["deleteProvider:::uuid"]=1
operation_parameters_minimum_occurrences["getProvider:::uuid"]=1
operation_parameters_minimum_occurrences["listProviders:::type"]=0
operation_parameters_minimum_occurrences["listProviders:::name"]=0
operation_parameters_minimum_occurrences["listProviders:::offset"]=0
operation_parameters_minimum_occurrences["listProviders:::limit"]=0
operation_parameters_minimum_occurrences["getAWSTagData:::filter"]=0
operation_parameters_minimum_occurrences["getAWSTagData:::key_only"]=0
operation_parameters_minimum_occurrences["getAWSTagData:::offset"]=0
operation_parameters_minimum_occurrences["getAWSTagData:::limit"]=0
operation_parameters_minimum_occurrences["getOpenShiftAWSTagData:::filter"]=0
operation_parameters_minimum_occurrences["getOpenShiftAWSTagData:::key_only"]=0
operation_parameters_minimum_occurrences["getOpenShiftAWSTagData:::offset"]=0
operation_parameters_minimum_occurrences["getOpenShiftAWSTagData:::limit"]=0
operation_parameters_minimum_occurrences["getOpenShiftTagData:::filter"]=0
operation_parameters_minimum_occurrences["getOpenShiftTagData:::key_only"]=0
operation_parameters_minimum_occurrences["getOpenShiftTagData:::offset"]=0
operation_parameters_minimum_occurrences["getOpenShiftTagData:::limit"]=0
operation_parameters_minimum_occurrences["createUserPreference:::UserPreference"]=1
operation_parameters_minimum_occurrences["deleteUserPreference:::pref_uuid"]=1
operation_parameters_minimum_occurrences["getUserPreference:::pref_uuid"]=1
operation_parameters_minimum_occurrences["listUserPreferences:::offset"]=0
operation_parameters_minimum_occurrences["listUserPreferences:::limit"]=0
operation_parameters_minimum_occurrences["updateUserPreference:::pref_uuid"]=1
operation_parameters_minimum_occurrences["updateUserPreference:::UserPreference"]=1

##
# This array stores the maximum number of allowed occurrences for parameter
# 1 - single value
# 2 - 2 values
# N - N values
# 0 - unlimited
declare -A operation_parameters_maximum_occurrences
operation_parameters_maximum_occurrences["getAWSCostReports:::delta"]=0
operation_parameters_maximum_occurrences["getAWSCostReports:::filter"]=0
operation_parameters_maximum_occurrences["getAWSCostReports:::group_by"]=0
operation_parameters_maximum_occurrences["getAWSCostReports:::order_by"]=0
operation_parameters_maximum_occurrences["getAWSCostReports:::offset"]=0
operation_parameters_maximum_occurrences["getAWSCostReports:::limit"]=0
operation_parameters_maximum_occurrences["getAWSInstanceReports:::filter"]=0
operation_parameters_maximum_occurrences["getAWSInstanceReports:::group_by"]=0
operation_parameters_maximum_occurrences["getAWSInstanceReports:::order_by"]=0
operation_parameters_maximum_occurrences["getAWSInstanceReports:::units"]=0
operation_parameters_maximum_occurrences["getAWSInstanceReports:::offset"]=0
operation_parameters_maximum_occurrences["getAWSInstanceReports:::limit"]=0
operation_parameters_maximum_occurrences["getAWSStorageReports:::filter"]=0
operation_parameters_maximum_occurrences["getAWSStorageReports:::group_by"]=0
operation_parameters_maximum_occurrences["getAWSStorageReports:::order_by"]=0
operation_parameters_maximum_occurrences["getAWSStorageReports:::units"]=0
operation_parameters_maximum_occurrences["getAWSStorageReports:::offset"]=0
operation_parameters_maximum_occurrences["getAWSStorageReports:::limit"]=0
operation_parameters_maximum_occurrences["createCostModel:::CostModel"]=0
operation_parameters_maximum_occurrences["deleteCostModel:::cost_model_uuid"]=0
operation_parameters_maximum_occurrences["getCostModel:::cost_model_uuid"]=0
operation_parameters_maximum_occurrences["listCostModels:::offset"]=0
operation_parameters_maximum_occurrences["listCostModels:::limit"]=0
operation_parameters_maximum_occurrences["listCostModels:::provider_uuid"]=0
operation_parameters_maximum_occurrences["listCostModels:::source_type"]=0
operation_parameters_maximum_occurrences["listCostModels:::name"]=0
operation_parameters_maximum_occurrences["updateCostModel:::cost_model_uuid"]=0
operation_parameters_maximum_occurrences["updateCostModel:::CostModel"]=0
operation_parameters_maximum_occurrences["getOpenShiftAWSCostReports:::delta"]=0
operation_parameters_maximum_occurrences["getOpenShiftAWSCostReports:::filter"]=0
operation_parameters_maximum_occurrences["getOpenShiftAWSCostReports:::group_by"]=0
operation_parameters_maximum_occurrences["getOpenShiftAWSCostReports:::order_by"]=0
operation_parameters_maximum_occurrences["getOpenShiftAWSCostReports:::offset"]=0
operation_parameters_maximum_occurrences["getOpenShiftAWSCostReports:::limit"]=0
operation_parameters_maximum_occurrences["getOpenShiftAWSInventoryInstanceReport:::filter"]=0
operation_parameters_maximum_occurrences["getOpenShiftAWSInventoryInstanceReport:::group_by"]=0
operation_parameters_maximum_occurrences["getOpenShiftAWSInventoryInstanceReport:::order_by"]=0
operation_parameters_maximum_occurrences["getOpenShiftAWSInventoryInstanceReport:::units"]=0
operation_parameters_maximum_occurrences["getOpenShiftAWSInventoryInstanceReport:::offset"]=0
operation_parameters_maximum_occurrences["getOpenShiftAWSInventoryInstanceReport:::limit"]=0
operation_parameters_maximum_occurrences["getOpenShiftAWSInventoryStorageReport:::filter"]=0
operation_parameters_maximum_occurrences["getOpenShiftAWSInventoryStorageReport:::group_by"]=0
operation_parameters_maximum_occurrences["getOpenShiftAWSInventoryStorageReport:::order_by"]=0
operation_parameters_maximum_occurrences["getOpenShiftAWSInventoryStorageReport:::units"]=0
operation_parameters_maximum_occurrences["getOpenShiftAWSInventoryStorageReport:::offset"]=0
operation_parameters_maximum_occurrences["getOpenShiftAWSInventoryStorageReport:::limit"]=0
operation_parameters_maximum_occurrences["getOpenShiftComputeReports:::filter"]=0
operation_parameters_maximum_occurrences["getOpenShiftComputeReports:::group_by"]=0
operation_parameters_maximum_occurrences["getOpenShiftComputeReports:::order_by"]=0
operation_parameters_maximum_occurrences["getOpenShiftComputeReports:::offset"]=0
operation_parameters_maximum_occurrences["getOpenShiftComputeReports:::limit"]=0
operation_parameters_maximum_occurrences["getOpenShiftCostReports:::delta"]=0
operation_parameters_maximum_occurrences["getOpenShiftCostReports:::filter"]=0
operation_parameters_maximum_occurrences["getOpenShiftCostReports:::group_by"]=0
operation_parameters_maximum_occurrences["getOpenShiftCostReports:::order_by"]=0
operation_parameters_maximum_occurrences["getOpenShiftCostReports:::offset"]=0
operation_parameters_maximum_occurrences["getOpenShiftCostReports:::limit"]=0
operation_parameters_maximum_occurrences["getOpenShiftMemoryReports:::filter"]=0
operation_parameters_maximum_occurrences["getOpenShiftMemoryReports:::group_by"]=0
operation_parameters_maximum_occurrences["getOpenShiftMemoryReports:::order_by"]=0
operation_parameters_maximum_occurrences["getOpenShiftMemoryReports:::offset"]=0
operation_parameters_maximum_occurrences["getOpenShiftMemoryReports:::limit"]=0
operation_parameters_maximum_occurrences["getOpenShiftVolumeReports:::filter"]=0
operation_parameters_maximum_occurrences["getOpenShiftVolumeReports:::group_by"]=0
operation_parameters_maximum_occurrences["getOpenShiftVolumeReports:::order_by"]=0
operation_parameters_maximum_occurrences["getOpenShiftVolumeReports:::offset"]=0
operation_parameters_maximum_occurrences["getOpenShiftVolumeReports:::limit"]=0
operation_parameters_maximum_occurrences["createProvider:::ProviderIn"]=0
operation_parameters_maximum_occurrences["deleteProvider:::uuid"]=0
operation_parameters_maximum_occurrences["getProvider:::uuid"]=0
operation_parameters_maximum_occurrences["listProviders:::type"]=0
operation_parameters_maximum_occurrences["listProviders:::name"]=0
operation_parameters_maximum_occurrences["listProviders:::offset"]=0
operation_parameters_maximum_occurrences["listProviders:::limit"]=0
operation_parameters_maximum_occurrences["getAWSTagData:::filter"]=0
operation_parameters_maximum_occurrences["getAWSTagData:::key_only"]=0
operation_parameters_maximum_occurrences["getAWSTagData:::offset"]=0
operation_parameters_maximum_occurrences["getAWSTagData:::limit"]=0
operation_parameters_maximum_occurrences["getOpenShiftAWSTagData:::filter"]=0
operation_parameters_maximum_occurrences["getOpenShiftAWSTagData:::key_only"]=0
operation_parameters_maximum_occurrences["getOpenShiftAWSTagData:::offset"]=0
operation_parameters_maximum_occurrences["getOpenShiftAWSTagData:::limit"]=0
operation_parameters_maximum_occurrences["getOpenShiftTagData:::filter"]=0
operation_parameters_maximum_occurrences["getOpenShiftTagData:::key_only"]=0
operation_parameters_maximum_occurrences["getOpenShiftTagData:::offset"]=0
operation_parameters_maximum_occurrences["getOpenShiftTagData:::limit"]=0
operation_parameters_maximum_occurrences["createUserPreference:::UserPreference"]=0
operation_parameters_maximum_occurrences["deleteUserPreference:::pref_uuid"]=0
operation_parameters_maximum_occurrences["getUserPreference:::pref_uuid"]=0
operation_parameters_maximum_occurrences["listUserPreferences:::offset"]=0
operation_parameters_maximum_occurrences["listUserPreferences:::limit"]=0
operation_parameters_maximum_occurrences["updateUserPreference:::pref_uuid"]=0
operation_parameters_maximum_occurrences["updateUserPreference:::UserPreference"]=0

##
# The type of collection for specifying multiple values for parameter:
# - multi, csv, ssv, tsv
declare -A operation_parameters_collection_type
operation_parameters_collection_type["getAWSCostReports:::delta"]=""
operation_parameters_collection_type["getAWSCostReports:::filter"]=""
operation_parameters_collection_type["getAWSCostReports:::group_by"]=""
operation_parameters_collection_type["getAWSCostReports:::order_by"]=""
operation_parameters_collection_type["getAWSCostReports:::offset"]=""
operation_parameters_collection_type["getAWSCostReports:::limit"]=""
operation_parameters_collection_type["getAWSInstanceReports:::filter"]=""
operation_parameters_collection_type["getAWSInstanceReports:::group_by"]=""
operation_parameters_collection_type["getAWSInstanceReports:::order_by"]=""
operation_parameters_collection_type["getAWSInstanceReports:::units"]=""
operation_parameters_collection_type["getAWSInstanceReports:::offset"]=""
operation_parameters_collection_type["getAWSInstanceReports:::limit"]=""
operation_parameters_collection_type["getAWSStorageReports:::filter"]=""
operation_parameters_collection_type["getAWSStorageReports:::group_by"]=""
operation_parameters_collection_type["getAWSStorageReports:::order_by"]=""
operation_parameters_collection_type["getAWSStorageReports:::units"]=""
operation_parameters_collection_type["getAWSStorageReports:::offset"]=""
operation_parameters_collection_type["getAWSStorageReports:::limit"]=""
operation_parameters_collection_type["createCostModel:::CostModel"]=""
operation_parameters_collection_type["deleteCostModel:::cost_model_uuid"]=""
operation_parameters_collection_type["getCostModel:::cost_model_uuid"]=""
operation_parameters_collection_type["listCostModels:::offset"]=""
operation_parameters_collection_type["listCostModels:::limit"]=""
operation_parameters_collection_type["listCostModels:::provider_uuid"]=""
operation_parameters_collection_type["listCostModels:::source_type"]=""
operation_parameters_collection_type["listCostModels:::name"]=""
operation_parameters_collection_type["updateCostModel:::cost_model_uuid"]=""
operation_parameters_collection_type["updateCostModel:::CostModel"]=""
operation_parameters_collection_type["getOpenShiftAWSCostReports:::delta"]=""
operation_parameters_collection_type["getOpenShiftAWSCostReports:::filter"]=""
operation_parameters_collection_type["getOpenShiftAWSCostReports:::group_by"]=""
operation_parameters_collection_type["getOpenShiftAWSCostReports:::order_by"]=""
operation_parameters_collection_type["getOpenShiftAWSCostReports:::offset"]=""
operation_parameters_collection_type["getOpenShiftAWSCostReports:::limit"]=""
operation_parameters_collection_type["getOpenShiftAWSInventoryInstanceReport:::filter"]=""
operation_parameters_collection_type["getOpenShiftAWSInventoryInstanceReport:::group_by"]=""
operation_parameters_collection_type["getOpenShiftAWSInventoryInstanceReport:::order_by"]=""
operation_parameters_collection_type["getOpenShiftAWSInventoryInstanceReport:::units"]=""
operation_parameters_collection_type["getOpenShiftAWSInventoryInstanceReport:::offset"]=""
operation_parameters_collection_type["getOpenShiftAWSInventoryInstanceReport:::limit"]=""
operation_parameters_collection_type["getOpenShiftAWSInventoryStorageReport:::filter"]=""
operation_parameters_collection_type["getOpenShiftAWSInventoryStorageReport:::group_by"]=""
operation_parameters_collection_type["getOpenShiftAWSInventoryStorageReport:::order_by"]=""
operation_parameters_collection_type["getOpenShiftAWSInventoryStorageReport:::units"]=""
operation_parameters_collection_type["getOpenShiftAWSInventoryStorageReport:::offset"]=""
operation_parameters_collection_type["getOpenShiftAWSInventoryStorageReport:::limit"]=""
operation_parameters_collection_type["getOpenShiftComputeReports:::filter"]=""
operation_parameters_collection_type["getOpenShiftComputeReports:::group_by"]=""
operation_parameters_collection_type["getOpenShiftComputeReports:::order_by"]=""
operation_parameters_collection_type["getOpenShiftComputeReports:::offset"]=""
operation_parameters_collection_type["getOpenShiftComputeReports:::limit"]=""
operation_parameters_collection_type["getOpenShiftCostReports:::delta"]=""
operation_parameters_collection_type["getOpenShiftCostReports:::filter"]=""
operation_parameters_collection_type["getOpenShiftCostReports:::group_by"]=""
operation_parameters_collection_type["getOpenShiftCostReports:::order_by"]=""
operation_parameters_collection_type["getOpenShiftCostReports:::offset"]=""
operation_parameters_collection_type["getOpenShiftCostReports:::limit"]=""
operation_parameters_collection_type["getOpenShiftMemoryReports:::filter"]=""
operation_parameters_collection_type["getOpenShiftMemoryReports:::group_by"]=""
operation_parameters_collection_type["getOpenShiftMemoryReports:::order_by"]=""
operation_parameters_collection_type["getOpenShiftMemoryReports:::offset"]=""
operation_parameters_collection_type["getOpenShiftMemoryReports:::limit"]=""
operation_parameters_collection_type["getOpenShiftVolumeReports:::filter"]=""
operation_parameters_collection_type["getOpenShiftVolumeReports:::group_by"]=""
operation_parameters_collection_type["getOpenShiftVolumeReports:::order_by"]=""
operation_parameters_collection_type["getOpenShiftVolumeReports:::offset"]=""
operation_parameters_collection_type["getOpenShiftVolumeReports:::limit"]=""
operation_parameters_collection_type["createProvider:::ProviderIn"]=""
operation_parameters_collection_type["deleteProvider:::uuid"]=""
operation_parameters_collection_type["getProvider:::uuid"]=""
operation_parameters_collection_type["listProviders:::type"]=""
operation_parameters_collection_type["listProviders:::name"]=""
operation_parameters_collection_type["listProviders:::offset"]=""
operation_parameters_collection_type["listProviders:::limit"]=""
operation_parameters_collection_type["getAWSTagData:::filter"]=""
operation_parameters_collection_type["getAWSTagData:::key_only"]=""
operation_parameters_collection_type["getAWSTagData:::offset"]=""
operation_parameters_collection_type["getAWSTagData:::limit"]=""
operation_parameters_collection_type["getOpenShiftAWSTagData:::filter"]=""
operation_parameters_collection_type["getOpenShiftAWSTagData:::key_only"]=""
operation_parameters_collection_type["getOpenShiftAWSTagData:::offset"]=""
operation_parameters_collection_type["getOpenShiftAWSTagData:::limit"]=""
operation_parameters_collection_type["getOpenShiftTagData:::filter"]=""
operation_parameters_collection_type["getOpenShiftTagData:::key_only"]=""
operation_parameters_collection_type["getOpenShiftTagData:::offset"]=""
operation_parameters_collection_type["getOpenShiftTagData:::limit"]=""
operation_parameters_collection_type["createUserPreference:::UserPreference"]=""
operation_parameters_collection_type["deleteUserPreference:::pref_uuid"]=""
operation_parameters_collection_type["getUserPreference:::pref_uuid"]=""
operation_parameters_collection_type["listUserPreferences:::offset"]=""
operation_parameters_collection_type["listUserPreferences:::limit"]=""
operation_parameters_collection_type["updateUserPreference:::pref_uuid"]=""
operation_parameters_collection_type["updateUserPreference:::UserPreference"]=""


##
# Map for body parameters passed after operation as
# PARAMETER==STRING_VALUE or PARAMETER:=NUMERIC_VALUE
# These will be mapped to top level json keys ( { "PARAMETER": "VALUE" })
declare -A body_parameters

##
# These arguments will be directly passed to cURL
curl_arguments=""

##
# The host for making the request
host=""

##
# The user credentials for basic authentication
basic_auth_credential=""


##
# If true, the script will only output the actual cURL command that would be
# used
print_curl=false

##
# The operation ID passed on the command line
operation=""

##
# The provided Accept header value
header_accept=""

##
# The provided Content-type header value
header_content_type=""

##
# If there is any body content on the stdin pass it to the body of the request
body_content_temp_file=""

##
# If this variable is set to true, the request will be performed even
# if parameters for required query, header or body values are not provided
# (path parameters are still required).
force=false

##
# Declare some mime types abbreviations for easier content-type and accepts
# headers specification
declare -A mime_type_abbreviations
# text/*
mime_type_abbreviations["text"]="text/plain"
mime_type_abbreviations["html"]="text/html"
mime_type_abbreviations["md"]="text/x-markdown"
mime_type_abbreviations["csv"]="text/csv"
mime_type_abbreviations["css"]="text/css"
mime_type_abbreviations["rtf"]="text/rtf"
# application/*
mime_type_abbreviations["json"]="application/json"
mime_type_abbreviations["xml"]="application/xml"
mime_type_abbreviations["yaml"]="application/yaml"
mime_type_abbreviations["js"]="application/javascript"
mime_type_abbreviations["bin"]="application/octet-stream"
mime_type_abbreviations["rdf"]="application/rdf+xml"
# image/*
mime_type_abbreviations["jpg"]="image/jpeg"
mime_type_abbreviations["png"]="image/png"
mime_type_abbreviations["gif"]="image/gif"
mime_type_abbreviations["bmp"]="image/bmp"
mime_type_abbreviations["tiff"]="image/tiff"


##############################################################################
#
# Escape special URL characters
# Based on table at http://www.w3schools.com/tags/ref_urlencode.asp
#
##############################################################################
url_escape() {
    local raw_url="$1"

    value=$(sed -e 's/ /%20/g' \
       -e 's/!/%21/g' \
       -e 's/"/%22/g' \
       -e 's/#/%23/g' \
       -e 's/\&/%26/g' \
       -e 's/'\''/%28/g' \
       -e 's/(/%28/g' \
       -e 's/)/%29/g' \
       -e 's/:/%3A/g' \
       -e 's/\t/%09/g' \
       -e 's/?/%3F/g' <<<"$raw_url");

    echo "$value"
}

##############################################################################
#
# Lookup the mime type abbreviation in the mime_type_abbreviations array.
# If not present assume the user provided a valid mime type
#
##############################################################################
lookup_mime_type() {
    local mime_type="$1"

    if [[ ${mime_type_abbreviations[$mime_type]} ]]; then
        echo "${mime_type_abbreviations[$mime_type]}"
    else
        echo "$mime_type"
    fi
}

##############################################################################
#
# Converts an associative array into a list of cURL header
# arguments (-H "KEY: VALUE")
#
##############################################################################
header_arguments_to_curl() {
    local headers_curl=""

    for key in "${!header_arguments[@]}"; do
        headers_curl+="-H \"${key}: ${header_arguments[${key}]}\" "
    done
    headers_curl+=" "

    echo "${headers_curl}"
}

##############################################################################
#
# Converts an associative array into a simple JSON with keys as top
# level object attributes
#
# \todo Add conversion of more complex attributes using paths
#
##############################################################################
body_parameters_to_json() {
    local body_json="-d '{"
    local count=0
    for key in "${!body_parameters[@]}"; do
        if [[ $((count++)) -gt 0 ]]; then
            body_json+=", "
        fi
        body_json+="\"${key}\": ${body_parameters[${key}]}"
    done
    body_json+="}'"

    if [[ "${#body_parameters[@]}" -eq 0 ]]; then
        echo ""
    else
        echo "${body_json}"
    fi
}

##############################################################################
#
# Helper method for showing error because for example echo in
# build_request_path() is evaluated as part of command line not printed on
# output. Anyway better idea for resource clean up ;-).
#
##############################################################################
ERROR_MSG=""
function finish {
    if [[ -n "$ERROR_MSG" ]]; then
        echo >&2 "${OFF}${RED}$ERROR_MSG"
        echo >&2 "${OFF}Check usage: '${script_name} --help'"
    fi
}
trap finish EXIT


##############################################################################
#
# Validate and build request path including query parameters
#
##############################################################################
build_request_path() {
    local path_template=$1
    local -n path_params=$2
    local -n query_params=$3


    #
    # Check input parameters count against minimum and maximum required
    #
    if [[ "$force" = false ]]; then
        local was_error=""
        for qparam in "${query_params[@]}" "${path_params[@]}"; do
            local parameter_values
            mapfile -t parameter_values < <(sed -e 's/'":::"'/\n/g' <<<"${operation_parameters[$qparam]}")

            #
            # Check if the number of provided values is not less than minimum required
            #
            if [[ ${#parameter_values[@]} -lt ${operation_parameters_minimum_occurrences["${operation}:::${qparam}"]} ]]; then
                echo "ERROR: Too few values provided for '${qparam}' parameter."
                was_error=true
            fi

            #
            # Check if the number of provided values is not more than maximum
            #
            if [[ ${operation_parameters_maximum_occurrences["${operation}:::${qparam}"]} -gt 0 \
                  && ${#parameter_values[@]} -gt ${operation_parameters_maximum_occurrences["${operation}:::${qparam}"]} ]]; then
                echo "ERROR: Too many values provided for '${qparam}' parameter"
                was_error=true
            fi
        done
        if [[ -n "$was_error" ]]; then
            exit 1
        fi
    fi

    # First replace all path parameters in the path
    for pparam in "${path_params[@]}"; do
        local path_regex="(.*)(\\{$pparam\\})(.*)"
        if [[ $path_template =~ $path_regex ]]; then
            path_template=${BASH_REMATCH[1]}${operation_parameters[$pparam]}${BASH_REMATCH[3]}
        fi
    done

    local query_request_part=""

    for qparam in "${query_params[@]}"; do
        if [[ "${operation_parameters[$qparam]}" == "" ]]; then
            continue
        fi

        # Get the array of parameter values
        local parameter_value=""
        local parameter_values
        mapfile -t parameter_values < <(sed -e 's/'":::"'/\n/g' <<<"${operation_parameters[$qparam]}")



        #
        # Append parameters without specific cardinality
        #
        local collection_type="${operation_parameters_collection_type["${operation}:::${qparam}"]}"
        if [[ "${collection_type}" == "" ]]; then
            local vcount=0
            for qvalue in "${parameter_values[@]}"; do
                if [[ $((vcount++)) -gt 0 ]]; then
                    parameter_value+="&"
                fi
                parameter_value+="${qparam}=${qvalue}"
            done
        #
        # Append parameters specified as 'mutli' collections i.e. param=value1&param=value2&...
        #
        elif [[ "${collection_type}" == "multi" ]]; then
            local vcount=0
            for qvalue in "${parameter_values[@]}"; do
                if [[ $((vcount++)) -gt 0 ]]; then
                    parameter_value+="&"
                fi
                parameter_value+="${qparam}=${qvalue}"
            done
        #
        # Append parameters specified as 'csv' collections i.e. param=value1,value2,...
        #
        elif [[ "${collection_type}" == "csv" ]]; then
            parameter_value+="${qparam}="
            local vcount=0
            for qvalue in "${parameter_values[@]}"; do
                if [[ $((vcount++)) -gt 0 ]]; then
                    parameter_value+=","
                fi
                parameter_value+="${qvalue}"
            done
        #
        # Append parameters specified as 'ssv' collections i.e. param="value1 value2 ..."
        #
        elif [[ "${collection_type}" == "ssv" ]]; then
            parameter_value+="${qparam}="
            local vcount=0
            for qvalue in "${parameter_values[@]}"; do
                if [[ $((vcount++)) -gt 0 ]]; then
                    parameter_value+=" "
                fi
                parameter_value+="${qvalue}"
            done
        #
        # Append parameters specified as 'tsv' collections i.e. param="value1\tvalue2\t..."
        #
        elif [[ "${collection_type}" == "tsv" ]]; then
            parameter_value+="${qparam}="
            local vcount=0
            for qvalue in "${parameter_values[@]}"; do
                if [[ $((vcount++)) -gt 0 ]]; then
                    parameter_value+="\\t"
                fi
                parameter_value+="${qvalue}"
            done
        else
            echo "Unsupported collection format \"${collection_type}\""
            exit 1
        fi

        if [[ -n "${parameter_value}" ]]; then
            if [[ -n "${query_request_part}" ]]; then
                query_request_part+="&"
            fi
            query_request_part+="${parameter_value}"
        fi

    done


    # Now append query parameters - if any
    if [[ -n "${query_request_part}" ]]; then
        path_template+="?${query_request_part}"
    fi

    echo "$path_template"
}



###############################################################################
#
# Print main help message
#
###############################################################################
print_help() {
cat <<EOF

${BOLD}${WHITE}Cost Management command line client (API version 1.0.0)${OFF}

${BOLD}${WHITE}Usage${OFF}

  ${GREEN}${script_name}${OFF} [-h|--help] [-V|--version] [--about] [${RED}<curl-options>${OFF}]
           [-ac|--accept ${GREEN}<mime-type>${OFF}] [-ct,--content-type ${GREEN}<mime-type>${OFF}]
           [--host ${CYAN}<url>${OFF}] [--dry-run] [-nc|--no-colors] ${YELLOW}<operation>${OFF} [-h|--help]
           [${BLUE}<headers>${OFF}] [${MAGENTA}<parameters>${OFF}] [${MAGENTA}<body-parameters>${OFF}]

  - ${CYAN}<url>${OFF} - endpoint of the REST service without basepath

  - ${RED}<curl-options>${OFF} - any valid cURL options can be passed before ${YELLOW}<operation>${OFF}
  - ${GREEN}<mime-type>${OFF} - either full mime-type or one of supported abbreviations:
                   (text, html, md, csv, css, rtf, json, xml, yaml, js, bin,
                    rdf, jpg, png, gif, bmp, tiff)
  - ${BLUE}<headers>${OFF} - HTTP headers can be passed in the form ${YELLOW}HEADER${OFF}:${BLUE}VALUE${OFF}
  - ${MAGENTA}<parameters>${OFF} - REST operation parameters can be passed in the following
                   forms:
                   * ${YELLOW}KEY${OFF}=${BLUE}VALUE${OFF} - path or query parameters
  - ${MAGENTA}<body-parameters>${OFF} - simple JSON body content (first level only) can be build
                        using the following arguments:
                        * ${YELLOW}KEY${OFF}==${BLUE}VALUE${OFF} - body parameters which will be added to body
                                      JSON as '{ ..., "${YELLOW}KEY${OFF}": "${BLUE}VALUE${OFF}", ... }'
                        * ${YELLOW}KEY${OFF}:=${BLUE}VALUE${OFF} - body parameters which will be added to body
                                      JSON as '{ ..., "${YELLOW}KEY${OFF}": ${BLUE}VALUE${OFF}, ... }'

EOF
    echo -e "${BOLD}${WHITE}Authentication methods${OFF}"
    echo -e ""
    echo -e "  - ${BLUE}Basic AUTH${OFF} - add '-u <username>:<password>' before ${YELLOW}<operation>${OFF}"
    
    echo ""
    echo -e "${BOLD}${WHITE}Operations (grouped by tags)${OFF}"
    echo ""
    echo -e "${BOLD}${WHITE}[aWSReport]${OFF}"
read -r -d '' ops <<EOF
  ${CYAN}getAWSCostReports${OFF};Query to obtain cost reports (AUTH)
  ${CYAN}getAWSInstanceReports${OFF};Query to obtain AWS instance type data (AUTH)
  ${CYAN}getAWSStorageReports${OFF};Query to obtain AWS storage data (AUTH)
EOF
echo "  $ops" | column -t -s ';'
    echo ""
    echo -e "${BOLD}${WHITE}[costModel]${OFF}"
read -r -d '' ops <<EOF
  ${CYAN}createCostModel${OFF};Create a new cost model. (AUTH)
  ${CYAN}deleteCostModel${OFF};Delete a Cost Model (AUTH)
  ${CYAN}getCostModel${OFF};Get a Cost Model. (AUTH)
  ${CYAN}listCostModels${OFF};List the cost models
  ${CYAN}updateCostModel${OFF};Update a Cost Model (AUTH)
EOF
echo "  $ops" | column -t -s ';'
    echo ""
    echo -e "${BOLD}${WHITE}[openShiftReport]${OFF}"
read -r -d '' ops <<EOF
  ${CYAN}getOpenShiftAWSCostReports${OFF};Query to obtain OpenShift on AWS cost reports (AUTH)
  ${CYAN}getOpenShiftAWSInventoryInstanceReport${OFF};Query to obtain OpenShift on AWS instance data (AUTH)
  ${CYAN}getOpenShiftAWSInventoryStorageReport${OFF};Query to obtain OpenShift on AWS storage data (AUTH)
  ${CYAN}getOpenShiftComputeReports${OFF};Query to obtain OpenShift compute usage information (AUTH)
  ${CYAN}getOpenShiftCostReports${OFF};Query to obtain cost reports (AUTH)
  ${CYAN}getOpenShiftMemoryReports${OFF};Query to obtain OpenShift memory usage information (AUTH)
  ${CYAN}getOpenShiftVolumeReports${OFF};Query to obtain OpenShift volume usage information (AUTH)
EOF
echo "  $ops" | column -t -s ';'
    echo ""
    echo -e "${BOLD}${WHITE}[provider]${OFF}"
read -r -d '' ops <<EOF
  ${CYAN}createProvider${OFF};Create a provider (AUTH)
  ${CYAN}deleteProvider${OFF};Delete a provider (AUTH)
  ${CYAN}getProvider${OFF};Get a provider (AUTH)
  ${CYAN}listProviders${OFF};List the providers (AUTH)
EOF
echo "  $ops" | column -t -s ';'
    echo ""
    echo -e "${BOLD}${WHITE}[status]${OFF}"
read -r -d '' ops <<EOF
  ${CYAN}getStatus${OFF};Obtain server status
EOF
echo "  $ops" | column -t -s ';'
    echo ""
    echo -e "${BOLD}${WHITE}[tags]${OFF}"
read -r -d '' ops <<EOF
  ${CYAN}getAWSTagData${OFF};Query to obtain AWS tags (AUTH)
  ${CYAN}getOpenShiftAWSTagData${OFF};Query to obtain OpenShift-on-AWS tags (AUTH)
  ${CYAN}getOpenShiftTagData${OFF};Query to obtain OpenShift tags (AUTH)
EOF
echo "  $ops" | column -t -s ';'
    echo ""
    echo -e "${BOLD}${WHITE}[userPreference]${OFF}"
read -r -d '' ops <<EOF
  ${CYAN}createUserPreference${OFF};Create a user preference (AUTH)
  ${CYAN}deleteUserPreference${OFF};Delete a user preference (AUTH)
  ${CYAN}getUserPreference${OFF};Get a user preference (AUTH)
  ${CYAN}listUserPreferences${OFF};List the user's preferences (AUTH)
  ${CYAN}updateUserPreference${OFF};Update a user preference (AUTH)
EOF
echo "  $ops" | column -t -s ';'
    echo ""
    echo -e "${BOLD}${WHITE}Options${OFF}"
    echo -e "  -h,--help\\t\\t\\t\\tPrint this help"
    echo -e "  -V,--version\\t\\t\\t\\tPrint API version"
    echo -e "  --about\\t\\t\\t\\tPrint the information about service"
    echo -e "  --host ${CYAN}<url>${OFF}\\t\\t\\t\\tSpecify the host URL "
echo -e "              \\t\\t\\t\\t(e.g. 'https://localhost')"

    echo -e "  --force\\t\\t\\t\\tForce command invocation in spite of missing"
    echo -e "         \\t\\t\\t\\trequired parameters or wrong content type"
    echo -e "  --dry-run\\t\\t\\t\\tPrint out the cURL command without"
    echo -e "           \\t\\t\\t\\texecuting it"
    echo -e "  -nc,--no-colors\\t\\t\\tEnforce print without colors, otherwise autodected"
    echo -e "  -ac,--accept ${YELLOW}<mime-type>${OFF}\\t\\tSet the 'Accept' header in the request"
    echo -e "  -ct,--content-type ${YELLOW}<mime-type>${OFF}\\tSet the 'Content-type' header in "
    echo -e "                                \\tthe request"
    echo ""
}


##############################################################################
#
# Print REST service description
#
##############################################################################
print_about() {
    echo ""
    echo -e "${BOLD}${WHITE}Cost Management command line client (API version 1.0.0)${OFF}"
    echo ""
    echo -e "License: AGPL-3.0"
    echo -e "Contact: "
    echo ""
read -r -d '' appdescription <<EOF

The API for Cost Management.  You can find out more about     Cost Management at [https://github.com/project-koku/](https://github.com/project-koku/).
EOF
echo "$appdescription" | paste -sd' ' | fold -sw 80
}


##############################################################################
#
# Print REST api version
#
##############################################################################
print_version() {
    echo ""
    echo -e "${BOLD}Cost Management command line client (API version 1.0.0)${OFF}"
    echo ""
}

##############################################################################
#
# Print help for getAWSCostReports operation
#
##############################################################################
print_getAWSCostReports_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getAWSCostReports - Query to obtain cost reports${OFF}${BLUE}(AUTH - BASIC)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}delta${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Toggle to include delta values in report.${YELLOW} Specify as: delta=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}filter${OFF} ${BLUE}[map]${OFF} ${CYAN}(default: null)${OFF} - The filter to apply to the report as a URL encoded dictionary.${YELLOW} Specify as: filter=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}group_by${OFF} ${BLUE}[map]${OFF} ${CYAN}(default: null)${OFF} - The grouping to apply to the report as a URL encoded dictionary.${YELLOW} Specify as: group_by=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}order_by${OFF} ${BLUE}[map]${OFF} ${CYAN}(default: null)${OFF} - The ordering to apply to the report as a URL encoded dictionary.${YELLOW} Specify as: order_by=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}offset${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: 0)${OFF} - Parameter for selecting the offset of data.${YELLOW} Specify as: offset=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}limit${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: 100)${OFF} - Parameter for selecting the amount of data in a returned.${YELLOW} Specify as: limit=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;A paginated report object${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Unauthorized${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=500
    echo -e "${result_color_table[${code:0:1}]}  500;Unexpected Error${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for getAWSInstanceReports operation
#
##############################################################################
print_getAWSInstanceReports_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getAWSInstanceReports - Query to obtain AWS instance type data${OFF}${BLUE}(AUTH - BASIC)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}filter${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - The filter to apply to the report as a URL encoded dictionary.${YELLOW} Specify as: filter=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}group_by${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - The grouping to apply to the report as a URL encoded dictionary.${YELLOW} Specify as: group_by=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}order_by${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - The ordering to apply to the report as a URL encoded dictionary.${YELLOW} Specify as: order_by=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}units${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - The units used to report data.${YELLOW} Specify as: units=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}offset${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: 0)${OFF} - Parameter for selecting the offset of data.${YELLOW} Specify as: offset=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}limit${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: 100)${OFF} - Parameter for selecting the amount of data in a returned.${YELLOW} Specify as: limit=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;A paginated report object${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Unauthorized${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=500
    echo -e "${result_color_table[${code:0:1}]}  500;Unexpected Error${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for getAWSStorageReports operation
#
##############################################################################
print_getAWSStorageReports_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getAWSStorageReports - Query to obtain AWS storage data${OFF}${BLUE}(AUTH - BASIC)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}filter${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - The filter to apply to the report as a URL encoded dictionary.${YELLOW} Specify as: filter=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}group_by${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - The grouping to apply to the report as a URL encoded dictionary.${YELLOW} Specify as: group_by=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}order_by${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - The ordering to apply to the report as a URL encoded dictionary.${YELLOW} Specify as: order_by=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}units${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - The units used to report data.${YELLOW} Specify as: units=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}offset${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: 0)${OFF} - Parameter for selecting the offset of data.${YELLOW} Specify as: offset=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}limit${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: 100)${OFF} - Parameter for selecting the amount of data in a returned.${YELLOW} Specify as: limit=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;A paginated report object${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Unauthorized${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=500
    echo -e "${result_color_table[${code:0:1}]}  500;Unexpected Error${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for createCostModel operation
#
##############################################################################
print_createCostModel_help() {
    echo ""
    echo -e "${BOLD}${WHITE}createCostModel - Create a new cost model.${OFF}${BLUE}(AUTH - BASIC)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF} ${RED}(required)${OFF}${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=201
    echo -e "${result_color_table[${code:0:1}]}  201;An object describing the cost model${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Unauthorized${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=500
    echo -e "${result_color_table[${code:0:1}]}  500;Unexpected Error${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for deleteCostModel operation
#
##############################################################################
print_deleteCostModel_help() {
    echo ""
    echo -e "${BOLD}${WHITE}deleteCostModel - Delete a Cost Model${OFF}${BLUE}(AUTH - BASIC)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}cost_model_uuid${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - UUID of Cost Model to get ${YELLOW}Specify as: cost_model_uuid=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=204
    echo -e "${result_color_table[${code:0:1}]}  204;Cost Model deleted${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Unauthorized${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=404
    echo -e "${result_color_table[${code:0:1}]}  404;Not Found${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=500
    echo -e "${result_color_table[${code:0:1}]}  500;Unexpected Error${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for getCostModel operation
#
##############################################################################
print_getCostModel_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getCostModel - Get a Cost Model.${OFF}${BLUE}(AUTH - BASIC)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}cost_model_uuid${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - UUID of Cost Model to get ${YELLOW}Specify as: cost_model_uuid=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;A Cost Model object${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Unauthorized${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=404
    echo -e "${result_color_table[${code:0:1}]}  404;Not Found${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=500
    echo -e "${result_color_table[${code:0:1}]}  500;Unexpected Error${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for listCostModels operation
#
##############################################################################
print_listCostModels_help() {
    echo ""
    echo -e "${BOLD}${WHITE}listCostModels - List the cost models${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}offset${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: 0)${OFF} - Parameter for selecting the offset of data.${YELLOW} Specify as: offset=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}limit${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: 10)${OFF} - Parameter for selecting the amount of data in a returned.${YELLOW} Specify as: limit=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}provider_uuid${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Filter response on provider uuid.${YELLOW} Specify as: provider_uuid=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}source_type${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Filter response on provider source type.${YELLOW} Specify as: source_type=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}name${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Filter response on cost model name.${YELLOW} Specify as: name=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;A paginated list of cost model objects${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Unauthorized${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=500
    echo -e "${result_color_table[${code:0:1}]}  500;Unexpected Error${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for updateCostModel operation
#
##############################################################################
print_updateCostModel_help() {
    echo ""
    echo -e "${BOLD}${WHITE}updateCostModel - Update a Cost Model${OFF}${BLUE}(AUTH - BASIC)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}cost_model_uuid${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - UUID of Cost Model to get ${YELLOW}Specify as: cost_model_uuid=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF} ${RED}(required)${OFF}${OFF} - Update to a Cost Model" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;A Cost Model object${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Unauthorized${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=404
    echo -e "${result_color_table[${code:0:1}]}  404;Not Found${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=500
    echo -e "${result_color_table[${code:0:1}]}  500;Unexpected Error${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for getOpenShiftAWSCostReports operation
#
##############################################################################
print_getOpenShiftAWSCostReports_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getOpenShiftAWSCostReports - Query to obtain OpenShift on AWS cost reports${OFF}${BLUE}(AUTH - BASIC)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}delta${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Toggle to include delta values in report.${YELLOW} Specify as: delta=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}filter${OFF} ${BLUE}[map]${OFF} ${CYAN}(default: null)${OFF} - The filter to apply to the report as a URL encoded dictionary.${YELLOW} Specify as: filter=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}group_by${OFF} ${BLUE}[map]${OFF} ${CYAN}(default: null)${OFF} - The grouping to apply to the report as a URL encoded dictionary.${YELLOW} Specify as: group_by=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}order_by${OFF} ${BLUE}[map]${OFF} ${CYAN}(default: null)${OFF} - The ordering to apply to the report as a URL encoded dictionary.${YELLOW} Specify as: order_by=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}offset${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: 0)${OFF} - Parameter for selecting the offset of data.${YELLOW} Specify as: offset=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}limit${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: 100)${OFF} - Parameter for selecting the amount of data in a returned.${YELLOW} Specify as: limit=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;A paginated report object${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Unauthorized${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=500
    echo -e "${result_color_table[${code:0:1}]}  500;Unexpected Error${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for getOpenShiftAWSInventoryInstanceReport operation
#
##############################################################################
print_getOpenShiftAWSInventoryInstanceReport_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getOpenShiftAWSInventoryInstanceReport - Query to obtain OpenShift on AWS instance data${OFF}${BLUE}(AUTH - BASIC)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}filter${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - The filter to apply to the report as a URL encoded dictionary.${YELLOW} Specify as: filter=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}group_by${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - The grouping to apply to the report as a URL encoded dictionary.${YELLOW} Specify as: group_by=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}order_by${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - The ordering to apply to the report as a URL encoded dictionary.${YELLOW} Specify as: order_by=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}units${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - The units used to report data.${YELLOW} Specify as: units=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}offset${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: 0)${OFF} - Parameter for selecting the offset of data.${YELLOW} Specify as: offset=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}limit${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: 100)${OFF} - Parameter for selecting the amount of data in a returned.${YELLOW} Specify as: limit=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;A paginated report object${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Unauthorized${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=500
    echo -e "${result_color_table[${code:0:1}]}  500;Unexpected Error${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for getOpenShiftAWSInventoryStorageReport operation
#
##############################################################################
print_getOpenShiftAWSInventoryStorageReport_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getOpenShiftAWSInventoryStorageReport - Query to obtain OpenShift on AWS storage data${OFF}${BLUE}(AUTH - BASIC)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}filter${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - The filter to apply to the report as a URL encoded dictionary.${YELLOW} Specify as: filter=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}group_by${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - The grouping to apply to the report as a URL encoded dictionary.${YELLOW} Specify as: group_by=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}order_by${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - The ordering to apply to the report as a URL encoded dictionary.${YELLOW} Specify as: order_by=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}units${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - The units used to report data.${YELLOW} Specify as: units=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}offset${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: 0)${OFF} - Parameter for selecting the offset of data.${YELLOW} Specify as: offset=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}limit${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: 100)${OFF} - Parameter for selecting the amount of data in a returned.${YELLOW} Specify as: limit=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;A paginated report object${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Unauthorized${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=500
    echo -e "${result_color_table[${code:0:1}]}  500;Unexpected Error${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for getOpenShiftComputeReports operation
#
##############################################################################
print_getOpenShiftComputeReports_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getOpenShiftComputeReports - Query to obtain OpenShift compute usage information${OFF}${BLUE}(AUTH - BASIC)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}filter${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - The filter to apply to the report as a URL encoded dictionary.${YELLOW} Specify as: filter=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}group_by${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - The grouping to apply to the report as a URL encoded dictionary.${YELLOW} Specify as: group_by=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}order_by${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - The ordering to apply to the report as a URL encoded dictionary.${YELLOW} Specify as: order_by=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}offset${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: 0)${OFF} - Parameter for selecting the offset of data.${YELLOW} Specify as: offset=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}limit${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: 100)${OFF} - Parameter for selecting the amount of data in a returned.${YELLOW} Specify as: limit=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;A paginated report object${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Unauthorized${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=500
    echo -e "${result_color_table[${code:0:1}]}  500;Unexpected Error${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for getOpenShiftCostReports operation
#
##############################################################################
print_getOpenShiftCostReports_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getOpenShiftCostReports - Query to obtain cost reports${OFF}${BLUE}(AUTH - BASIC)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}delta${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - Toggle to include delta values in report.${YELLOW} Specify as: delta=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}filter${OFF} ${BLUE}[map]${OFF} ${CYAN}(default: null)${OFF} - The filter to apply to the report as a URL encoded dictionary.${YELLOW} Specify as: filter=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}group_by${OFF} ${BLUE}[map]${OFF} ${CYAN}(default: null)${OFF} - The grouping to apply to the report as a URL encoded dictionary.${YELLOW} Specify as: group_by=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}order_by${OFF} ${BLUE}[map]${OFF} ${CYAN}(default: null)${OFF} - The ordering to apply to the report as a URL encoded dictionary.${YELLOW} Specify as: order_by=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}offset${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: 0)${OFF} - Parameter for selecting the offset of data.${YELLOW} Specify as: offset=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}limit${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: 100)${OFF} - Parameter for selecting the amount of data in a returned.${YELLOW} Specify as: limit=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;A paginated report object${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Unauthorized${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=500
    echo -e "${result_color_table[${code:0:1}]}  500;Unexpected Error${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for getOpenShiftMemoryReports operation
#
##############################################################################
print_getOpenShiftMemoryReports_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getOpenShiftMemoryReports - Query to obtain OpenShift memory usage information${OFF}${BLUE}(AUTH - BASIC)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}filter${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - The filter to apply to the report as a URL encoded dictionary.${YELLOW} Specify as: filter=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}group_by${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - The grouping to apply to the report as a URL encoded dictionary.${YELLOW} Specify as: group_by=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}order_by${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - The ordering to apply to the report as a URL encoded dictionary.${YELLOW} Specify as: order_by=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}offset${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: 0)${OFF} - Parameter for selecting the offset of data.${YELLOW} Specify as: offset=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}limit${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: 100)${OFF} - Parameter for selecting the amount of data in a returned.${YELLOW} Specify as: limit=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;A paginated report object${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Unauthorized${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=500
    echo -e "${result_color_table[${code:0:1}]}  500;Unexpected Error${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for getOpenShiftVolumeReports operation
#
##############################################################################
print_getOpenShiftVolumeReports_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getOpenShiftVolumeReports - Query to obtain OpenShift volume usage information${OFF}${BLUE}(AUTH - BASIC)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}filter${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - The filter to apply to the report as a URL encoded dictionary.${YELLOW} Specify as: filter=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}group_by${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - The grouping to apply to the report as a URL encoded dictionary.${YELLOW} Specify as: group_by=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}order_by${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - The ordering to apply to the report as a URL encoded dictionary.${YELLOW} Specify as: order_by=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}offset${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: 0)${OFF} - Parameter for selecting the offset of data.${YELLOW} Specify as: offset=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}limit${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: 100)${OFF} - Parameter for selecting the amount of data in a returned.${YELLOW} Specify as: limit=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;A paginated report object${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Unauthorized${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=500
    echo -e "${result_color_table[${code:0:1}]}  500;Unexpected Error${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for createProvider operation
#
##############################################################################
print_createProvider_help() {
    echo ""
    echo -e "${BOLD}${WHITE}createProvider - Create a provider${OFF}${BLUE}(AUTH - BASIC)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF} ${RED}(required)${OFF}${OFF} - Provider to add to a Customer" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=201
    echo -e "${result_color_table[${code:0:1}]}  201;An object describing the provider${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Unauthorized${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=500
    echo -e "${result_color_table[${code:0:1}]}  500;Unexpected Error${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for deleteProvider operation
#
##############################################################################
print_deleteProvider_help() {
    echo ""
    echo -e "${BOLD}${WHITE}deleteProvider - Delete a provider${OFF}${BLUE}(AUTH - BASIC)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}uuid${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - ID of provider to delete ${YELLOW}Specify as: uuid=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=204
    echo -e "${result_color_table[${code:0:1}]}  204;Provider deleted${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Unauthorized${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=403
    echo -e "${result_color_table[${code:0:1}]}  403;Insufficent permissions to delete provider${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=404
    echo -e "${result_color_table[${code:0:1}]}  404;Not Found${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=500
    echo -e "${result_color_table[${code:0:1}]}  500;Unexpected Error${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for getProvider operation
#
##############################################################################
print_getProvider_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getProvider - Get a provider${OFF}${BLUE}(AUTH - BASIC)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}uuid${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - ID of provider to get ${YELLOW}Specify as: uuid=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;A Provider object${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Unauthorized${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=404
    echo -e "${result_color_table[${code:0:1}]}  404;Not Found${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=500
    echo -e "${result_color_table[${code:0:1}]}  500;Unexpected Error${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for listProviders operation
#
##############################################################################
print_listProviders_help() {
    echo ""
    echo -e "${BOLD}${WHITE}listProviders - List the providers${OFF}${BLUE}(AUTH - BASIC)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}type${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - The type of provider to filter for.${YELLOW} Specify as: type=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}name${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - The name of the provider to filter for.${YELLOW} Specify as: name=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}offset${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: 0)${OFF} - Parameter for selecting the offset of data.${YELLOW} Specify as: offset=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}limit${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: 10)${OFF} - Parameter for selecting the amount of data in a returned.${YELLOW} Specify as: limit=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;A paginated list of provider objects${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Unauthorized${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=500
    echo -e "${result_color_table[${code:0:1}]}  500;Unexpected Error${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for getStatus operation
#
##############################################################################
print_getStatus_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getStatus - Obtain server status${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;An object describing the server status${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=500
    echo -e "${result_color_table[${code:0:1}]}  500;Unexpected Error${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for getAWSTagData operation
#
##############################################################################
print_getAWSTagData_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getAWSTagData - Query to obtain AWS tags${OFF}${BLUE}(AUTH - BASIC)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}filter${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - The filter to apply to the query as a URL encoded dictionary.${YELLOW} Specify as: filter=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}key_only${OFF} ${BLUE}[boolean]${OFF} ${CYAN}(default: null)${OFF} - Flag to indicate whether or not only the tag key values will be returned.${YELLOW} Specify as: key_only=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}offset${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: 0)${OFF} - Parameter for selecting the offset of data.${YELLOW} Specify as: offset=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}limit${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: 100)${OFF} - Parameter for selecting the amount of data in a returned.${YELLOW} Specify as: limit=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;A paginated report object${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Unauthorized${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=500
    echo -e "${result_color_table[${code:0:1}]}  500;Unexpected Error${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for getOpenShiftAWSTagData operation
#
##############################################################################
print_getOpenShiftAWSTagData_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getOpenShiftAWSTagData - Query to obtain OpenShift-on-AWS tags${OFF}${BLUE}(AUTH - BASIC)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}filter${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - The filter to apply to the query as a URL encoded dictionary.${YELLOW} Specify as: filter=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}key_only${OFF} ${BLUE}[boolean]${OFF} ${CYAN}(default: null)${OFF} - Flag to indicate whether or not only the tag key values will be returned.${YELLOW} Specify as: key_only=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}offset${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: 0)${OFF} - Parameter for selecting the offset of data.${YELLOW} Specify as: offset=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}limit${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: 100)${OFF} - Parameter for selecting the amount of data in a returned.${YELLOW} Specify as: limit=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;A paginated report object${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Unauthorized${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=500
    echo -e "${result_color_table[${code:0:1}]}  500;Unexpected Error${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for getOpenShiftTagData operation
#
##############################################################################
print_getOpenShiftTagData_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getOpenShiftTagData - Query to obtain OpenShift tags${OFF}${BLUE}(AUTH - BASIC)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}filter${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - The filter to apply to the query as a URL encoded dictionary.${YELLOW} Specify as: filter=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}key_only${OFF} ${BLUE}[boolean]${OFF} ${CYAN}(default: null)${OFF} - Flag to indicate whether or not only the tag key values will be returned.${YELLOW} Specify as: key_only=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}offset${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: 0)${OFF} - Parameter for selecting the offset of data.${YELLOW} Specify as: offset=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}limit${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: 100)${OFF} - Parameter for selecting the amount of data in a returned.${YELLOW} Specify as: limit=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;A paginated report object${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Unauthorized${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=500
    echo -e "${result_color_table[${code:0:1}]}  500;Unexpected Error${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for createUserPreference operation
#
##############################################################################
print_createUserPreference_help() {
    echo ""
    echo -e "${BOLD}${WHITE}createUserPreference - Create a user preference${OFF}${BLUE}(AUTH - BASIC)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF} ${RED}(required)${OFF}${OFF} - Preference to add to a Preference" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=201
    echo -e "${result_color_table[${code:0:1}]}  201;An object describing the user${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Unauthorized${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=500
    echo -e "${result_color_table[${code:0:1}]}  500;Unexpected Error${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for deleteUserPreference operation
#
##############################################################################
print_deleteUserPreference_help() {
    echo ""
    echo -e "${BOLD}${WHITE}deleteUserPreference - Delete a user preference${OFF}${BLUE}(AUTH - BASIC)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}pref_uuid${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - ID of preference to get ${YELLOW}Specify as: pref_uuid=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=204
    echo -e "${result_color_table[${code:0:1}]}  204;User deleted${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Unauthorized${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=404
    echo -e "${result_color_table[${code:0:1}]}  404;Not Found${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=500
    echo -e "${result_color_table[${code:0:1}]}  500;Unexpected Error${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for getUserPreference operation
#
##############################################################################
print_getUserPreference_help() {
    echo ""
    echo -e "${BOLD}${WHITE}getUserPreference - Get a user preference${OFF}${BLUE}(AUTH - BASIC)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}pref_uuid${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - ID of preference to get ${YELLOW}Specify as: pref_uuid=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;A UserPreference object${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Unauthorized${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=404
    echo -e "${result_color_table[${code:0:1}]}  404;Not Found${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=500
    echo -e "${result_color_table[${code:0:1}]}  500;Unexpected Error${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for listUserPreferences operation
#
##############################################################################
print_listUserPreferences_help() {
    echo ""
    echo -e "${BOLD}${WHITE}listUserPreferences - List the user's preferences${OFF}${BLUE}(AUTH - BASIC)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}offset${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: 0)${OFF} - Parameter for selecting the offset of data.${YELLOW} Specify as: offset=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}limit${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: 10)${OFF} - Parameter for selecting the amount of data in a returned.${YELLOW} Specify as: limit=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;A paginated list of preference objects${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Unauthorized${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=500
    echo -e "${result_color_table[${code:0:1}]}  500;Unexpected Error${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for updateUserPreference operation
#
##############################################################################
print_updateUserPreference_help() {
    echo ""
    echo -e "${BOLD}${WHITE}updateUserPreference - Update a user preference${OFF}${BLUE}(AUTH - BASIC)${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}pref_uuid${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - ID of preference to get ${YELLOW}Specify as: pref_uuid=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF} ${RED}(required)${OFF}${OFF} - Update to a Preference" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Preference updated${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=401
    echo -e "${result_color_table[${code:0:1}]}  401;Unauthorized${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=404
    echo -e "${result_color_table[${code:0:1}]}  404;Not Found${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
    code=500
    echo -e "${result_color_table[${code:0:1}]}  500;Unexpected Error${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}


##############################################################################
#
# Call getAWSCostReports operation
#
##############################################################################
call_getAWSCostReports() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(delta filter group_by order_by offset limit  )
    local path

    if ! path=$(build_request_path "/api/cost-management/v1/reports/aws/costs/" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call getAWSInstanceReports operation
#
##############################################################################
call_getAWSInstanceReports() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(filter group_by order_by units offset limit  )
    local path

    if ! path=$(build_request_path "/api/cost-management/v1/reports/aws/instance-types/" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call getAWSStorageReports operation
#
##############################################################################
call_getAWSStorageReports() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(filter group_by order_by units offset limit  )
    local path

    if ! path=$(build_request_path "/api/cost-management/v1/reports/aws/storage/" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call createCostModel operation
#
##############################################################################
call_createCostModel() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/cost-management/v1/costmodels/" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the OpenAPI specification
    # if values produces and consumes are defined unambigously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call deleteCostModel operation
#
##############################################################################
call_deleteCostModel() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(cost_model_uuid)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/cost-management/v1/costmodels/{cost_model_uuid}/" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="DELETE"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call getCostModel operation
#
##############################################################################
call_getCostModel() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(cost_model_uuid)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/cost-management/v1/costmodels/{cost_model_uuid}/" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call listCostModels operation
#
##############################################################################
call_listCostModels() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(offset limit provider_uuid source_type name)
    local path

    if ! path=$(build_request_path "/api/cost-management/v1/costmodels/" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call updateCostModel operation
#
##############################################################################
call_updateCostModel() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(cost_model_uuid)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/cost-management/v1/costmodels/{cost_model_uuid}/" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="PUT"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the OpenAPI specification
    # if values produces and consumes are defined unambigously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call getOpenShiftAWSCostReports operation
#
##############################################################################
call_getOpenShiftAWSCostReports() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(delta filter group_by order_by offset limit  )
    local path

    if ! path=$(build_request_path "/api/cost-management/v1/reports/openshift/infrastructures/aws/costs/" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call getOpenShiftAWSInventoryInstanceReport operation
#
##############################################################################
call_getOpenShiftAWSInventoryInstanceReport() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(filter group_by order_by units offset limit  )
    local path

    if ! path=$(build_request_path "/api/cost-management/v1/reports/openshift/infrastructures/aws/instance-types/" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call getOpenShiftAWSInventoryStorageReport operation
#
##############################################################################
call_getOpenShiftAWSInventoryStorageReport() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(filter group_by order_by units offset limit  )
    local path

    if ! path=$(build_request_path "/api/cost-management/v1/reports/openshift/infrastructures/aws/storage/" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call getOpenShiftComputeReports operation
#
##############################################################################
call_getOpenShiftComputeReports() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(filter group_by order_by offset limit  )
    local path

    if ! path=$(build_request_path "/api/cost-management/v1/reports/openshift/compute/" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call getOpenShiftCostReports operation
#
##############################################################################
call_getOpenShiftCostReports() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(delta filter group_by order_by offset limit  )
    local path

    if ! path=$(build_request_path "/api/cost-management/v1/reports/openshift/costs/" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call getOpenShiftMemoryReports operation
#
##############################################################################
call_getOpenShiftMemoryReports() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(filter group_by order_by offset limit  )
    local path

    if ! path=$(build_request_path "/api/cost-management/v1/reports/openshift/memory/" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call getOpenShiftVolumeReports operation
#
##############################################################################
call_getOpenShiftVolumeReports() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(filter group_by order_by offset limit  )
    local path

    if ! path=$(build_request_path "/api/cost-management/v1/reports/openshift/volumes/" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call createProvider operation
#
##############################################################################
call_createProvider() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/cost-management/v1/providers/" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the OpenAPI specification
    # if values produces and consumes are defined unambigously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call deleteProvider operation
#
##############################################################################
call_deleteProvider() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(uuid)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/cost-management/v1/providers/" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="DELETE"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call getProvider operation
#
##############################################################################
call_getProvider() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(uuid)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/cost-management/v1/providers/{uuid}/" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call listProviders operation
#
##############################################################################
call_listProviders() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(type name offset limit  )
    local path

    if ! path=$(build_request_path "/api/cost-management/v1/providers/" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call getStatus operation
#
##############################################################################
call_getStatus() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=()
    local path

    if ! path=$(build_request_path "/api/cost-management/v1/status/" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call getAWSTagData operation
#
##############################################################################
call_getAWSTagData() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(filter key_only offset limit  )
    local path

    if ! path=$(build_request_path "/api/cost-management/v1/tags/aws/" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call getOpenShiftAWSTagData operation
#
##############################################################################
call_getOpenShiftAWSTagData() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(filter key_only offset limit  )
    local path

    if ! path=$(build_request_path "/api/cost-management/v1/tags/openshift/infrastructures/aws/" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call getOpenShiftTagData operation
#
##############################################################################
call_getOpenShiftTagData() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(filter key_only offset limit  )
    local path

    if ! path=$(build_request_path "/api/cost-management/v1/tags/openshift/" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call createUserPreference operation
#
##############################################################################
call_createUserPreference() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/cost-management/v1/preferences/" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="POST"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the OpenAPI specification
    # if values produces and consumes are defined unambigously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call deleteUserPreference operation
#
##############################################################################
call_deleteUserPreference() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(pref_uuid)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/cost-management/v1/preferences/{pref_uuid}/" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="DELETE"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call getUserPreference operation
#
##############################################################################
call_getUserPreference() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(pref_uuid)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/cost-management/v1/preferences/{pref_uuid}/" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call listUserPreferences operation
#
##############################################################################
call_listUserPreferences() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(offset limit  )
    local path

    if ! path=$(build_request_path "/api/cost-management/v1/preferences/" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="GET"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call updateUserPreference operation
#
##############################################################################
call_updateUserPreference() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(pref_uuid)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(  )
    local path

    if ! path=$(build_request_path "/api/cost-management/v1/preferences/{pref_uuid}/" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="PUT"
    local headers_curl
    headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the OpenAPI specification
    # if values produces and consumes are defined unambigously
    #
    if [[ -z $header_content_type ]]; then
        header_content_type="application/json"
    fi


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
        echo "ERROR: Request's content-type not specified!!!"
        echo "This operation expects content-type in one of the following formats:"
        echo -e "\\t- application/json"
        echo ""
        echo "Use '--content-type' to set proper content type"
        exit 1
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}



##############################################################################
#
# Main
#
##############################################################################


# Check dependencies
type curl >/dev/null 2>&1 || { echo >&2 "ERROR: You do not have 'cURL' installed."; exit 1; }
type sed >/dev/null 2>&1 || { echo >&2 "ERROR: You do not have 'sed' installed."; exit 1; }
type column >/dev/null 2>&1 || { echo >&2 "ERROR: You do not have 'bsdmainutils' installed."; exit 1; }

#
# Process command line
#
# Pass all arguments before 'operation' to cURL except the ones we override
#
take_user=false
take_host=false
take_accept_header=false
take_contenttype_header=false

for key in "$@"; do
# Take the value of -u|--user argument
if [[ "$take_user" = true ]]; then
    basic_auth_credential="$key"
    take_user=false
    continue
fi
# Take the value of --host argument
if [[ "$take_host" = true ]]; then
    host="$key"
    take_host=false
    continue
fi
# Take the value of --accept argument
if [[ "$take_accept_header" = true ]]; then
    header_accept=$(lookup_mime_type "$key")
    take_accept_header=false
    continue
fi
# Take the value of --content-type argument
if [[ "$take_contenttype_header" = true ]]; then
    header_content_type=$(lookup_mime_type "$key")
    take_contenttype_header=false
    continue
fi
case $key in
    -h|--help)
    if [[ "x$operation" == "x" ]]; then
        print_help
        exit 0
    else
        eval "print_${operation}_help"
        exit 0
    fi
    ;;
    -V|--version)
    print_version
    exit 0
    ;;
    --about)
    print_about
    exit 0
    ;;
    -u|--user)
    take_user=true
    ;;
    --host)
    take_host=true
    ;;
    --force)
    force=true
    ;;
    -ac|--accept)
    take_accept_header=true
    ;;
    -ct|--content-type)
    take_contenttype_header=true
    ;;
    --dry-run)
    print_curl=true
    ;;
    -nc|--no-colors)
        RED=""
        GREEN=""
        YELLOW=""
        BLUE=""
        MAGENTA=""
        CYAN=""
        WHITE=""
        BOLD=""
        OFF=""
        result_color_table=( "" "" "" "" "" "" "" )
    ;;
    getAWSCostReports)
    operation="getAWSCostReports"
    ;;
    getAWSInstanceReports)
    operation="getAWSInstanceReports"
    ;;
    getAWSStorageReports)
    operation="getAWSStorageReports"
    ;;
    createCostModel)
    operation="createCostModel"
    ;;
    deleteCostModel)
    operation="deleteCostModel"
    ;;
    getCostModel)
    operation="getCostModel"
    ;;
    listCostModels)
    operation="listCostModels"
    ;;
    updateCostModel)
    operation="updateCostModel"
    ;;
    getOpenShiftAWSCostReports)
    operation="getOpenShiftAWSCostReports"
    ;;
    getOpenShiftAWSInventoryInstanceReport)
    operation="getOpenShiftAWSInventoryInstanceReport"
    ;;
    getOpenShiftAWSInventoryStorageReport)
    operation="getOpenShiftAWSInventoryStorageReport"
    ;;
    getOpenShiftComputeReports)
    operation="getOpenShiftComputeReports"
    ;;
    getOpenShiftCostReports)
    operation="getOpenShiftCostReports"
    ;;
    getOpenShiftMemoryReports)
    operation="getOpenShiftMemoryReports"
    ;;
    getOpenShiftVolumeReports)
    operation="getOpenShiftVolumeReports"
    ;;
    createProvider)
    operation="createProvider"
    ;;
    deleteProvider)
    operation="deleteProvider"
    ;;
    getProvider)
    operation="getProvider"
    ;;
    listProviders)
    operation="listProviders"
    ;;
    getStatus)
    operation="getStatus"
    ;;
    getAWSTagData)
    operation="getAWSTagData"
    ;;
    getOpenShiftAWSTagData)
    operation="getOpenShiftAWSTagData"
    ;;
    getOpenShiftTagData)
    operation="getOpenShiftTagData"
    ;;
    createUserPreference)
    operation="createUserPreference"
    ;;
    deleteUserPreference)
    operation="deleteUserPreference"
    ;;
    getUserPreference)
    operation="getUserPreference"
    ;;
    listUserPreferences)
    operation="listUserPreferences"
    ;;
    updateUserPreference)
    operation="updateUserPreference"
    ;;
    *==*)
    # Parse body arguments and convert them into top level
    # JSON properties passed in the body content as strings
    if [[ "$operation" ]]; then
        IFS='==' read -r body_key sep body_value <<< "$key"
        body_parameters[${body_key}]="\"${body_value}\""
    fi
    ;;
    *:=*)
    # Parse body arguments and convert them into top level
    # JSON properties passed in the body content without qoutes
    if [[ "$operation" ]]; then
        # ignore error about 'sep' being unused
        # shellcheck disable=SC2034
        IFS=':=' read -r body_key sep body_value <<< "$key"
        body_parameters[${body_key}]=${body_value}
    fi
    ;;
    +\([^=]\):*)
    # Parse header arguments and convert them into curl
    # only after the operation argument
    if [[ "$operation" ]]; then
        IFS=':' read -r header_name header_value <<< "$key"
        header_arguments[$header_name]=$header_value
    else
        curl_arguments+=" $key"
    fi
    ;;
    -)
    body_content_temp_file=$(mktemp)
    cat - > "$body_content_temp_file"
    ;;
    *=*)
    # Parse operation arguments and convert them into curl
    # only after the operation argument
    if [[ "$operation" ]]; then
        IFS='=' read -r parameter_name parameter_value <<< "$key"
        if [[ -z "${operation_parameters[$parameter_name]+foo}" ]]; then
            operation_parameters[$parameter_name]=$(url_escape "${parameter_value}")
        else
            operation_parameters[$parameter_name]+=":::"$(url_escape "${parameter_value}")
        fi
    else
        curl_arguments+=" $key"
    fi
    ;;
    *)
    # If we are before the operation, treat the arguments as cURL arguments
    if [[ "x$operation" == "x" ]]; then
        # Maintain quotes around cURL arguments if necessary
        space_regexp="[[:space:]]"
        if [[ $key =~ $space_regexp ]]; then
            curl_arguments+=" \"$key\""
        else
            curl_arguments+=" $key"
        fi
    fi
    ;;
esac
done


# Check if user provided host name
if [[ -z "$host" ]]; then
    ERROR_MSG="ERROR: No hostname provided!!! You have to  provide on command line option '--host ...'"
    exit 1
fi

# Check if user specified operation ID
if [[ -z "$operation" ]]; then
    ERROR_MSG="ERROR: No operation specified!!!"
    exit 1
fi


# Run cURL command based on the operation ID
case $operation in
    getAWSCostReports)
    call_getAWSCostReports
    ;;
    getAWSInstanceReports)
    call_getAWSInstanceReports
    ;;
    getAWSStorageReports)
    call_getAWSStorageReports
    ;;
    createCostModel)
    call_createCostModel
    ;;
    deleteCostModel)
    call_deleteCostModel
    ;;
    getCostModel)
    call_getCostModel
    ;;
    listCostModels)
    call_listCostModels
    ;;
    updateCostModel)
    call_updateCostModel
    ;;
    getOpenShiftAWSCostReports)
    call_getOpenShiftAWSCostReports
    ;;
    getOpenShiftAWSInventoryInstanceReport)
    call_getOpenShiftAWSInventoryInstanceReport
    ;;
    getOpenShiftAWSInventoryStorageReport)
    call_getOpenShiftAWSInventoryStorageReport
    ;;
    getOpenShiftComputeReports)
    call_getOpenShiftComputeReports
    ;;
    getOpenShiftCostReports)
    call_getOpenShiftCostReports
    ;;
    getOpenShiftMemoryReports)
    call_getOpenShiftMemoryReports
    ;;
    getOpenShiftVolumeReports)
    call_getOpenShiftVolumeReports
    ;;
    createProvider)
    call_createProvider
    ;;
    deleteProvider)
    call_deleteProvider
    ;;
    getProvider)
    call_getProvider
    ;;
    listProviders)
    call_listProviders
    ;;
    getStatus)
    call_getStatus
    ;;
    getAWSTagData)
    call_getAWSTagData
    ;;
    getOpenShiftAWSTagData)
    call_getOpenShiftAWSTagData
    ;;
    getOpenShiftTagData)
    call_getOpenShiftTagData
    ;;
    createUserPreference)
    call_createUserPreference
    ;;
    deleteUserPreference)
    call_deleteUserPreference
    ;;
    getUserPreference)
    call_getUserPreference
    ;;
    listUserPreferences)
    call_listUserPreferences
    ;;
    updateUserPreference)
    call_updateUserPreference
    ;;
    *)
    ERROR_MSG="ERROR: Unknown operation: $operation"
    exit 1
esac
