/*
 * Copyright (c) 2025. All rights reserved.
 * Licensed under the MIT License. See LICENSE file in the project root for details.
 */

/**
 * Data Transfer Object for Approval Work Item
 */
public with sharing class DTO_ApprovalWorkItem {
    @AuraEnabled
    @InvocableVariable(Label='Id')
    public String itemId;

    @AuraEnabled
    @InvocableVariable(Label='Related Record Id')
    public String relatedRecordId;

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
    
    @AuraEnabled
    @InvocableVariable(Label='Approval Condition Name')
    public String approvalConditionName;

    public DTO_ApprovalWorkItem(ApprovalWorkItem awi) {
        itemId = awi.Id;
        relatedRecordId = awi.RelatedRecordId;
        createdDate = awi.CreatedDate;
        status = awi.Status;
        assignedToName = awi.AssignedTo.Name;
        reviewedByName = awi.ReviewedBy.Name;
        reviewedDate = awi.ReviewedDate;
        comments = awi.Comments;
        approvalConditionName = awi.ApprovalConditionName;
    }
}
