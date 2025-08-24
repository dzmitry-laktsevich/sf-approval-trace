/**
* Test class for {@link InvocableMethod_GetApprovalHistory}
* @author Dzmitry Laktsevich
*/
@IsTest
private class InvocableMethod_GetApprovalHistoryTest {
    private static final String ASSIGNEE_NAME = 'ApprovalHistory Assignee';
    private static final String REVIEWER_NAME = 'ApprovalHistory Reviewer';
    private static final String AWI_JSON_FORMAT = '\'{\'"RelatedRecordId": "{0}", "AssignedTo": \'{\'"attributes": \'{\'"type": "User"\'}\', "Name": "{1}"\'}\', "ReviewedBy": \'{\'"attributes": \'{\'"type": "User"\'}\',"Name": "{2}"\'}}\'';

    @IsTest
    static void testSingleRecordWithApprovalItems() {
        Integer numOfRecords = 1;
        List<Id> testRecordIds = setupTestData(numOfRecords);

        Test.startTest();
        List<List<DTO_ApprovalWorkItem>> approvalHistory = InvocableMethod_GetApprovalHistory.getApprovalHistory(
            testRecordIds
        );
        Test.stopTest();

        Assert.isNotNull(approvalHistory, 'Approval History should not be null');
        Assert.areEqual(numOfRecords, approvalHistory.size(), 'Should return one list of approval items');
        Assert.isFalse(approvalHistory[0].isEmpty(), 'Should have at least one approval item');

        DTO_ApprovalWorkItem dto = approvalHistory[0][0];
        Assert.areEqual(ASSIGNEE_NAME, dto.assignedToName, 'AssignedToName should be populated');
        Assert.areEqual(REVIEWER_NAME, dto.reviewedByName, 'ReviewedByName should be populated');
        Assert.areEqual(testRecordIds[0], dto.relatedRecordId, 'RelatedRecordId should match the test account Id');
    }

    @IsTest
    static void testMultipleRecordsWithApprovalItems() {
        Integer numOfRecords = 3;
        List<Id> testRecordIds = setupTestData(numOfRecords);

        Test.startTest();
        List<List<DTO_ApprovalWorkItem>> approvalHistory = InvocableMethod_GetApprovalHistory.getApprovalHistory(
            testRecordIds
        );
        Test.stopTest();

        Assert.isNotNull(approvalHistory, 'Approval History should not be null');
        Assert.areEqual(numOfRecords, approvalHistory.size(), 'Should return one list of approval items');
        for (List<DTO_ApprovalWorkItem> items : approvalHistory) {
            Assert.isFalse(items.isEmpty(), 'Each record should have at least one approval item');
        }

        Integer index = 1;
        for (DTO_ApprovalWorkItem dto : approvalHistory[index]) {
            Assert.areEqual(ASSIGNEE_NAME, dto.assignedToName, 'AssignedToName should be populated');
            Assert.areEqual(REVIEWER_NAME, dto.reviewedByName, 'ReviewedByName should be populated');
            Assert.areEqual(testRecordIds[index], dto.relatedRecordId, 'RelatedRecordId should match the test account Id');
        }
    }

    @IsTest
    static void testRecordWithNoApprovalItems() {
        List<Id> testRecordIds = new List<Id>{ '001000000000000000' };

        Test.startTest();
        List<List<DTO_ApprovalWorkItem>> approvalHistory = InvocableMethod_GetApprovalHistory.getApprovalHistory(
            testRecordIds
        );
        Test.stopTest();

        Assert.isNotNull(approvalHistory, 'Approval History should not be null');
        Assert.isTrue(approvalHistory.isEmpty(), 'Should return empty list for record with no approval items');
    }

    private static List<Id> setupTestData(Integer numOfRecords) {
        List<Id> recordIds = new List<Id>();

        for (Integer i = 0; i < numOfRecords; i++) {
            Id mockId = '00100000000000000' + i;

            for (Integer j = 0; j < 3; j++) {
                String awiJSON = String.format(AWI_JSON_FORMAT, new List<Object>{ mockId, ASSIGNEE_NAME, REVIEWER_NAME });
                ApprovalWorkItem awi = (ApprovalWorkItem) JSON.deserialize(awiJSON, ApprovalWorkItem.class);
                InvocableMethod_GetApprovalHistory.approvalWorkItemsForTest.add(awi);
            }
            recordIds.add(mockId);
        }

        return recordIds;
    }
}
