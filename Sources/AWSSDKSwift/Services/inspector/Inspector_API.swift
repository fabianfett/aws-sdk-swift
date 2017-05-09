// THIS FILE IS AUTOMATICALLY GENERATED. DO NOT EDIT.
/**
The MIT License (MIT)

Copyright (c) 2017 Yuki Takei(noppoMan)

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

*/

import Foundation
import Core

/**
Amazon Inspector Amazon Inspector enables you to analyze the behavior of your AWS resources and to identify potential security issues. For more information, see  Amazon Inspector User Guide.
*/
public struct Inspector {

    let client: AWSClient

    public init(accessKeyId: String? = nil, secretAccessKey: String? = nil, region: Core.Region? = nil, endpoint: String? = nil, middlewares: [AWSRequestMiddleware] = []) {
        self.client = AWSClient(
            accessKeyId: accessKeyId,
            secretAccessKey: secretAccessKey,
            region: region,
            amzTarget: "InspectorService",
            service: "inspector",
            serviceProtocol: .json,
            apiVersion: "2016-02-16",
            endpoint: endpoint,
            middlewares: [],
            possibleErrorTypes: [InspectorError.self]
        )
    }

    ///  Removes entire attributes (key and value pairs) from the findings that are specified by the ARNs of the findings where an attribute with the specified key exists.
    public func removeAttributesFromFindings(_ input: RemoveAttributesFromFindingsRequest) throws -> RemoveAttributesFromFindingsResponse {
        return try client.send(operation: "RemoveAttributesFromFindings", path: "/", httpMethod: "POST", input: input)
    }

    ///  Deletes the assessment template that is specified by the ARN of the assessment template.
    public func deleteAssessmentTemplate(_ input: DeleteAssessmentTemplateRequest) throws {
        _ = try client.send(operation: "DeleteAssessmentTemplate", path: "/", httpMethod: "POST", input: input)
    }

    ///  Disables the process of sending Amazon Simple Notification Service (SNS) notifications about a specified event to a specified SNS topic.
    public func unsubscribeFromEvent(_ input: UnsubscribeFromEventRequest) throws {
        _ = try client.send(operation: "UnsubscribeFromEvent", path: "/", httpMethod: "POST", input: input)
    }

    ///  Starts the assessment run specified by the ARN of the assessment template. For this API to function properly, you must not exceed the limit of running up to 500 concurrent agents per AWS account.
    public func startAssessmentRun(_ input: StartAssessmentRunRequest) throws -> StartAssessmentRunResponse {
        return try client.send(operation: "StartAssessmentRun", path: "/", httpMethod: "POST", input: input)
    }

    ///  Lists the ARNs of the assessment targets within this AWS account. For more information about assessment targets, see Amazon Inspector Assessment Targets.
    public func listAssessmentTargets(_ input: ListAssessmentTargetsRequest) throws -> ListAssessmentTargetsResponse {
        return try client.send(operation: "ListAssessmentTargets", path: "/", httpMethod: "POST", input: input)
    }

    ///  Lists all available Amazon Inspector rules packages.
    public func listRulesPackages(_ input: ListRulesPackagesRequest) throws -> ListRulesPackagesResponse {
        return try client.send(operation: "ListRulesPackages", path: "/", httpMethod: "POST", input: input)
    }

    ///  Creates a resource group using the specified set of tags (key and value pairs) that are used to select the EC2 instances to be included in an Amazon Inspector assessment target. The created resource group is then used to create an Amazon Inspector assessment target. For more information, see CreateAssessmentTarget.
    public func createResourceGroup(_ input: CreateResourceGroupRequest) throws -> CreateResourceGroupResponse {
        return try client.send(operation: "CreateResourceGroup", path: "/", httpMethod: "POST", input: input)
    }

    ///  Describes the resource groups that are specified by the ARNs of the resource groups.
    public func describeResourceGroups(_ input: DescribeResourceGroupsRequest) throws -> DescribeResourceGroupsResponse {
        return try client.send(operation: "DescribeResourceGroups", path: "/", httpMethod: "POST", input: input)
    }

    ///  Stops the assessment run that is specified by the ARN of the assessment run.
    public func stopAssessmentRun(_ input: StopAssessmentRunRequest) throws {
        _ = try client.send(operation: "StopAssessmentRun", path: "/", httpMethod: "POST", input: input)
    }

    ///  Lists all tags associated with an assessment template.
    public func listTagsForResource(_ input: ListTagsForResourceRequest) throws -> ListTagsForResourceResponse {
        return try client.send(operation: "ListTagsForResource", path: "/", httpMethod: "POST", input: input)
    }

    ///  Lists the assessment templates that correspond to the assessment targets that are specified by the ARNs of the assessment targets.
    public func listAssessmentTemplates(_ input: ListAssessmentTemplatesRequest) throws -> ListAssessmentTemplatesResponse {
        return try client.send(operation: "ListAssessmentTemplates", path: "/", httpMethod: "POST", input: input)
    }

    ///  Describes the IAM role that enables Amazon Inspector to access your AWS account.
    public func describeCrossAccountAccessRole() throws -> DescribeCrossAccountAccessRoleResponse {
        return try client.send(operation: "DescribeCrossAccountAccessRole", path: "/", httpMethod: "POST")
    }

    ///  Assigns attributes (key and value pairs) to the findings that are specified by the ARNs of the findings.
    public func addAttributesToFindings(_ input: AddAttributesToFindingsRequest) throws -> AddAttributesToFindingsResponse {
        return try client.send(operation: "AddAttributesToFindings", path: "/", httpMethod: "POST", input: input)
    }

    ///  Lists all the event subscriptions for the assessment template that is specified by the ARN of the assessment template. For more information, see SubscribeToEvent and UnsubscribeFromEvent.
    public func listEventSubscriptions(_ input: ListEventSubscriptionsRequest) throws -> ListEventSubscriptionsResponse {
        return try client.send(operation: "ListEventSubscriptions", path: "/", httpMethod: "POST", input: input)
    }

    ///  Creates an assessment template for the assessment target that is specified by the ARN of the assessment target.
    public func createAssessmentTemplate(_ input: CreateAssessmentTemplateRequest) throws -> CreateAssessmentTemplateResponse {
        return try client.send(operation: "CreateAssessmentTemplate", path: "/", httpMethod: "POST", input: input)
    }

    ///  Enables the process of sending Amazon Simple Notification Service (SNS) notifications about a specified event to a specified SNS topic.
    public func subscribeToEvent(_ input: SubscribeToEventRequest) throws {
        _ = try client.send(operation: "SubscribeToEvent", path: "/", httpMethod: "POST", input: input)
    }

    ///  Updates the assessment target that is specified by the ARN of the assessment target.
    public func updateAssessmentTarget(_ input: UpdateAssessmentTargetRequest) throws {
        _ = try client.send(operation: "UpdateAssessmentTarget", path: "/", httpMethod: "POST", input: input)
    }

    ///  Registers the IAM role that Amazon Inspector uses to list your EC2 instances at the start of the assessment run or when you call the PreviewAgents action.
    public func registerCrossAccountAccessRole(_ input: RegisterCrossAccountAccessRoleRequest) throws {
        _ = try client.send(operation: "RegisterCrossAccountAccessRole", path: "/", httpMethod: "POST", input: input)
    }

    ///  Describes the findings that are specified by the ARNs of the findings.
    public func describeFindings(_ input: DescribeFindingsRequest) throws -> DescribeFindingsResponse {
        return try client.send(operation: "DescribeFindings", path: "/", httpMethod: "POST", input: input)
    }

    ///  Lists the assessment runs that correspond to the assessment templates that are specified by the ARNs of the assessment templates.
    public func listAssessmentRuns(_ input: ListAssessmentRunsRequest) throws -> ListAssessmentRunsResponse {
        return try client.send(operation: "ListAssessmentRuns", path: "/", httpMethod: "POST", input: input)
    }

    ///  Deletes the assessment target that is specified by the ARN of the assessment target.
    public func deleteAssessmentTarget(_ input: DeleteAssessmentTargetRequest) throws {
        _ = try client.send(operation: "DeleteAssessmentTarget", path: "/", httpMethod: "POST", input: input)
    }

    ///  Creates a new assessment target using the ARN of the resource group that is generated by CreateResourceGroup. You can create up to 50 assessment targets per AWS account. You can run up to 500 concurrent agents per AWS account. For more information, see  Amazon Inspector Assessment Targets.
    public func createAssessmentTarget(_ input: CreateAssessmentTargetRequest) throws -> CreateAssessmentTargetResponse {
        return try client.send(operation: "CreateAssessmentTarget", path: "/", httpMethod: "POST", input: input)
    }

    ///  Lists findings that are generated by the assessment runs that are specified by the ARNs of the assessment runs.
    public func listFindings(_ input: ListFindingsRequest) throws -> ListFindingsResponse {
        return try client.send(operation: "ListFindings", path: "/", httpMethod: "POST", input: input)
    }

    ///  Information about the data that is collected for the specified assessment run.
    public func getTelemetryMetadata(_ input: GetTelemetryMetadataRequest) throws -> GetTelemetryMetadataResponse {
        return try client.send(operation: "GetTelemetryMetadata", path: "/", httpMethod: "POST", input: input)
    }

    ///  Describes the assessment runs that are specified by the ARNs of the assessment runs.
    public func describeAssessmentRuns(_ input: DescribeAssessmentRunsRequest) throws -> DescribeAssessmentRunsResponse {
        return try client.send(operation: "DescribeAssessmentRuns", path: "/", httpMethod: "POST", input: input)
    }

    ///  Describes the rules packages that are specified by the ARNs of the rules packages.
    public func describeRulesPackages(_ input: DescribeRulesPackagesRequest) throws -> DescribeRulesPackagesResponse {
        return try client.send(operation: "DescribeRulesPackages", path: "/", httpMethod: "POST", input: input)
    }

    ///  Sets tags (key and value pairs) to the assessment template that is specified by the ARN of the assessment template.
    public func setTagsForResource(_ input: SetTagsForResourceRequest) throws {
        _ = try client.send(operation: "SetTagsForResource", path: "/", httpMethod: "POST", input: input)
    }

    ///  Deletes the assessment run that is specified by the ARN of the assessment run.
    public func deleteAssessmentRun(_ input: DeleteAssessmentRunRequest) throws {
        _ = try client.send(operation: "DeleteAssessmentRun", path: "/", httpMethod: "POST", input: input)
    }

    ///  Describes the assessment targets that are specified by the ARNs of the assessment targets.
    public func describeAssessmentTargets(_ input: DescribeAssessmentTargetsRequest) throws -> DescribeAssessmentTargetsResponse {
        return try client.send(operation: "DescribeAssessmentTargets", path: "/", httpMethod: "POST", input: input)
    }

    ///  Describes the assessment templates that are specified by the ARNs of the assessment templates.
    public func describeAssessmentTemplates(_ input: DescribeAssessmentTemplatesRequest) throws -> DescribeAssessmentTemplatesResponse {
        return try client.send(operation: "DescribeAssessmentTemplates", path: "/", httpMethod: "POST", input: input)
    }

    ///  Previews the agents installed on the EC2 instances that are part of the specified assessment target.
    public func previewAgents(_ input: PreviewAgentsRequest) throws -> PreviewAgentsResponse {
        return try client.send(operation: "PreviewAgents", path: "/", httpMethod: "POST", input: input)
    }

    ///  Lists the agents of the assessment runs that are specified by the ARNs of the assessment runs.
    public func listAssessmentRunAgents(_ input: ListAssessmentRunAgentsRequest) throws -> ListAssessmentRunAgentsResponse {
        return try client.send(operation: "ListAssessmentRunAgents", path: "/", httpMethod: "POST", input: input)
    }


}