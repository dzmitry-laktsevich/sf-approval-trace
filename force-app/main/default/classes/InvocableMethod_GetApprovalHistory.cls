/**
 * Implements the invocable method to get the approval history for records
 */
public without sharing class InvocableMethod_GetApprovalHistory {
    @TestVisible
    private static List<ApprovalWorkItem> approvalWorkItemsForTest = new List<ApprovalWorkItem>();

    /**
     * Gets the approval history for the specified record IDs
     * 
     * @param recordIds The list of record IDs to retrieve approval history for
     * @return A list of lists containing the approval work items for each record ID
     */
    @InvocableMethod(Label='Get Approval History' Description='Returns Approval History for a given record' Category='Flow Approval Process')
    public static List<List<DTO_ApprovalWorkItem>> getApprovalHistory(List<Id> recordIds) {
        List<List<DTO_ApprovalWorkItem>> approvalHistory = new List<List<DTO_ApprovalWorkItem>>();
        Map<Id, List<DTO_ApprovalWorkItem>> approvalWorItemsByRecordId = new Map<Id, List<DTO_ApprovalWorkItem>>();

        for (ApprovalWorkItem approvalWorkItem : getApprovalWorkItems(recordIds)) {
            DTO_ApprovalWorkItem awiDTO = new DTO_ApprovalWorkItem(approvalWorkItem);
            if (!approvalWorItemsByRecordId.containsKey(approvalWorkItem.RelatedRecordId)) {
                approvalWorItemsByRecordId.put(approvalWorkItem.RelatedRecordId, new List<DTO_ApprovalWorkItem>());
            }
            approvalWorItemsByRecordId.get(approvalWorkItem.RelatedRecordId).add(awiDTO);
        }

        for (Id recordId : approvalWorItemsByRecordId.keySet()) {
            approvalHistory.add(approvalWorItemsByRecordId.get(recordId));
        }
        return approvalHistory;
    }

    private static List<ApprovalWorkItem> getApprovalWorkItems(List<Id> recordIds) {
        if (Test.isRunningTest()) {
            return approvalWorkItemsForTest;
        }

        return [
            SELECT CreatedDate, Status, AssignedTo.Name, ReviewedBy.Name, ReviewedDate, RelatedRecordId, Comments, ApprovalConditionName
            FROM ApprovalWorkItem
            WHERE RelatedRecordId IN :recordIds
            ORDER BY CreatedDate DESC
        ];
    }
}
