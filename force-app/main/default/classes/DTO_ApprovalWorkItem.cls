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
    @InvocableVariable(Label='Approval Condition Name')
    public String approvalConditionName;

    @AuraEnabled
    @InvocableVariable(Label='Approval Submission Id')
    public String approvalSubmissionId;

    @AuraEnabled
    @InvocableVariable(Label='Assigned To Id')
    public String assignedToId;

    @AuraEnabled
    @InvocableVariable(Label='Assigned To')
    public String assignedToName;

    @AuraEnabled
    @InvocableVariable(Label='Comments')
    public String comments;

    @AuraEnabled
    @InvocableVariable(Label='Created By Id')
    public String createdById;

    @AuraEnabled
    @InvocableVariable(Label='Created Date')
    public Datetime createdDate;

    @AuraEnabled
    @InvocableVariable(Label='Flow Orchestration Work Item Id')
    public String flowOrchestrationWorkItemId;

    @AuraEnabled
    @InvocableVariable(Label='Name')
    public String itemName;

    @AuraEnabled
    @InvocableVariable(Label='Related Record Id')
    public String relatedRecordId;

    @AuraEnabled
    @InvocableVariable(Label='Related Record Object Name')
    public String relatedRecordObjectName;

    @AuraEnabled
    @InvocableVariable(Label='Reviewed By Id')
    public String reviewedById;

    @AuraEnabled
    @InvocableVariable(Label='Reviewed By')
    public String reviewedByName;

    @AuraEnabled
    @InvocableVariable(Label='Reviewed Date')
    public Datetime reviewedDate;

    @AuraEnabled
    @InvocableVariable(Label='Status')
    public String status;

    public DTO_ApprovalWorkItem(ApprovalWorkItem awi) {
        itemId = awi.Id;
        approvalConditionName = awi.ApprovalConditionName;
        approvalSubmissionId = awi.ApprovalSubmissionId;
        assignedToId = awi.AssignedToId;
        assignedToName = awi.AssignedTo.Name;
        comments = awi.Comments;
        createdById = awi.CreatedById;
        createdDate = awi.CreatedDate;
        flowOrchestrationWorkItemId = awi.FlowOrchestrationWorkItemId;
        itemName = awi.Name;
        relatedRecordId = awi.RelatedRecordId;
        relatedRecordObjectName = awi.RelatedRecordObjectName;
        reviewedById = awi.ReviewedById;
        reviewedByName = awi.ReviewedBy.Name;
        reviewedDate = awi.ReviewedDate;
        status = awi.Status;
    }
}
