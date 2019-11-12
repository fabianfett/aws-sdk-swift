// THIS FILE IS AUTOMATICALLY GENERATED by https://github.com/swift-aws/aws-sdk-swift/blob/master/CodeGenerator/Sources/CodeGenerator/main.swift. DO NOT EDIT.

import Foundation
import AWSSDKSwiftCore
import NIO

/**
This AWS CodeStar Notifications API Reference provides descriptions and usage examples of the operations and data types for the AWS CodeStar Notifications API. You can use the AWS CodeStar Notifications API to work with the following objects: Notification rules, by calling the following:     CreateNotificationRule, which creates a notification rule for a resource in your account.     DeleteNotificationRule, which deletes a notification rule.     DescribeNotificationRule, which provides information about a notification rule.     ListNotificationRules, which lists the notification rules associated with your account.     UpdateNotificationRule, which changes the name, events, or targets associated with a notification rule.     Subscribe, which subscribes a target to a notification rule.     Unsubscribe, which removes a target from a notification rule.    Targets, by calling the following:     DeleteTarget, which removes a notification rule target (SNS topic) from a notification rule.     ListTargets, which lists the targets associated with a notification rule.    Events, by calling the following:     ListEventTypes, which lists the event types you can include in a notification rule.    Tags, by calling the following:     ListTagsForResource, which lists the tags already associated with a notification rule in your account.     TagResource, which associates a tag you provide with a notification rule in your account.     UntagResource, which removes a tag from a notification rule in your account.     For information about how to use AWS CodeStar Notifications, see link in the CodeStarNotifications User Guide. 
*/
public struct CodeStarNotifications {

    public let client: AWSClient

    public init(accessKeyId: String? = nil, secretAccessKey: String? = nil, sessionToken: String? = nil, region: AWSSDKSwiftCore.Region? = nil, endpoint: String? = nil, middlewares: [AWSServiceMiddleware] = [], eventLoopGroupProvider: AWSClient.EventLoopGroupProvider = .useAWSClientShared) {
        self.client = AWSClient(
            accessKeyId: accessKeyId,
            secretAccessKey: secretAccessKey,
            sessionToken: sessionToken,
            region: region,
            service: "codestar-notifications",
            serviceProtocol: ServiceProtocol(type: .restjson, version: ServiceProtocol.Version(major: 1, minor: 1)),
            apiVersion: "2019-10-15",
            endpoint: endpoint,
            middlewares: middlewares,
            possibleErrorTypes: [CodeStarNotificationsErrorType.self],
            eventLoopGroupProvider: eventLoopGroupProvider
        )
    }

    ///  Creates a notification rule for a resource. The rule specifies the events you want notifications about and the targets (such as SNS topics) where you want to receive them.
    public func createNotificationRule(_ input: CreateNotificationRuleRequest) -> Future<CreateNotificationRuleResult> {
        return client.send(operation: "CreateNotificationRule", path: "/createNotificationRule", httpMethod: "POST", input: input)
    }

    ///  Deletes a notification rule for a resource.
    public func deleteNotificationRule(_ input: DeleteNotificationRuleRequest) -> Future<DeleteNotificationRuleResult> {
        return client.send(operation: "DeleteNotificationRule", path: "/deleteNotificationRule", httpMethod: "POST", input: input)
    }

    ///  Deletes a specified target for notifications.
    public func deleteTarget(_ input: DeleteTargetRequest) -> Future<DeleteTargetResult> {
        return client.send(operation: "DeleteTarget", path: "/deleteTarget", httpMethod: "POST", input: input)
    }

    ///  Returns information about a specified notification rule.
    public func describeNotificationRule(_ input: DescribeNotificationRuleRequest) -> Future<DescribeNotificationRuleResult> {
        return client.send(operation: "DescribeNotificationRule", path: "/describeNotificationRule", httpMethod: "POST", input: input)
    }

    ///  Returns information about the event types available for configuring notifications.
    public func listEventTypes(_ input: ListEventTypesRequest) -> Future<ListEventTypesResult> {
        return client.send(operation: "ListEventTypes", path: "/listEventTypes", httpMethod: "POST", input: input)
    }

    ///  Returns a list of the notification rules for an AWS account.
    public func listNotificationRules(_ input: ListNotificationRulesRequest) -> Future<ListNotificationRulesResult> {
        return client.send(operation: "ListNotificationRules", path: "/listNotificationRules", httpMethod: "POST", input: input)
    }

    ///  Returns a list of the tags associated with a notification rule.
    public func listTagsForResource(_ input: ListTagsForResourceRequest) -> Future<ListTagsForResourceResult> {
        return client.send(operation: "ListTagsForResource", path: "/listTagsForResource", httpMethod: "POST", input: input)
    }

    ///  Returns a list of the notification rule targets for an AWS account.
    public func listTargets(_ input: ListTargetsRequest) -> Future<ListTargetsResult> {
        return client.send(operation: "ListTargets", path: "/listTargets", httpMethod: "POST", input: input)
    }

    ///  Creates an association between a notification rule and an SNS topic so that the associated target can receive notifications when the events described in the rule are triggered.
    public func subscribe(_ input: SubscribeRequest) -> Future<SubscribeResult> {
        return client.send(operation: "Subscribe", path: "/subscribe", httpMethod: "POST", input: input)
    }

    ///  Associates a set of provided tags with a notification rule.
    public func tagResource(_ input: TagResourceRequest) -> Future<TagResourceResult> {
        return client.send(operation: "TagResource", path: "/tagResource", httpMethod: "POST", input: input)
    }

    ///  Removes an association between a notification rule and an Amazon SNS topic so that subscribers to that topic stop receiving notifications when the events described in the rule are triggered.
    public func unsubscribe(_ input: UnsubscribeRequest) -> Future<UnsubscribeResult> {
        return client.send(operation: "Unsubscribe", path: "/unsubscribe", httpMethod: "POST", input: input)
    }

    ///  Removes the association between one or more provided tags and a notification rule.
    public func untagResource(_ input: UntagResourceRequest) -> Future<UntagResourceResult> {
        return client.send(operation: "UntagResource", path: "/untagResource", httpMethod: "POST", input: input)
    }

    ///  Updates a notification rule for a resource. You can change the events that trigger the notification rule, the status of the rule, and the targets that receive the notifications.  To add or remove tags for a notification rule, you must use TagResource and UntagResource. 
    public func updateNotificationRule(_ input: UpdateNotificationRuleRequest) -> Future<UpdateNotificationRuleResult> {
        return client.send(operation: "UpdateNotificationRule", path: "/updateNotificationRule", httpMethod: "POST", input: input)
    }
}
