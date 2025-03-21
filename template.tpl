___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "TAG",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "Salesforce Marketing Cloud Personalization (MCP)",
  "categories" : ["ANALYTICS", "MARKETING", "PERSONALIZATION"],
  "brand": {
    "id": "brand_salesforce",
    "displayName": "Salesforce"
  },
  "description": "Template to insert the Salesforce Marketing Cloud Personalization (MCP), formerly Interaction Studio, beacon into your site.",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "mcp_account_id",
    "displayName": "MCP Account ID",
    "simpleValueType": true
  },
  {
    "type": "TEXT",
    "name": "mcp_dataset",
    "displayName": "MCP Dataset",
    "simpleValueType": true
  },
  {
    "type": "CHECKBOX",
    "name": "debug",
    "checkboxText": "Turn on Console Debug",
    "simpleValueType": true
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

// Require the necessary APIs
const logToConsole = require('logToConsole');
const injectScript = require('injectScript');
const queryPermission = require('queryPermission');

// Get the URL the user input into the text field
const mcpAccountId = data.mcp_account_id;
const mcpDataset = data.mcp_dataset;

// If the user chose to log debug output, initialize the logging method
const log = data.debug ? logToConsole : (() => {});


// If the script loaded successfully, log a message and signal success
const onSuccess = () => {
  log('MCP: Script loaded successfully.');
  data.gtmOnSuccess();
};

// If the script fails to load, log a message and signal failure
const onFailure = () => {
  log('MCP: Script load failed.');
  data.gtmOnFailure();
};

// If the URL input by the user matches the permissions set for the template,
// inject the script with the onSuccess and onFailure methods as callbacks.
let url = 'https://cdn.evgnet.com/beacon/' + mcpAccountId + '/' + mcpDataset + '/scripts/evergage.min.js';

if (queryPermission('inject_script', url)) {
  injectScript(url, onSuccess, onFailure);
}else {
  log('MCP: Script load failed due to permissions mismatch.');
  data.gtmOnFailure();
}


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "logging",
        "versionId": "1"
      },
      "param": [
        {
          "key": "environments",
          "value": {
            "type": 1,
            "string": "debug"
          }
        }
      ]
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "inject_script",
        "versionId": "1"
      },
      "param": [
        {
          "key": "urls",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "https://*.evgnet.com/*"
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TESTS___

scenarios: []


___NOTES___

Created on 3/18/2025, 5:02:04 PM
