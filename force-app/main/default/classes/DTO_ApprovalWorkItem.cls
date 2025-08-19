public with sharing class DTO_ApprovalWorkItem {
    @AuraEnabled
    @InvocableVariable(Label='Id')
    public String itemId;

    @AuraEnabled
    @InvocableVariable(Label='Created Date')
    public Datetime createdDate;

    @AuraEnabled
    @InvocableVariable(Label='Status')
    public String status;

    @AuraEnabled
    @InvocableVariable(Label='Assigned To')
    public String assignedToName;

    @AuraEnabled
    @InvocableVariable(Label='Reviewed By')
    public String reviewedByName;

    @AuraEnabled
    @InvocableVariable(Label='Reviewed Date')
    public Datetime reviewedDate;

    @AuraEnabled
    @InvocableVariable(Label='Comments')
    public String comments;

    public DTO_ApprovalWorkItem(ApprovalWorkItem awi) {
        itemId = awi.Id;
        createdDate = awi.CreatedDate;
        status = awi.Status;
        assignedToName = awi.AssignedTo.Name;
        reviewedByName = awi.ReviewedBy.Name;
        reviewedDate = awi.ReviewedDate;
        comments = awi.Comments;
    }
}
