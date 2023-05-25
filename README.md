# PowerShell Script: Helpdesk Ticket Response Automation
This PowerShell script automates the process of attaching a greeting and salutation to helpdesk ticket responses. It is designed to assist helpdesk workers in quickly adding standardized prefix and suffix information to their responses, whether the information is obtained online or from a FAQ sheet.

This purpose of this project was to remove unncessary clutter in the FAQ sheet

## Prerequisites
  - Windows operating system with PowerShell installed (version 3.0 or above)
  - Remote policy permissions for the user and the file
  - Ticket management system that allows HTML formating, such as TopDesk.

## User Remote Policy Requirements
The user running the script should have the following remote policy permissions:

- Access to execute PowerShell scripts on the local machine
- Sufficient privileges to access and modify the required files and directories

## File Remote Policy Requirements
The file that the script will read from should have the following remote policy permissions:

- Sufficient access privileges to read the content of the file
- Appropriate file permissions to modify and save the generated response
- Ensure that the user and file remote policy requirements are met before executing the script.

## Usage
- Create a custom greeting and salutation
- Create a custom hotkey to copy text and add greetings and salutation to it
- Copy and Paste responses to ticket

## Instructions

## Customization
  - Modify the prefix.html to change the default greeting message according to your organization's guidelines.
  - Modify the suffix.html to change the default salutation message as required.
Feel free to customize the script further to suit your specific requirements, such as adding additional prompts, validation, or error handling.
Note: Ensure that you use the appropriate formatting and placeholders for the variables within the greeting and salutation to maintain a professional tone in your responses.


## Disclaimer
This script is provided as-is without any warranties. Use it at your own risk. Always review the generated response to ensure accuracy and appropriateness before sending it to customers.

## License
This script is released under the MIT License.
