// THIS FILE IS AUTOMATICALLY GENERATED by https://github.com/swift-aws/aws-sdk-swift/blob/master/CodeGenerator/Sources/CodeGenerator/main.swift. DO NOT EDIT.

import Foundation
import AWSSDKSwiftCore

extension IoT1ClickDevicesService {

    public struct Attributes: AWSShape {
        
        public init() {
        }

        }

    public struct ClaimDevicesByClaimCodeRequest: AWSShape {
        public static var _members: [AWSShapeMember] = [
            AWSShapeMember(label: "ClaimCode", location: .uri(locationName: "claimCode"), required: true, type: .string)
        ]

        public let claimCode: String
        
        public init(claimCode: String) {
            self.claimCode = claimCode
        }

        private enum CodingKeys: String, CodingKey {
            case claimCode = "claimCode"
        }
    }

    public struct ClaimDevicesByClaimCodeResponse: AWSShape {
        public static var _members: [AWSShapeMember] = [
            AWSShapeMember(label: "ClaimCode", location: .body(locationName: "claimCode"), required: false, type: .string), 
            AWSShapeMember(label: "Total", location: .body(locationName: "total"), required: false, type: .integer)
        ]

        /// The claim code provided by the device manufacturer.
        public let claimCode: String?
        /// The total number of devices associated with the claim code that has been processed in
        ///  the claim request.
        public let total: Int32?
        
        public init(claimCode: String? = nil, total: Int32? = nil) {
            self.claimCode = claimCode
            self.total = total
        }

        public func validate() throws {
            try validate(claimCode, name:"claimCode", max: 40)
            try validate(claimCode, name:"claimCode", min: 12)
        }

        private enum CodingKeys: String, CodingKey {
            case claimCode = "claimCode"
            case total = "total"
        }
    }

    public struct DescribeDeviceRequest: AWSShape {
        public static var _members: [AWSShapeMember] = [
            AWSShapeMember(label: "DeviceId", location: .uri(locationName: "deviceId"), required: true, type: .string)
        ]

        public let deviceId: String
        
        public init(deviceId: String) {
            self.deviceId = deviceId
        }

        private enum CodingKeys: String, CodingKey {
            case deviceId = "deviceId"
        }
    }

    public struct DescribeDeviceResponse: AWSShape {
        public static var _members: [AWSShapeMember] = [
            AWSShapeMember(label: "DeviceDescription", location: .body(locationName: "deviceDescription"), required: false, type: .structure)
        ]

        /// Device details.
        public let deviceDescription: DeviceDescription?
        
        public init(deviceDescription: DeviceDescription? = nil) {
            self.deviceDescription = deviceDescription
        }

        private enum CodingKeys: String, CodingKey {
            case deviceDescription = "deviceDescription"
        }
    }

    public struct Device: AWSShape {
        public static var _members: [AWSShapeMember] = [
            AWSShapeMember(label: "Attributes", location: .body(locationName: "attributes"), required: false, type: .structure), 
            AWSShapeMember(label: "DeviceId", location: .body(locationName: "deviceId"), required: false, type: .string), 
            AWSShapeMember(label: "Type", location: .body(locationName: "type"), required: false, type: .string)
        ]

        /// The user specified attributes associated with the device for an event.
        public let attributes: Attributes?
        /// The unique identifier of the device.
        public let deviceId: String?
        /// The device type, such as "button".
        public let `type`: String?
        
        public init(attributes: Attributes? = nil, deviceId: String? = nil, type: String? = nil) {
            self.attributes = attributes
            self.deviceId = deviceId
            self.`type` = `type`
        }

        private enum CodingKeys: String, CodingKey {
            case attributes = "attributes"
            case deviceId = "deviceId"
            case `type` = "type"
        }
    }

    public struct DeviceClaimResponse: AWSShape {
        public static var _members: [AWSShapeMember] = [
            AWSShapeMember(label: "State", location: .body(locationName: "state"), required: false, type: .string)
        ]

        /// The device's final claim state.
        public let state: String?
        
        public init(state: String? = nil) {
            self.state = state
        }

        private enum CodingKeys: String, CodingKey {
            case state = "state"
        }
    }

    public struct DeviceDescription: AWSShape {
        public static var _members: [AWSShapeMember] = [
            AWSShapeMember(label: "Arn", location: .body(locationName: "arn"), required: false, type: .string), 
            AWSShapeMember(label: "Attributes", location: .body(locationName: "attributes"), required: false, type: .map), 
            AWSShapeMember(label: "DeviceId", location: .body(locationName: "deviceId"), required: false, type: .string), 
            AWSShapeMember(label: "Enabled", location: .body(locationName: "enabled"), required: false, type: .boolean), 
            AWSShapeMember(label: "RemainingLife", location: .body(locationName: "remainingLife"), required: false, type: .double), 
            AWSShapeMember(label: "Tags", location: .body(locationName: "tags"), required: false, type: .map), 
            AWSShapeMember(label: "Type", location: .body(locationName: "type"), required: false, type: .string)
        ]

        /// The ARN of the device.
        public let arn: String?
        /// An array of zero or more elements of DeviceAttribute objects providing
        ///  user specified device attributes.
        public let attributes: [String: String]?
        /// The unique identifier of the device.
        public let deviceId: String?
        /// A Boolean value indicating whether or not the device is enabled.
        public let enabled: Bool?
        /// A value between 0 and 1 inclusive, representing the fraction of life remaining for the
        ///  device.
        public let remainingLife: Double?
        public let tags: [String: String]?
        /// The type of the device, such as "button".
        public let `type`: String?
        
        public init(arn: String? = nil, attributes: [String: String]? = nil, deviceId: String? = nil, enabled: Bool? = nil, remainingLife: Double? = nil, tags: [String: String]? = nil, type: String? = nil) {
            self.arn = arn
            self.attributes = attributes
            self.deviceId = deviceId
            self.enabled = enabled
            self.remainingLife = remainingLife
            self.tags = tags
            self.`type` = `type`
        }

        private enum CodingKeys: String, CodingKey {
            case arn = "arn"
            case attributes = "attributes"
            case deviceId = "deviceId"
            case enabled = "enabled"
            case remainingLife = "remainingLife"
            case tags = "tags"
            case `type` = "type"
        }
    }

    public struct DeviceEvent: AWSShape {
        public static var _members: [AWSShapeMember] = [
            AWSShapeMember(label: "Device", location: .body(locationName: "device"), required: false, type: .structure), 
            AWSShapeMember(label: "StdEvent", location: .body(locationName: "stdEvent"), required: false, type: .string)
        ]

        /// An object representing the device associated with the event.
        public let device: Device?
        /// A serialized JSON object representing the device-type specific event.
        public let stdEvent: String?
        
        public init(device: Device? = nil, stdEvent: String? = nil) {
            self.device = device
            self.stdEvent = stdEvent
        }

        private enum CodingKeys: String, CodingKey {
            case device = "device"
            case stdEvent = "stdEvent"
        }
    }

    public struct DeviceEventsResponse: AWSShape {
        public static var _members: [AWSShapeMember] = [
            AWSShapeMember(label: "Events", location: .body(locationName: "events"), required: false, type: .list), 
            AWSShapeMember(label: "NextToken", location: .body(locationName: "nextToken"), required: false, type: .string)
        ]

        /// An array of zero or more elements describing the event(s) associated with the
        ///  device.
        public let events: [DeviceEvent]?
        /// The token to retrieve the next set of results.
        public let nextToken: String?
        
        public init(events: [DeviceEvent]? = nil, nextToken: String? = nil) {
            self.events = events
            self.nextToken = nextToken
        }

        private enum CodingKeys: String, CodingKey {
            case events = "events"
            case nextToken = "nextToken"
        }
    }

    public struct DeviceMethod: AWSShape {
        public static var _members: [AWSShapeMember] = [
            AWSShapeMember(label: "DeviceType", location: .body(locationName: "deviceType"), required: false, type: .string), 
            AWSShapeMember(label: "MethodName", location: .body(locationName: "methodName"), required: false, type: .string)
        ]

        /// The type of the device, such as "button".
        public let deviceType: String?
        /// The name of the method applicable to the deviceType.
        public let methodName: String?
        
        public init(deviceType: String? = nil, methodName: String? = nil) {
            self.deviceType = deviceType
            self.methodName = methodName
        }

        private enum CodingKeys: String, CodingKey {
            case deviceType = "deviceType"
            case methodName = "methodName"
        }
    }

    public struct Empty: AWSShape {
        
        public init() {
        }

        }

    public struct FinalizeDeviceClaimRequest: AWSShape {
        public static var _members: [AWSShapeMember] = [
            AWSShapeMember(label: "DeviceId", location: .uri(locationName: "deviceId"), required: true, type: .string), 
            AWSShapeMember(label: "Tags", location: .body(locationName: "tags"), required: false, type: .map)
        ]

        public let deviceId: String
        public let tags: [String: String]?
        
        public init(deviceId: String, tags: [String: String]? = nil) {
            self.deviceId = deviceId
            self.tags = tags
        }

        private enum CodingKeys: String, CodingKey {
            case deviceId = "deviceId"
            case tags = "tags"
        }
    }

    public struct FinalizeDeviceClaimResponse: AWSShape {
        public static var _members: [AWSShapeMember] = [
            AWSShapeMember(label: "State", location: .body(locationName: "state"), required: false, type: .string)
        ]

        public let state: String?
        
        public init(state: String? = nil) {
            self.state = state
        }

        private enum CodingKeys: String, CodingKey {
            case state = "state"
        }
    }

    public struct GetDeviceMethodsRequest: AWSShape {
        public static var _members: [AWSShapeMember] = [
            AWSShapeMember(label: "DeviceId", location: .uri(locationName: "deviceId"), required: true, type: .string)
        ]

        public let deviceId: String
        
        public init(deviceId: String) {
            self.deviceId = deviceId
        }

        private enum CodingKeys: String, CodingKey {
            case deviceId = "deviceId"
        }
    }

    public struct GetDeviceMethodsResponse: AWSShape {
        public static var _members: [AWSShapeMember] = [
            AWSShapeMember(label: "DeviceMethods", location: .body(locationName: "deviceMethods"), required: false, type: .list)
        ]

        /// List of available device APIs.
        public let deviceMethods: [DeviceMethod]?
        
        public init(deviceMethods: [DeviceMethod]? = nil) {
            self.deviceMethods = deviceMethods
        }

        private enum CodingKeys: String, CodingKey {
            case deviceMethods = "deviceMethods"
        }
    }

    public struct InitiateDeviceClaimRequest: AWSShape {
        public static var _members: [AWSShapeMember] = [
            AWSShapeMember(label: "DeviceId", location: .uri(locationName: "deviceId"), required: true, type: .string)
        ]

        public let deviceId: String
        
        public init(deviceId: String) {
            self.deviceId = deviceId
        }

        private enum CodingKeys: String, CodingKey {
            case deviceId = "deviceId"
        }
    }

    public struct InitiateDeviceClaimResponse: AWSShape {
        public static var _members: [AWSShapeMember] = [
            AWSShapeMember(label: "State", location: .body(locationName: "state"), required: false, type: .string)
        ]

        public let state: String?
        
        public init(state: String? = nil) {
            self.state = state
        }

        private enum CodingKeys: String, CodingKey {
            case state = "state"
        }
    }

    public struct InvokeDeviceMethodRequest: AWSShape {
        public static var _members: [AWSShapeMember] = [
            AWSShapeMember(label: "DeviceId", location: .uri(locationName: "deviceId"), required: true, type: .string), 
            AWSShapeMember(label: "DeviceMethod", location: .body(locationName: "deviceMethod"), required: false, type: .structure), 
            AWSShapeMember(label: "DeviceMethodParameters", location: .body(locationName: "deviceMethodParameters"), required: false, type: .string)
        ]

        public let deviceId: String
        /// The device method to invoke.
        public let deviceMethod: DeviceMethod?
        /// A JSON encoded string containing the device method request parameters.
        public let deviceMethodParameters: String?
        
        public init(deviceId: String, deviceMethod: DeviceMethod? = nil, deviceMethodParameters: String? = nil) {
            self.deviceId = deviceId
            self.deviceMethod = deviceMethod
            self.deviceMethodParameters = deviceMethodParameters
        }

        private enum CodingKeys: String, CodingKey {
            case deviceId = "deviceId"
            case deviceMethod = "deviceMethod"
            case deviceMethodParameters = "deviceMethodParameters"
        }
    }

    public struct InvokeDeviceMethodResponse: AWSShape {
        public static var _members: [AWSShapeMember] = [
            AWSShapeMember(label: "DeviceMethodResponse", location: .body(locationName: "deviceMethodResponse"), required: false, type: .string)
        ]

        /// A JSON encoded string containing the device method response.
        public let deviceMethodResponse: String?
        
        public init(deviceMethodResponse: String? = nil) {
            self.deviceMethodResponse = deviceMethodResponse
        }

        private enum CodingKeys: String, CodingKey {
            case deviceMethodResponse = "deviceMethodResponse"
        }
    }

    public struct ListDeviceEventsRequest: AWSShape {
        public static var _members: [AWSShapeMember] = [
            AWSShapeMember(label: "DeviceId", location: .uri(locationName: "deviceId"), required: true, type: .string), 
            AWSShapeMember(label: "FromTimeStamp", location: .querystring(locationName: "fromTimeStamp"), required: true, type: .timestamp), 
            AWSShapeMember(label: "MaxResults", location: .querystring(locationName: "maxResults"), required: false, type: .integer), 
            AWSShapeMember(label: "NextToken", location: .querystring(locationName: "nextToken"), required: false, type: .string), 
            AWSShapeMember(label: "ToTimeStamp", location: .querystring(locationName: "toTimeStamp"), required: true, type: .timestamp)
        ]

        public let deviceId: String
        public let fromTimeStamp: TimeStamp
        public let maxResults: Int32?
        public let nextToken: String?
        public let toTimeStamp: TimeStamp
        
        public init(deviceId: String, fromTimeStamp: TimeStamp, maxResults: Int32? = nil, nextToken: String? = nil, toTimeStamp: TimeStamp) {
            self.deviceId = deviceId
            self.fromTimeStamp = fromTimeStamp
            self.maxResults = maxResults
            self.nextToken = nextToken
            self.toTimeStamp = toTimeStamp
        }

        public func validate() throws {
            try validate(maxResults, name:"maxResults", max: 250)
            try validate(maxResults, name:"maxResults", min: 1)
        }

        private enum CodingKeys: String, CodingKey {
            case deviceId = "deviceId"
            case fromTimeStamp = "fromTimeStamp"
            case maxResults = "maxResults"
            case nextToken = "nextToken"
            case toTimeStamp = "toTimeStamp"
        }
    }

    public struct ListDeviceEventsResponse: AWSShape {
        public static var _members: [AWSShapeMember] = [
            AWSShapeMember(label: "Events", location: .body(locationName: "events"), required: false, type: .list), 
            AWSShapeMember(label: "NextToken", location: .body(locationName: "nextToken"), required: false, type: .string)
        ]

        public let events: [DeviceEvent]?
        public let nextToken: String?
        
        public init(events: [DeviceEvent]? = nil, nextToken: String? = nil) {
            self.events = events
            self.nextToken = nextToken
        }

        private enum CodingKeys: String, CodingKey {
            case events = "events"
            case nextToken = "nextToken"
        }
    }

    public struct ListDevicesRequest: AWSShape {
        public static var _members: [AWSShapeMember] = [
            AWSShapeMember(label: "DeviceType", location: .querystring(locationName: "deviceType"), required: false, type: .string), 
            AWSShapeMember(label: "MaxResults", location: .querystring(locationName: "maxResults"), required: false, type: .integer), 
            AWSShapeMember(label: "NextToken", location: .querystring(locationName: "nextToken"), required: false, type: .string)
        ]

        public let deviceType: String?
        public let maxResults: Int32?
        public let nextToken: String?
        
        public init(deviceType: String? = nil, maxResults: Int32? = nil, nextToken: String? = nil) {
            self.deviceType = deviceType
            self.maxResults = maxResults
            self.nextToken = nextToken
        }

        public func validate() throws {
            try validate(maxResults, name:"maxResults", max: 250)
            try validate(maxResults, name:"maxResults", min: 1)
        }

        private enum CodingKeys: String, CodingKey {
            case deviceType = "deviceType"
            case maxResults = "maxResults"
            case nextToken = "nextToken"
        }
    }

    public struct ListDevicesResponse: AWSShape {
        public static var _members: [AWSShapeMember] = [
            AWSShapeMember(label: "Devices", location: .body(locationName: "devices"), required: false, type: .list), 
            AWSShapeMember(label: "NextToken", location: .body(locationName: "nextToken"), required: false, type: .string)
        ]

        /// A list of devices.
        public let devices: [DeviceDescription]?
        /// The token to retrieve the next set of results.
        public let nextToken: String?
        
        public init(devices: [DeviceDescription]? = nil, nextToken: String? = nil) {
            self.devices = devices
            self.nextToken = nextToken
        }

        private enum CodingKeys: String, CodingKey {
            case devices = "devices"
            case nextToken = "nextToken"
        }
    }

    public struct ListTagsForResourceRequest: AWSShape {
        public static var _members: [AWSShapeMember] = [
            AWSShapeMember(label: "ResourceArn", location: .uri(locationName: "resource-arn"), required: true, type: .string)
        ]

        public let resourceArn: String
        
        public init(resourceArn: String) {
            self.resourceArn = resourceArn
        }

        private enum CodingKeys: String, CodingKey {
            case resourceArn = "resource-arn"
        }
    }

    public struct ListTagsForResourceResponse: AWSShape {
        public static var _members: [AWSShapeMember] = [
            AWSShapeMember(label: "Tags", location: .body(locationName: "tags"), required: false, type: .map)
        ]

        public let tags: [String: String]?
        
        public init(tags: [String: String]? = nil) {
            self.tags = tags
        }

        private enum CodingKeys: String, CodingKey {
            case tags = "tags"
        }
    }

    public struct TagResourceRequest: AWSShape {
        public static var _members: [AWSShapeMember] = [
            AWSShapeMember(label: "ResourceArn", location: .uri(locationName: "resource-arn"), required: true, type: .string), 
            AWSShapeMember(label: "Tags", location: .body(locationName: "tags"), required: true, type: .map)
        ]

        public let resourceArn: String
        public let tags: [String: String]
        
        public init(resourceArn: String, tags: [String: String]) {
            self.resourceArn = resourceArn
            self.tags = tags
        }

        private enum CodingKeys: String, CodingKey {
            case resourceArn = "resource-arn"
            case tags = "tags"
        }
    }

    public struct UnclaimDeviceRequest: AWSShape {
        public static var _members: [AWSShapeMember] = [
            AWSShapeMember(label: "DeviceId", location: .uri(locationName: "deviceId"), required: true, type: .string)
        ]

        public let deviceId: String
        
        public init(deviceId: String) {
            self.deviceId = deviceId
        }

        private enum CodingKeys: String, CodingKey {
            case deviceId = "deviceId"
        }
    }

    public struct UnclaimDeviceResponse: AWSShape {
        public static var _members: [AWSShapeMember] = [
            AWSShapeMember(label: "State", location: .body(locationName: "state"), required: false, type: .string)
        ]

        public let state: String?
        
        public init(state: String? = nil) {
            self.state = state
        }

        private enum CodingKeys: String, CodingKey {
            case state = "state"
        }
    }

    public struct UntagResourceRequest: AWSShape {
        public static var _members: [AWSShapeMember] = [
            AWSShapeMember(label: "ResourceArn", location: .uri(locationName: "resource-arn"), required: true, type: .string), 
            AWSShapeMember(label: "TagKeys", location: .querystring(locationName: "tagKeys"), required: true, type: .list)
        ]

        public let resourceArn: String
        public let tagKeys: [String]
        
        public init(resourceArn: String, tagKeys: [String]) {
            self.resourceArn = resourceArn
            self.tagKeys = tagKeys
        }

        private enum CodingKeys: String, CodingKey {
            case resourceArn = "resource-arn"
            case tagKeys = "tagKeys"
        }
    }

    public struct UpdateDeviceStateRequest: AWSShape {
        public static var _members: [AWSShapeMember] = [
            AWSShapeMember(label: "DeviceId", location: .uri(locationName: "deviceId"), required: true, type: .string), 
            AWSShapeMember(label: "Enabled", location: .body(locationName: "enabled"), required: false, type: .boolean)
        ]

        public let deviceId: String
        /// If true, the device is enabled. If false, the device is
        ///  disabled.
        public let enabled: Bool?
        
        public init(deviceId: String, enabled: Bool? = nil) {
            self.deviceId = deviceId
            self.enabled = enabled
        }

        private enum CodingKeys: String, CodingKey {
            case deviceId = "deviceId"
            case enabled = "enabled"
        }
    }

    public struct UpdateDeviceStateResponse: AWSShape {
        
        public init() {
        }

        }

}
