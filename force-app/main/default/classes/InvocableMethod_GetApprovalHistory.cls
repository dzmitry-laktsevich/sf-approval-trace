public with sharing class InvocableMethod_GetApprovalHistory {
    @InvocableMethod(Label='Get Approval History' Description='Returns Approval History for a given record' Category='Flow Approval Process')
    public static List<List<DTO_ApprovalWorkItem>> getApprovalHistory(List<Id> recordIds) {
        List<List<DTO_ApprovalWorkItem>> approvalHistory = new List<List<DTO_ApprovalWorkItem>>();
        List<ApprovalWorkItem> approvalWorkItems = [
                SELECT CreatedDate, Status, AssignedTo.Name, ReviewedBy.Name, ReviewedDate, RelatedRecordId, Comments
                FROM ApprovalWorkItem
                WHERE RelatedRecordId IN :recordIds
                ORDER BY CreatedDate DESC
        ];

        Map<Id, List<DTO_ApprovalWorkItem>> approvalWorItemsByRecordId = new Map<Id, List<DTO_ApprovalWorkItem>>();
        for (ApprovalWorkItem approvalWorkItem : approvalWorkItems) {
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
}
