# Salesforce Approval Trace

A custom **Approval Trace** component replaces the standard Approval Trace for visualizing the approval history for **Flow Approval Orchestartions**.

## Key Advantages

- Accessible by any User. In comparison, standard Approval Trace component is accessible by users with the Salesforce License only
- Better User Interface
- Uses Sreen Flow for the visualization - it can be easily modified or extended

## How to Use

1. Clone this repository and deploy the metadata to your Salesforce org: classes, Flow, new Approval Work Item fields, and Permission Set.
2. Add the **[Approval Trace](force-app/main/default/flows/ApprovalTrace.flow-meta.xml)** Screen Flow component to a Record Page. Pass **Record Id** to the Flow.

## How to Modify

1. Assign the **[Approval Trace Admin](force-app/main/default/permissionsets/ApprovalTraceAdmin.permissionset-meta.xml)** Permission Set to the System Administrator for accessing all fields in the Flow.
2. Save the **[Approval Trace](force-app/main/default/flows/ApprovalTrace.flow-meta.xml)** Screen Flow as a new version, update it as you wish and activate.
3. For new fields on the Approval Work Item object, create the mapping in the **[DTO_ApprovalWorkItem](force-app/main/default/classes/DTO_ApprovalWorkItem.cls)** Apex class.

## Limitations

1. The component is *not designed for classic Approval Process*. It displays Approval Work Items for **Flow Approval Orchestrations**.
2. Supports all standard fields of the ApprovalWorkItem object, additionally custom Assigned To, and Reviewed By fields. If your Salesforce org has other fields, modify the mapping in the **[DTO_ApprovalWorkItem](force-app/main/default/classes/DTO_ApprovalWorkItem.cls)** class to access fields in the Screen Flow.
3. The standard Approval Submission and Approval Work Item objects are *limited to users with the Salesforce License*. Don't use links and don't redirect users with other Licenses to these records.

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contact
Open an issue or pull request with questions or requests for enhancements.
