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
operation_parameters_minimum_occurrences["createCostModel:::UNKNOWN_BASE_TYPE"]=0
operation_parameters_minimum_occurrences["createProvider:::UNKNOWN_BASE_TYPE"]=0
operation_parameters_minimum_occurrences["createUserPreference:::UNKNOWN_BASE_TYPE"]=0
operation_parameters_minimum_occurrences["destroyCostModel:::uuid"]=1
operation_parameters_minimum_occurrences["destroyCostModel:::source_type"]=0
operation_parameters_minimum_occurrences["destroyCostModel:::name"]=0
operation_parameters_minimum_occurrences["destroyProvider:::uuid"]=1
operation_parameters_minimum_occurrences["destroyProvider:::type"]=0
operation_parameters_minimum_occurrences["destroyProvider:::name"]=0
operation_parameters_minimum_occurrences["destroyUserPreference:::uuid"]=1
operation_parameters_minimum_occurrences["listAWSCosts:::limit"]=0
operation_parameters_minimum_occurrences["listAWSCosts:::offset"]=0
operation_parameters_minimum_occurrences["listAWSCosts:::delta"]=0
operation_parameters_minimum_occurrences["listAWSCosts:::units"]=0
operation_parameters_minimum_occurrences["listAWSInstanceTypes:::limit"]=0
operation_parameters_minimum_occurrences["listAWSInstanceTypes:::offset"]=0
operation_parameters_minimum_occurrences["listAWSInstanceTypes:::delta"]=0
operation_parameters_minimum_occurrences["listAWSInstanceTypes:::units"]=0
operation_parameters_minimum_occurrences["listAWSStorages:::limit"]=0
operation_parameters_minimum_occurrences["listAWSStorages:::offset"]=0
operation_parameters_minimum_occurrences["listAWSStorages:::delta"]=0
operation_parameters_minimum_occurrences["listAWSStorages:::units"]=0
operation_parameters_minimum_occurrences["listAWSTags:::filter"]=0
operation_parameters_minimum_occurrences["listAWSTags:::key_only"]=0
operation_parameters_minimum_occurrences["listCostModelMetricsMaps:::limit"]=0
operation_parameters_minimum_occurrences["listCostModelMetricsMaps:::offset"]=0
operation_parameters_minimum_occurrences["listCostModels:::limit"]=0
operation_parameters_minimum_occurrences["listCostModels:::offset"]=0
operation_parameters_minimum_occurrences["listCostModels:::source_type"]=0
operation_parameters_minimum_occurrences["listCostModels:::name"]=0
operation_parameters_minimum_occurrences["listOCPAWSCosts:::limit"]=0
operation_parameters_minimum_occurrences["listOCPAWSCosts:::offset"]=0
operation_parameters_minimum_occurrences["listOCPAWSCosts:::delta"]=0
operation_parameters_minimum_occurrences["listOCPAWSCosts:::units"]=0
operation_parameters_minimum_occurrences["listOCPAWSInstanceTypes:::limit"]=0
operation_parameters_minimum_occurrences["listOCPAWSInstanceTypes:::offset"]=0
operation_parameters_minimum_occurrences["listOCPAWSInstanceTypes:::delta"]=0
operation_parameters_minimum_occurrences["listOCPAWSInstanceTypes:::units"]=0
operation_parameters_minimum_occurrences["listOCPAWSStorages:::limit"]=0
operation_parameters_minimum_occurrences["listOCPAWSStorages:::offset"]=0
operation_parameters_minimum_occurrences["listOCPAWSStorages:::delta"]=0
operation_parameters_minimum_occurrences["listOCPAWSStorages:::units"]=0
operation_parameters_minimum_occurrences["listOCPAWSTags:::filter"]=0
operation_parameters_minimum_occurrences["listOCPAWSTags:::key_only"]=0
operation_parameters_minimum_occurrences["listOCPCosts:::limit"]=0
operation_parameters_minimum_occurrences["listOCPCosts:::offset"]=0
operation_parameters_minimum_occurrences["listOCPCosts:::units"]=0
operation_parameters_minimum_occurrences["listOCPCosts:::delta"]=0
operation_parameters_minimum_occurrences["listOCPCpus:::limit"]=0
operation_parameters_minimum_occurrences["listOCPCpus:::offset"]=0
operation_parameters_minimum_occurrences["listOCPCpus:::units"]=0
operation_parameters_minimum_occurrences["listOCPCpus:::delta"]=0
operation_parameters_minimum_occurrences["listOCPMemorys:::limit"]=0
operation_parameters_minimum_occurrences["listOCPMemorys:::offset"]=0
operation_parameters_minimum_occurrences["listOCPMemorys:::units"]=0
operation_parameters_minimum_occurrences["listOCPMemorys:::delta"]=0
operation_parameters_minimum_occurrences["listOCPTags:::filter"]=0
operation_parameters_minimum_occurrences["listOCPTags:::key_only"]=0
operation_parameters_minimum_occurrences["listOCPVolumes:::limit"]=0
operation_parameters_minimum_occurrences["listOCPVolumes:::offset"]=0
operation_parameters_minimum_occurrences["listOCPVolumes:::units"]=0
operation_parameters_minimum_occurrences["listOCPVolumes:::delta"]=0
operation_parameters_minimum_occurrences["listProviders:::limit"]=0
operation_parameters_minimum_occurrences["listProviders:::offset"]=0
operation_parameters_minimum_occurrences["listProviders:::type"]=0
operation_parameters_minimum_occurrences["listProviders:::name"]=0
operation_parameters_minimum_occurrences["listUserPreferences:::limit"]=0
operation_parameters_minimum_occurrences["listUserPreferences:::offset"]=0
operation_parameters_minimum_occurrences["partialUpdateCostModel:::uuid"]=1
operation_parameters_minimum_occurrences["partialUpdateCostModel:::source_type"]=0
operation_parameters_minimum_occurrences["partialUpdateCostModel:::name"]=0
operation_parameters_minimum_occurrences["partialUpdateCostModel:::UNKNOWN_BASE_TYPE"]=0
operation_parameters_minimum_occurrences["partialUpdateUserPreference:::uuid"]=1
operation_parameters_minimum_occurrences["partialUpdateUserPreference:::UNKNOWN_BASE_TYPE"]=0
operation_parameters_minimum_occurrences["retrieveCostModel:::uuid"]=1
operation_parameters_minimum_occurrences["retrieveCostModel:::source_type"]=0
operation_parameters_minimum_occurrences["retrieveCostModel:::name"]=0
operation_parameters_minimum_occurrences["retrieveProvider:::uuid"]=1
operation_parameters_minimum_occurrences["retrieveProvider:::type"]=0
operation_parameters_minimum_occurrences["retrieveProvider:::name"]=0
operation_parameters_minimum_occurrences["retrieveUserPreference:::uuid"]=1
operation_parameters_minimum_occurrences["updateCostModel:::uuid"]=1
operation_parameters_minimum_occurrences["updateCostModel:::source_type"]=0
operation_parameters_minimum_occurrences["updateCostModel:::name"]=0
operation_parameters_minimum_occurrences["updateCostModel:::UNKNOWN_BASE_TYPE"]=0
operation_parameters_minimum_occurrences["updateUserPreference:::uuid"]=1
operation_parameters_minimum_occurrences["updateUserPreference:::UNKNOWN_BASE_TYPE"]=0

##
# This array stores the maximum number of allowed occurrences for parameter
# 1 - single value
# 2 - 2 values
# N - N values
# 0 - unlimited
declare -A operation_parameters_maximum_occurrences
operation_parameters_maximum_occurrences["createCostModel:::UNKNOWN_BASE_TYPE"]=0
operation_parameters_maximum_occurrences["createProvider:::UNKNOWN_BASE_TYPE"]=0
operation_parameters_maximum_occurrences["createUserPreference:::UNKNOWN_BASE_TYPE"]=0
operation_parameters_maximum_occurrences["destroyCostModel:::uuid"]=0
operation_parameters_maximum_occurrences["destroyCostModel:::source_type"]=0
operation_parameters_maximum_occurrences["destroyCostModel:::name"]=0
operation_parameters_maximum_occurrences["destroyProvider:::uuid"]=0
operation_parameters_maximum_occurrences["destroyProvider:::type"]=0
operation_parameters_maximum_occurrences["destroyProvider:::name"]=0
operation_parameters_maximum_occurrences["destroyUserPreference:::uuid"]=0
operation_parameters_maximum_occurrences["listAWSCosts:::limit"]=0
operation_parameters_maximum_occurrences["listAWSCosts:::offset"]=0
operation_parameters_maximum_occurrences["listAWSCosts:::delta"]=0
operation_parameters_maximum_occurrences["listAWSCosts:::units"]=0
operation_parameters_maximum_occurrences["listAWSInstanceTypes:::limit"]=0
operation_parameters_maximum_occurrences["listAWSInstanceTypes:::offset"]=0
operation_parameters_maximum_occurrences["listAWSInstanceTypes:::delta"]=0
operation_parameters_maximum_occurrences["listAWSInstanceTypes:::units"]=0
operation_parameters_maximum_occurrences["listAWSStorages:::limit"]=0
operation_parameters_maximum_occurrences["listAWSStorages:::offset"]=0
operation_parameters_maximum_occurrences["listAWSStorages:::delta"]=0
operation_parameters_maximum_occurrences["listAWSStorages:::units"]=0
operation_parameters_maximum_occurrences["listAWSTags:::filter"]=0
operation_parameters_maximum_occurrences["listAWSTags:::key_only"]=0
operation_parameters_maximum_occurrences["listCostModelMetricsMaps:::limit"]=0
operation_parameters_maximum_occurrences["listCostModelMetricsMaps:::offset"]=0
operation_parameters_maximum_occurrences["listCostModels:::limit"]=0
operation_parameters_maximum_occurrences["listCostModels:::offset"]=0
operation_parameters_maximum_occurrences["listCostModels:::source_type"]=0
operation_parameters_maximum_occurrences["listCostModels:::name"]=0
operation_parameters_maximum_occurrences["listOCPAWSCosts:::limit"]=0
operation_parameters_maximum_occurrences["listOCPAWSCosts:::offset"]=0
operation_parameters_maximum_occurrences["listOCPAWSCosts:::delta"]=0
operation_parameters_maximum_occurrences["listOCPAWSCosts:::units"]=0
operation_parameters_maximum_occurrences["listOCPAWSInstanceTypes:::limit"]=0
operation_parameters_maximum_occurrences["listOCPAWSInstanceTypes:::offset"]=0
operation_parameters_maximum_occurrences["listOCPAWSInstanceTypes:::delta"]=0
operation_parameters_maximum_occurrences["listOCPAWSInstanceTypes:::units"]=0
operation_parameters_maximum_occurrences["listOCPAWSStorages:::limit"]=0
operation_parameters_maximum_occurrences["listOCPAWSStorages:::offset"]=0
operation_parameters_maximum_occurrences["listOCPAWSStorages:::delta"]=0
operation_parameters_maximum_occurrences["listOCPAWSStorages:::units"]=0
operation_parameters_maximum_occurrences["listOCPAWSTags:::filter"]=0
operation_parameters_maximum_occurrences["listOCPAWSTags:::key_only"]=0
operation_parameters_maximum_occurrences["listOCPCosts:::limit"]=0
operation_parameters_maximum_occurrences["listOCPCosts:::offset"]=0
operation_parameters_maximum_occurrences["listOCPCosts:::units"]=0
operation_parameters_maximum_occurrences["listOCPCosts:::delta"]=0
operation_parameters_maximum_occurrences["listOCPCpus:::limit"]=0
operation_parameters_maximum_occurrences["listOCPCpus:::offset"]=0
operation_parameters_maximum_occurrences["listOCPCpus:::units"]=0
operation_parameters_maximum_occurrences["listOCPCpus:::delta"]=0
operation_parameters_maximum_occurrences["listOCPMemorys:::limit"]=0
operation_parameters_maximum_occurrences["listOCPMemorys:::offset"]=0
operation_parameters_maximum_occurrences["listOCPMemorys:::units"]=0
operation_parameters_maximum_occurrences["listOCPMemorys:::delta"]=0
operation_parameters_maximum_occurrences["listOCPTags:::filter"]=0
operation_parameters_maximum_occurrences["listOCPTags:::key_only"]=0
operation_parameters_maximum_occurrences["listOCPVolumes:::limit"]=0
operation_parameters_maximum_occurrences["listOCPVolumes:::offset"]=0
operation_parameters_maximum_occurrences["listOCPVolumes:::units"]=0
operation_parameters_maximum_occurrences["listOCPVolumes:::delta"]=0
operation_parameters_maximum_occurrences["listProviders:::limit"]=0
operation_parameters_maximum_occurrences["listProviders:::offset"]=0
operation_parameters_maximum_occurrences["listProviders:::type"]=0
operation_parameters_maximum_occurrences["listProviders:::name"]=0
operation_parameters_maximum_occurrences["listUserPreferences:::limit"]=0
operation_parameters_maximum_occurrences["listUserPreferences:::offset"]=0
operation_parameters_maximum_occurrences["partialUpdateCostModel:::uuid"]=0
operation_parameters_maximum_occurrences["partialUpdateCostModel:::source_type"]=0
operation_parameters_maximum_occurrences["partialUpdateCostModel:::name"]=0
operation_parameters_maximum_occurrences["partialUpdateCostModel:::UNKNOWN_BASE_TYPE"]=0
operation_parameters_maximum_occurrences["partialUpdateUserPreference:::uuid"]=0
operation_parameters_maximum_occurrences["partialUpdateUserPreference:::UNKNOWN_BASE_TYPE"]=0
operation_parameters_maximum_occurrences["retrieveCostModel:::uuid"]=0
operation_parameters_maximum_occurrences["retrieveCostModel:::source_type"]=0
operation_parameters_maximum_occurrences["retrieveCostModel:::name"]=0
operation_parameters_maximum_occurrences["retrieveProvider:::uuid"]=0
operation_parameters_maximum_occurrences["retrieveProvider:::type"]=0
operation_parameters_maximum_occurrences["retrieveProvider:::name"]=0
operation_parameters_maximum_occurrences["retrieveUserPreference:::uuid"]=0
operation_parameters_maximum_occurrences["updateCostModel:::uuid"]=0
operation_parameters_maximum_occurrences["updateCostModel:::source_type"]=0
operation_parameters_maximum_occurrences["updateCostModel:::name"]=0
operation_parameters_maximum_occurrences["updateCostModel:::UNKNOWN_BASE_TYPE"]=0
operation_parameters_maximum_occurrences["updateUserPreference:::uuid"]=0
operation_parameters_maximum_occurrences["updateUserPreference:::UNKNOWN_BASE_TYPE"]=0

##
# The type of collection for specifying multiple values for parameter:
# - multi, csv, ssv, tsv
declare -A operation_parameters_collection_type
operation_parameters_collection_type["createCostModel:::UNKNOWN_BASE_TYPE"]=""
operation_parameters_collection_type["createProvider:::UNKNOWN_BASE_TYPE"]=""
operation_parameters_collection_type["createUserPreference:::UNKNOWN_BASE_TYPE"]=""
operation_parameters_collection_type["destroyCostModel:::uuid"]=""
operation_parameters_collection_type["destroyCostModel:::source_type"]=""
operation_parameters_collection_type["destroyCostModel:::name"]=""
operation_parameters_collection_type["destroyProvider:::uuid"]=""
operation_parameters_collection_type["destroyProvider:::type"]=""
operation_parameters_collection_type["destroyProvider:::name"]=""
operation_parameters_collection_type["destroyUserPreference:::uuid"]=""
operation_parameters_collection_type["listAWSCosts:::limit"]=""
operation_parameters_collection_type["listAWSCosts:::offset"]=""
operation_parameters_collection_type["listAWSCosts:::delta"]=""
operation_parameters_collection_type["listAWSCosts:::units"]=""
operation_parameters_collection_type["listAWSInstanceTypes:::limit"]=""
operation_parameters_collection_type["listAWSInstanceTypes:::offset"]=""
operation_parameters_collection_type["listAWSInstanceTypes:::delta"]=""
operation_parameters_collection_type["listAWSInstanceTypes:::units"]=""
operation_parameters_collection_type["listAWSStorages:::limit"]=""
operation_parameters_collection_type["listAWSStorages:::offset"]=""
operation_parameters_collection_type["listAWSStorages:::delta"]=""
operation_parameters_collection_type["listAWSStorages:::units"]=""
operation_parameters_collection_type["listAWSTags:::filter"]=""
operation_parameters_collection_type["listAWSTags:::key_only"]=""
operation_parameters_collection_type["listCostModelMetricsMaps:::limit"]=""
operation_parameters_collection_type["listCostModelMetricsMaps:::offset"]=""
operation_parameters_collection_type["listCostModels:::limit"]=""
operation_parameters_collection_type["listCostModels:::offset"]=""
operation_parameters_collection_type["listCostModels:::source_type"]=""
operation_parameters_collection_type["listCostModels:::name"]=""
operation_parameters_collection_type["listOCPAWSCosts:::limit"]=""
operation_parameters_collection_type["listOCPAWSCosts:::offset"]=""
operation_parameters_collection_type["listOCPAWSCosts:::delta"]=""
operation_parameters_collection_type["listOCPAWSCosts:::units"]=""
operation_parameters_collection_type["listOCPAWSInstanceTypes:::limit"]=""
operation_parameters_collection_type["listOCPAWSInstanceTypes:::offset"]=""
operation_parameters_collection_type["listOCPAWSInstanceTypes:::delta"]=""
operation_parameters_collection_type["listOCPAWSInstanceTypes:::units"]=""
operation_parameters_collection_type["listOCPAWSStorages:::limit"]=""
operation_parameters_collection_type["listOCPAWSStorages:::offset"]=""
operation_parameters_collection_type["listOCPAWSStorages:::delta"]=""
operation_parameters_collection_type["listOCPAWSStorages:::units"]=""
operation_parameters_collection_type["listOCPAWSTags:::filter"]=""
operation_parameters_collection_type["listOCPAWSTags:::key_only"]=""
operation_parameters_collection_type["listOCPCosts:::limit"]=""
operation_parameters_collection_type["listOCPCosts:::offset"]=""
operation_parameters_collection_type["listOCPCosts:::units"]=""
operation_parameters_collection_type["listOCPCosts:::delta"]=""
operation_parameters_collection_type["listOCPCpus:::limit"]=""
operation_parameters_collection_type["listOCPCpus:::offset"]=""
operation_parameters_collection_type["listOCPCpus:::units"]=""
operation_parameters_collection_type["listOCPCpus:::delta"]=""
operation_parameters_collection_type["listOCPMemorys:::limit"]=""
operation_parameters_collection_type["listOCPMemorys:::offset"]=""
operation_parameters_collection_type["listOCPMemorys:::units"]=""
operation_parameters_collection_type["listOCPMemorys:::delta"]=""
operation_parameters_collection_type["listOCPTags:::filter"]=""
operation_parameters_collection_type["listOCPTags:::key_only"]=""
operation_parameters_collection_type["listOCPVolumes:::limit"]=""
operation_parameters_collection_type["listOCPVolumes:::offset"]=""
operation_parameters_collection_type["listOCPVolumes:::units"]=""
operation_parameters_collection_type["listOCPVolumes:::delta"]=""
operation_parameters_collection_type["listProviders:::limit"]=""
operation_parameters_collection_type["listProviders:::offset"]=""
operation_parameters_collection_type["listProviders:::type"]=""
operation_parameters_collection_type["listProviders:::name"]=""
operation_parameters_collection_type["listUserPreferences:::limit"]=""
operation_parameters_collection_type["listUserPreferences:::offset"]=""
operation_parameters_collection_type["partialUpdateCostModel:::uuid"]=""
operation_parameters_collection_type["partialUpdateCostModel:::source_type"]=""
operation_parameters_collection_type["partialUpdateCostModel:::name"]=""
operation_parameters_collection_type["partialUpdateCostModel:::UNKNOWN_BASE_TYPE"]=""
operation_parameters_collection_type["partialUpdateUserPreference:::uuid"]=""
operation_parameters_collection_type["partialUpdateUserPreference:::UNKNOWN_BASE_TYPE"]=""
operation_parameters_collection_type["retrieveCostModel:::uuid"]=""
operation_parameters_collection_type["retrieveCostModel:::source_type"]=""
operation_parameters_collection_type["retrieveCostModel:::name"]=""
operation_parameters_collection_type["retrieveProvider:::uuid"]=""
operation_parameters_collection_type["retrieveProvider:::type"]=""
operation_parameters_collection_type["retrieveProvider:::name"]=""
operation_parameters_collection_type["retrieveUserPreference:::uuid"]=""
operation_parameters_collection_type["updateCostModel:::uuid"]=""
operation_parameters_collection_type["updateCostModel:::source_type"]=""
operation_parameters_collection_type["updateCostModel:::name"]=""
operation_parameters_collection_type["updateCostModel:::UNKNOWN_BASE_TYPE"]=""
operation_parameters_collection_type["updateUserPreference:::uuid"]=""
operation_parameters_collection_type["updateUserPreference:::UNKNOWN_BASE_TYPE"]=""


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

${BOLD}${WHITE}Cost Management command line client (API version 1)${OFF}

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
    echo -e "${BOLD}${WHITE}Operations (grouped by tags)${OFF}"
    echo ""
    echo -e "${BOLD}${WHITE}[default]${OFF}"
read -r -d '' ops <<EOF
  ${CYAN}createCostModel${OFF};
  ${CYAN}createProvider${OFF};
  ${CYAN}createUserPreference${OFF};
  ${CYAN}destroyCostModel${OFF};
  ${CYAN}destroyProvider${OFF};
  ${CYAN}destroyUserPreference${OFF};
  ${CYAN}listAWSCosts${OFF};
  ${CYAN}listAWSInstanceTypes${OFF};
  ${CYAN}listAWSStorages${OFF};
  ${CYAN}listAWSTags${OFF};
  ${CYAN}listCostModelMetricsMaps${OFF};
  ${CYAN}listCostModels${OFF};
  ${CYAN}listOCPAWSCosts${OFF};
  ${CYAN}listOCPAWSInstanceTypes${OFF};
  ${CYAN}listOCPAWSStorages${OFF};
  ${CYAN}listOCPAWSTags${OFF};
  ${CYAN}listOCPCosts${OFF};
  ${CYAN}listOCPCpus${OFF};
  ${CYAN}listOCPMemorys${OFF};
  ${CYAN}listOCPTags${OFF};
  ${CYAN}listOCPVolumes${OFF};
  ${CYAN}listProviders${OFF};
  ${CYAN}listStatus${OFF};
  ${CYAN}listUserPreferences${OFF};
  ${CYAN}partialUpdateCostModel${OFF};
  ${CYAN}partialUpdateUserPreference${OFF};
  ${CYAN}retrieveCostModel${OFF};
  ${CYAN}retrieveProvider${OFF};
  ${CYAN}retrieveUserPreference${OFF};
  ${CYAN}updateCostModel${OFF};
  ${CYAN}updateUserPreference${OFF};
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
    echo -e "${BOLD}${WHITE}Cost Management command line client (API version 1)${OFF}"
    echo ""
    echo -e "License: AGPL-3.0"
    echo -e "Contact: "
    echo ""
read -r -d '' appdescription <<EOF

The API for Cost Management. You can find out more about Cost Management at https://github.com/project-koku/.
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
    echo -e "${BOLD}Cost Management command line client (API version 1)${OFF}"
    echo ""
}

##############################################################################
#
# Print help for createCostModel operation
#
##############################################################################
print_createCostModel_help() {
    echo ""
    echo -e "${BOLD}${WHITE}createCostModel - ${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF}${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for createProvider operation
#
##############################################################################
print_createProvider_help() {
    echo ""
    echo -e "${BOLD}${WHITE}createProvider - ${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF}${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Successful Response for createProvider.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for createUserPreference operation
#
##############################################################################
print_createUserPreference_help() {
    echo ""
    echo -e "${BOLD}${WHITE}createUserPreference - ${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF}${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Successful Response for createUserPreference.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for destroyCostModel operation
#
##############################################################################
print_destroyCostModel_help() {
    echo ""
    echo -e "${BOLD}${WHITE}destroyCostModel - ${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}uuid${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - A UUID string identifying this cost model. ${YELLOW}Specify as: uuid=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}source_type${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - source_type${YELLOW} Specify as: source_type=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}name${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - name${YELLOW} Specify as: name=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=204
    echo -e "${result_color_table[${code:0:1}]}  204;${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for destroyProvider operation
#
##############################################################################
print_destroyProvider_help() {
    echo ""
    echo -e "${BOLD}${WHITE}destroyProvider - ${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}uuid${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} -  ${YELLOW}Specify as: uuid=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}type${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - type${YELLOW} Specify as: type=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}name${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - name${YELLOW} Specify as: name=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=204
    echo -e "${result_color_table[${code:0:1}]}  204;Object Deleted.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for destroyUserPreference operation
#
##############################################################################
print_destroyUserPreference_help() {
    echo ""
    echo -e "${BOLD}${WHITE}destroyUserPreference - ${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}uuid${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} -  ${YELLOW}Specify as: uuid=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=204
    echo -e "${result_color_table[${code:0:1}]}  204;Object Deleted.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for listAWSCosts operation
#
##############################################################################
print_listAWSCosts_help() {
    echo ""
    echo -e "${BOLD}${WHITE}listAWSCosts - ${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}limit${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: null)${OFF} - The  URL encoded limit to apply to the query${YELLOW} Specify as: limit=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}offset${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: null)${OFF} - The  URL encoded offset to apply to the query${YELLOW} Specify as: offset=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}delta${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - The  URL encoded delta to apply to the query${YELLOW} Specify as: delta=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}units${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - The  URL encoded units to apply to the query${YELLOW} Specify as: units=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Successful Response for ListAWSCosts.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for listAWSInstanceTypes operation
#
##############################################################################
print_listAWSInstanceTypes_help() {
    echo ""
    echo -e "${BOLD}${WHITE}listAWSInstanceTypes - ${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}limit${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: null)${OFF} - The  URL encoded limit to apply to the query${YELLOW} Specify as: limit=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}offset${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: null)${OFF} - The  URL encoded offset to apply to the query${YELLOW} Specify as: offset=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}delta${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - The  URL encoded delta to apply to the query${YELLOW} Specify as: delta=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}units${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - The  URL encoded units to apply to the query${YELLOW} Specify as: units=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Successful Response for ListAWSInstanceTypes.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for listAWSStorages operation
#
##############################################################################
print_listAWSStorages_help() {
    echo ""
    echo -e "${BOLD}${WHITE}listAWSStorages - ${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}limit${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: null)${OFF} - The  URL encoded limit to apply to the query${YELLOW} Specify as: limit=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}offset${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: null)${OFF} - The  URL encoded offset to apply to the query${YELLOW} Specify as: offset=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}delta${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - The  URL encoded delta to apply to the query${YELLOW} Specify as: delta=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}units${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - The  URL encoded units to apply to the query${YELLOW} Specify as: units=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Successful Response for ListAWSStorages.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for listAWSTags operation
#
##############################################################################
print_listAWSTags_help() {
    echo ""
    echo -e "${BOLD}${WHITE}listAWSTags - ${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}filter${OFF} ${BLUE}[Filter]${OFF} ${CYAN}(default: null)${OFF} - The  URL encoded filter to apply to the query${YELLOW} Specify as: filter=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}key_only${OFF} ${BLUE}[boolean]${OFF} ${CYAN}(default: null)${OFF} - The  URL encoded key_only to apply to the query${YELLOW} Specify as: key_only=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Successful Response for ListAWSTags.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for listCostModelMetricsMaps operation
#
##############################################################################
print_listCostModelMetricsMaps_help() {
    echo ""
    echo -e "${BOLD}${WHITE}listCostModelMetricsMaps - ${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}limit${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: null)${OFF} - Number of results to return per page.${YELLOW} Specify as: limit=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}offset${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: null)${OFF} - The initial index from which to return the results.${YELLOW} Specify as: offset=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Successful Response for ListCostModelMetricsMaps.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for listCostModels operation
#
##############################################################################
print_listCostModels_help() {
    echo ""
    echo -e "${BOLD}${WHITE}listCostModels - ${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}limit${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: null)${OFF} - Number of results to return per page.${YELLOW} Specify as: limit=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}offset${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: null)${OFF} - The initial index from which to return the results.${YELLOW} Specify as: offset=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}source_type${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - source_type${YELLOW} Specify as: source_type=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}name${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - name${YELLOW} Specify as: name=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for listOCPAWSCosts operation
#
##############################################################################
print_listOCPAWSCosts_help() {
    echo ""
    echo -e "${BOLD}${WHITE}listOCPAWSCosts - ${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}limit${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: null)${OFF} - The  URL encoded limit to apply to the query${YELLOW} Specify as: limit=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}offset${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: null)${OFF} - The  URL encoded offset to apply to the query${YELLOW} Specify as: offset=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}delta${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - The  URL encoded delta to apply to the query${YELLOW} Specify as: delta=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}units${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - The  URL encoded units to apply to the query${YELLOW} Specify as: units=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Successful Response for ListOCPAWSCosts.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for listOCPAWSInstanceTypes operation
#
##############################################################################
print_listOCPAWSInstanceTypes_help() {
    echo ""
    echo -e "${BOLD}${WHITE}listOCPAWSInstanceTypes - ${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}limit${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: null)${OFF} - The  URL encoded limit to apply to the query${YELLOW} Specify as: limit=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}offset${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: null)${OFF} - The  URL encoded offset to apply to the query${YELLOW} Specify as: offset=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}delta${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - The  URL encoded delta to apply to the query${YELLOW} Specify as: delta=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}units${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - The  URL encoded units to apply to the query${YELLOW} Specify as: units=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Successful Response for ListOCPAWSInstanceTypes.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for listOCPAWSStorages operation
#
##############################################################################
print_listOCPAWSStorages_help() {
    echo ""
    echo -e "${BOLD}${WHITE}listOCPAWSStorages - ${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}limit${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: null)${OFF} - The  URL encoded limit to apply to the query${YELLOW} Specify as: limit=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}offset${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: null)${OFF} - The  URL encoded offset to apply to the query${YELLOW} Specify as: offset=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}delta${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - The  URL encoded delta to apply to the query${YELLOW} Specify as: delta=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}units${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - The  URL encoded units to apply to the query${YELLOW} Specify as: units=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Successful Response for ListOCPAWSStorages.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for listOCPAWSTags operation
#
##############################################################################
print_listOCPAWSTags_help() {
    echo ""
    echo -e "${BOLD}${WHITE}listOCPAWSTags - ${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}filter${OFF} ${BLUE}[Filter2]${OFF} ${CYAN}(default: null)${OFF} - The  URL encoded filter to apply to the query${YELLOW} Specify as: filter=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}key_only${OFF} ${BLUE}[boolean]${OFF} ${CYAN}(default: null)${OFF} - The  URL encoded key_only to apply to the query${YELLOW} Specify as: key_only=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Successful Response for ListOCPAWSTags.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for listOCPCosts operation
#
##############################################################################
print_listOCPCosts_help() {
    echo ""
    echo -e "${BOLD}${WHITE}listOCPCosts - ${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}limit${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: null)${OFF} - The  URL encoded limit to apply to the query${YELLOW} Specify as: limit=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}offset${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: null)${OFF} - The  URL encoded offset to apply to the query${YELLOW} Specify as: offset=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}units${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - The  URL encoded units to apply to the query${YELLOW} Specify as: units=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}delta${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - The  URL encoded delta to apply to the query${YELLOW} Specify as: delta=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Successful Response for ListOCPCosts.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for listOCPCpus operation
#
##############################################################################
print_listOCPCpus_help() {
    echo ""
    echo -e "${BOLD}${WHITE}listOCPCpus - ${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}limit${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: null)${OFF} - The  URL encoded limit to apply to the query${YELLOW} Specify as: limit=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}offset${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: null)${OFF} - The  URL encoded offset to apply to the query${YELLOW} Specify as: offset=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}units${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - The  URL encoded units to apply to the query${YELLOW} Specify as: units=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}delta${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - The  URL encoded delta to apply to the query${YELLOW} Specify as: delta=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Successful Response for ListOCPCpus.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for listOCPMemorys operation
#
##############################################################################
print_listOCPMemorys_help() {
    echo ""
    echo -e "${BOLD}${WHITE}listOCPMemorys - ${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}limit${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: null)${OFF} - The  URL encoded limit to apply to the query${YELLOW} Specify as: limit=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}offset${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: null)${OFF} - The  URL encoded offset to apply to the query${YELLOW} Specify as: offset=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}units${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - The  URL encoded units to apply to the query${YELLOW} Specify as: units=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}delta${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - The  URL encoded delta to apply to the query${YELLOW} Specify as: delta=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Successful Response for ListOCPMemorys.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for listOCPTags operation
#
##############################################################################
print_listOCPTags_help() {
    echo ""
    echo -e "${BOLD}${WHITE}listOCPTags - ${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}filter${OFF} ${BLUE}[Filter1]${OFF} ${CYAN}(default: null)${OFF} - The  URL encoded filter to apply to the query${YELLOW} Specify as: filter=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}key_only${OFF} ${BLUE}[boolean]${OFF} ${CYAN}(default: null)${OFF} - The  URL encoded key_only to apply to the query${YELLOW} Specify as: key_only=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Successful Response for ListOCPTags.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for listOCPVolumes operation
#
##############################################################################
print_listOCPVolumes_help() {
    echo ""
    echo -e "${BOLD}${WHITE}listOCPVolumes - ${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}limit${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: null)${OFF} - The  URL encoded limit to apply to the query${YELLOW} Specify as: limit=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}offset${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: null)${OFF} - The  URL encoded offset to apply to the query${YELLOW} Specify as: offset=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}units${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - The  URL encoded units to apply to the query${YELLOW} Specify as: units=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}delta${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - The  URL encoded delta to apply to the query${YELLOW} Specify as: delta=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Successful Response for ListOCPVolumes.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for listProviders operation
#
##############################################################################
print_listProviders_help() {
    echo ""
    echo -e "${BOLD}${WHITE}listProviders - ${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}limit${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: null)${OFF} - Number of results to return per page.${YELLOW} Specify as: limit=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}offset${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: null)${OFF} - The initial index from which to return the results.${YELLOW} Specify as: offset=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}type${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - type${YELLOW} Specify as: type=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}name${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - name${YELLOW} Specify as: name=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Successful Response for ListProviders.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for listStatus operation
#
##############################################################################
print_listStatus_help() {
    echo ""
    echo -e "${BOLD}${WHITE}listStatus - ${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for listUserPreferences operation
#
##############################################################################
print_listUserPreferences_help() {
    echo ""
    echo -e "${BOLD}${WHITE}listUserPreferences - ${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}limit${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: null)${OFF} - Number of results to return per page.${YELLOW} Specify as: limit=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}offset${OFF} ${BLUE}[integer]${OFF} ${CYAN}(default: null)${OFF} - The initial index from which to return the results.${YELLOW} Specify as: offset=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Successful Response for ListUserPreferences.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for partialUpdateCostModel operation
#
##############################################################################
print_partialUpdateCostModel_help() {
    echo ""
    echo -e "${BOLD}${WHITE}partialUpdateCostModel - ${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}uuid${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - A UUID string identifying this cost model. ${YELLOW}Specify as: uuid=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}source_type${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - source_type${YELLOW} Specify as: source_type=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}name${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - name${YELLOW} Specify as: name=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF}${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for partialUpdateUserPreference operation
#
##############################################################################
print_partialUpdateUserPreference_help() {
    echo ""
    echo -e "${BOLD}${WHITE}partialUpdateUserPreference - ${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}uuid${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} -  ${YELLOW}Specify as: uuid=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF}${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Successful Response for partial_updateUserPreference.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for retrieveCostModel operation
#
##############################################################################
print_retrieveCostModel_help() {
    echo ""
    echo -e "${BOLD}${WHITE}retrieveCostModel - ${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}uuid${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - A UUID string identifying this cost model. ${YELLOW}Specify as: uuid=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}source_type${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - source_type${YELLOW} Specify as: source_type=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}name${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - name${YELLOW} Specify as: name=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for retrieveProvider operation
#
##############################################################################
print_retrieveProvider_help() {
    echo ""
    echo -e "${BOLD}${WHITE}retrieveProvider - ${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}uuid${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} -  ${YELLOW}Specify as: uuid=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}type${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - type${YELLOW} Specify as: type=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}name${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - name${YELLOW} Specify as: name=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Successful Response for retrieveProvider.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for retrieveUserPreference operation
#
##############################################################################
print_retrieveUserPreference_help() {
    echo ""
    echo -e "${BOLD}${WHITE}retrieveUserPreference - ${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}uuid${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} -  ${YELLOW}Specify as: uuid=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Successful Response for retrieveUserPreference.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for updateCostModel operation
#
##############################################################################
print_updateCostModel_help() {
    echo ""
    echo -e "${BOLD}${WHITE}updateCostModel - ${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}uuid${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} - A UUID string identifying this cost model. ${YELLOW}Specify as: uuid=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}source_type${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - source_type${YELLOW} Specify as: source_type=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}name${OFF} ${BLUE}[string]${OFF} ${CYAN}(default: null)${OFF} - name${YELLOW} Specify as: name=value${OFF}" \
        | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF}${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
}
##############################################################################
#
# Print help for updateUserPreference operation
#
##############################################################################
print_updateUserPreference_help() {
    echo ""
    echo -e "${BOLD}${WHITE}updateUserPreference - ${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo -e "${BOLD}${WHITE}Parameters${OFF}"
    echo -e "  * ${GREEN}uuid${OFF} ${BLUE}[string]${OFF} ${RED}(required)${OFF} ${CYAN}(default: null)${OFF} -  ${YELLOW}Specify as: uuid=value${OFF}" | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * ${GREEN}body${OFF} ${BLUE}[application/json]${OFF}${OFF} - " | paste -sd' ' | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "${BOLD}${WHITE}Responses${OFF}"
    code=200
    echo -e "${result_color_table[${code:0:1}]}  200;Successful Response for updateUserPreference.${OFF}" | paste -sd' ' | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
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
    local query_parameter_names=()
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
# Call createProvider operation
#
##############################################################################
call_createProvider() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=()
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
# Call createUserPreference operation
#
##############################################################################
call_createUserPreference() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=()
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
# Call destroyCostModel operation
#
##############################################################################
call_destroyCostModel() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(uuid)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(source_type name)
    local path

    if ! path=$(build_request_path "/api/cost-management/v1/costmodels/{uuid}/" path_parameter_names query_parameter_names); then
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
# Call destroyProvider operation
#
##############################################################################
call_destroyProvider() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(uuid)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(type name)
    local path

    if ! path=$(build_request_path "/api/cost-management/v1/providers/{uuid}/" path_parameter_names query_parameter_names); then
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
# Call destroyUserPreference operation
#
##############################################################################
call_destroyUserPreference() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(uuid)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=()
    local path

    if ! path=$(build_request_path "/api/cost-management/v1/preferences/{uuid}/" path_parameter_names query_parameter_names); then
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
# Call listAWSCosts operation
#
##############################################################################
call_listAWSCosts() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(limit offset delta units)
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
# Call listAWSInstanceTypes operation
#
##############################################################################
call_listAWSInstanceTypes() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(limit offset delta units)
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
# Call listAWSStorages operation
#
##############################################################################
call_listAWSStorages() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(limit offset delta units)
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
# Call listAWSTags operation
#
##############################################################################
call_listAWSTags() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(filter key_only)
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
# Call listCostModelMetricsMaps operation
#
##############################################################################
call_listCostModelMetricsMaps() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(limit offset)
    local path

    if ! path=$(build_request_path "/api/cost-management/v1/metrics/" path_parameter_names query_parameter_names); then
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
    local query_parameter_names=(limit offset source_type name)
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
# Call listOCPAWSCosts operation
#
##############################################################################
call_listOCPAWSCosts() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(limit offset delta units)
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
# Call listOCPAWSInstanceTypes operation
#
##############################################################################
call_listOCPAWSInstanceTypes() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(limit offset delta units)
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
# Call listOCPAWSStorages operation
#
##############################################################################
call_listOCPAWSStorages() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(limit offset delta units)
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
# Call listOCPAWSTags operation
#
##############################################################################
call_listOCPAWSTags() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(filter key_only)
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
# Call listOCPCosts operation
#
##############################################################################
call_listOCPCosts() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(limit offset units delta)
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
# Call listOCPCpus operation
#
##############################################################################
call_listOCPCpus() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(limit offset units delta)
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
# Call listOCPMemorys operation
#
##############################################################################
call_listOCPMemorys() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(limit offset units delta)
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
# Call listOCPTags operation
#
##############################################################################
call_listOCPTags() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(filter key_only)
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
# Call listOCPVolumes operation
#
##############################################################################
call_listOCPVolumes() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(limit offset units delta)
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
# Call listProviders operation
#
##############################################################################
call_listProviders() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(limit offset type name)
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
# Call listStatus operation
#
##############################################################################
call_listStatus() {
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
# Call listUserPreferences operation
#
##############################################################################
call_listUserPreferences() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=()
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(limit offset)
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
# Call partialUpdateCostModel operation
#
##############################################################################
call_partialUpdateCostModel() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(uuid)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(source_type name)
    local path

    if ! path=$(build_request_path "/api/cost-management/v1/costmodels/{uuid}/" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="PATCH"
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
# Call partialUpdateUserPreference operation
#
##############################################################################
call_partialUpdateUserPreference() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(uuid)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=()
    local path

    if ! path=$(build_request_path "/api/cost-management/v1/preferences/{uuid}/" path_parameter_names query_parameter_names); then
        ERROR_MSG=$path
        exit 1
    fi
    local method="PATCH"
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
# Call retrieveCostModel operation
#
##############################################################################
call_retrieveCostModel() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(uuid)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(source_type name)
    local path

    if ! path=$(build_request_path "/api/cost-management/v1/costmodels/{uuid}/" path_parameter_names query_parameter_names); then
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
# Call retrieveProvider operation
#
##############################################################################
call_retrieveProvider() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(uuid)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(type name)
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
# Call retrieveUserPreference operation
#
##############################################################################
call_retrieveUserPreference() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(uuid)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=()
    local path

    if ! path=$(build_request_path "/api/cost-management/v1/preferences/{uuid}/" path_parameter_names query_parameter_names); then
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
    local path_parameter_names=(uuid)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=(source_type name)
    local path

    if ! path=$(build_request_path "/api/cost-management/v1/costmodels/{uuid}/" path_parameter_names query_parameter_names); then
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
# Call updateUserPreference operation
#
##############################################################################
call_updateUserPreference() {
    # ignore error about 'path_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local path_parameter_names=(uuid)
    # ignore error about 'query_parameter_names' being unused; passed by reference
    # shellcheck disable=SC2034
    local query_parameter_names=()
    local path

    if ! path=$(build_request_path "/api/cost-management/v1/preferences/{uuid}/" path_parameter_names query_parameter_names); then
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
    createCostModel)
    operation="createCostModel"
    ;;
    createProvider)
    operation="createProvider"
    ;;
    createUserPreference)
    operation="createUserPreference"
    ;;
    destroyCostModel)
    operation="destroyCostModel"
    ;;
    destroyProvider)
    operation="destroyProvider"
    ;;
    destroyUserPreference)
    operation="destroyUserPreference"
    ;;
    listAWSCosts)
    operation="listAWSCosts"
    ;;
    listAWSInstanceTypes)
    operation="listAWSInstanceTypes"
    ;;
    listAWSStorages)
    operation="listAWSStorages"
    ;;
    listAWSTags)
    operation="listAWSTags"
    ;;
    listCostModelMetricsMaps)
    operation="listCostModelMetricsMaps"
    ;;
    listCostModels)
    operation="listCostModels"
    ;;
    listOCPAWSCosts)
    operation="listOCPAWSCosts"
    ;;
    listOCPAWSInstanceTypes)
    operation="listOCPAWSInstanceTypes"
    ;;
    listOCPAWSStorages)
    operation="listOCPAWSStorages"
    ;;
    listOCPAWSTags)
    operation="listOCPAWSTags"
    ;;
    listOCPCosts)
    operation="listOCPCosts"
    ;;
    listOCPCpus)
    operation="listOCPCpus"
    ;;
    listOCPMemorys)
    operation="listOCPMemorys"
    ;;
    listOCPTags)
    operation="listOCPTags"
    ;;
    listOCPVolumes)
    operation="listOCPVolumes"
    ;;
    listProviders)
    operation="listProviders"
    ;;
    listStatus)
    operation="listStatus"
    ;;
    listUserPreferences)
    operation="listUserPreferences"
    ;;
    partialUpdateCostModel)
    operation="partialUpdateCostModel"
    ;;
    partialUpdateUserPreference)
    operation="partialUpdateUserPreference"
    ;;
    retrieveCostModel)
    operation="retrieveCostModel"
    ;;
    retrieveProvider)
    operation="retrieveProvider"
    ;;
    retrieveUserPreference)
    operation="retrieveUserPreference"
    ;;
    updateCostModel)
    operation="updateCostModel"
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
    createCostModel)
    call_createCostModel
    ;;
    createProvider)
    call_createProvider
    ;;
    createUserPreference)
    call_createUserPreference
    ;;
    destroyCostModel)
    call_destroyCostModel
    ;;
    destroyProvider)
    call_destroyProvider
    ;;
    destroyUserPreference)
    call_destroyUserPreference
    ;;
    listAWSCosts)
    call_listAWSCosts
    ;;
    listAWSInstanceTypes)
    call_listAWSInstanceTypes
    ;;
    listAWSStorages)
    call_listAWSStorages
    ;;
    listAWSTags)
    call_listAWSTags
    ;;
    listCostModelMetricsMaps)
    call_listCostModelMetricsMaps
    ;;
    listCostModels)
    call_listCostModels
    ;;
    listOCPAWSCosts)
    call_listOCPAWSCosts
    ;;
    listOCPAWSInstanceTypes)
    call_listOCPAWSInstanceTypes
    ;;
    listOCPAWSStorages)
    call_listOCPAWSStorages
    ;;
    listOCPAWSTags)
    call_listOCPAWSTags
    ;;
    listOCPCosts)
    call_listOCPCosts
    ;;
    listOCPCpus)
    call_listOCPCpus
    ;;
    listOCPMemorys)
    call_listOCPMemorys
    ;;
    listOCPTags)
    call_listOCPTags
    ;;
    listOCPVolumes)
    call_listOCPVolumes
    ;;
    listProviders)
    call_listProviders
    ;;
    listStatus)
    call_listStatus
    ;;
    listUserPreferences)
    call_listUserPreferences
    ;;
    partialUpdateCostModel)
    call_partialUpdateCostModel
    ;;
    partialUpdateUserPreference)
    call_partialUpdateUserPreference
    ;;
    retrieveCostModel)
    call_retrieveCostModel
    ;;
    retrieveProvider)
    call_retrieveProvider
    ;;
    retrieveUserPreference)
    call_retrieveUserPreference
    ;;
    updateCostModel)
    call_updateCostModel
    ;;
    updateUserPreference)
    call_updateUserPreference
    ;;
    *)
    ERROR_MSG="ERROR: Unknown operation: $operation"
    exit 1
esac
