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
Amazon CloudWatch monitors your Amazon Web Services (AWS) resources and the applications you run on AWS in real-time. You can use CloudWatch to collect and track metrics, which are the variables you want to measure for your resources and applications. CloudWatch alarms send notifications or automatically make changes to the resources you are monitoring based on rules that you define. For example, you can monitor the CPU usage and disk reads and writes of your Amazon Elastic Compute Cloud (Amazon EC2) instances and then use this data to determine whether you should launch additional instances to handle increased load. You can also use this data to stop under-used instances to save money. In addition to monitoring the built-in metrics that come with AWS, you can monitor your own custom metrics. With CloudWatch, you gain system-wide visibility into resource utilization, application performance, and operational health.
*/
public struct Monitoring {

    let client: AWSClient

    public init(accessKeyId: String? = nil, secretAccessKey: String? = nil, region: Core.Region? = nil, endpoint: String? = nil, middlewares: [AWSRequestMiddleware] = []) {
        self.client = AWSClient(
            accessKeyId: accessKeyId,
            secretAccessKey: secretAccessKey,
            region: region,
            service: "monitoring",
            serviceProtocol: .query,
            apiVersion: "2010-08-01",
            endpoint: endpoint,
            middlewares: [],
            possibleErrorTypes: [MonitoringError.self]
        )
    }

    ///  Retrieves the specified alarms. If no alarms are specified, all alarms are returned. Alarms can be retrieved by using only a prefix for the alarm name, the alarm state, or a prefix for any action.
    public func describeAlarms(_ input: DescribeAlarmsInput) throws -> DescribeAlarmsOutput {
        return try client.send(operation: "DescribeAlarms", path: "/", httpMethod: "POST", input: input)
    }

    ///  Creates or updates an alarm and associates it with the specified metric. Optionally, this operation can associate one or more Amazon SNS resources with the alarm. When this operation creates an alarm, the alarm state is immediately set to INSUFFICIENT_DATA. The alarm is evaluated and its state is set appropriately. Any actions associated with the state are then executed. When you update an existing alarm, its state is left unchanged, but the update completely overwrites the previous configuration of the alarm. If you are an AWS Identity and Access Management (IAM) user, you must have Amazon EC2 permissions for some operations:    ec2:DescribeInstanceStatus and ec2:DescribeInstances for all alarms on EC2 instance status metrics    ec2:StopInstances for alarms with stop actions    ec2:TerminateInstances for alarms with terminate actions    ec2:DescribeInstanceRecoveryAttribute and ec2:RecoverInstances for alarms with recover actions   If you have read/write permissions for Amazon CloudWatch but not for Amazon EC2, you can still create an alarm, but the stop or terminate actions won't be performed. However, if you are later granted the required permissions, the alarm actions that you created earlier will be performed. If you are using an IAM role (for example, an Amazon EC2 instance profile), you cannot stop or terminate the instance using alarm actions. However, you can still see the alarm state and perform any other actions such as Amazon SNS notifications or Auto Scaling policies. If you are using temporary security credentials granted using the AWS Security Token Service (AWS STS), you cannot stop or terminate an Amazon EC2 instance using alarm actions. Note that you must create at least one stop, terminate, or reboot alarm using the Amazon EC2 or CloudWatch console to create the EC2ActionsAccess IAM role. After this IAM role is created, you can create stop, terminate, or reboot alarms using a command-line interface or an API.
    public func putMetricAlarm(_ input: PutMetricAlarmInput) throws {
        _ = try client.send(operation: "PutMetricAlarm", path: "/", httpMethod: "POST", input: input)
    }

    ///  Retrieves the alarms for the specified metric. Specify a statistic, period, or unit to filter the results.
    public func describeAlarmsForMetric(_ input: DescribeAlarmsForMetricInput) throws -> DescribeAlarmsForMetricOutput {
        return try client.send(operation: "DescribeAlarmsForMetric", path: "/", httpMethod: "POST", input: input)
    }

    ///  List the specified metrics. You can use the returned metrics with GetMetricStatistics to obtain statistical data. Up to 500 results are returned for any one call. To retrieve additional results, use the returned token with subsequent calls. After you create a metric, allow up to fifteen minutes before the metric appears. Statistics about the metric, however, are available sooner using GetMetricStatistics.
    public func listMetrics(_ input: ListMetricsInput) throws -> ListMetricsOutput {
        return try client.send(operation: "ListMetrics", path: "/", httpMethod: "POST", input: input)
    }

    ///  Deletes the specified alarms. In the event of an error, no alarms are deleted.
    public func deleteAlarms(_ input: DeleteAlarmsInput) throws {
        _ = try client.send(operation: "DeleteAlarms", path: "/", httpMethod: "POST", input: input)
    }

    ///  Publishes metric data points to Amazon CloudWatch. Amazon CloudWatch associates the data points with the specified metric. If the specified metric does not exist, Amazon CloudWatch creates the metric. When Amazon CloudWatch creates a metric, it can take up to fifteen minutes for the metric to appear in calls to ListMetrics. Each PutMetricData request is limited to 8 KB in size for HTTP GET requests and is limited to 40 KB in size for HTTP POST requests. Although the Value parameter accepts numbers of type Double, Amazon CloudWatch rejects values that are either too small or too large. Values must be in the range of 8.515920e-109 to 1.174271e+108 (Base 10) or 2e-360 to 2e360 (Base 2). In addition, special values (e.g., NaN, +Infinity, -Infinity) are not supported. Data points with time stamps from 24 hours ago or longer can take at least 48 hours to become available for GetMetricStatistics from the time they are submitted.
    public func putMetricData(_ input: PutMetricDataInput) throws {
        _ = try client.send(operation: "PutMetricData", path: "/", httpMethod: "POST", input: input)
    }

    ///  Enables the actions for the specified alarms.
    public func enableAlarmActions(_ input: EnableAlarmActionsInput) throws {
        _ = try client.send(operation: "EnableAlarmActions", path: "/", httpMethod: "POST", input: input)
    }

    ///  Temporarily sets the state of an alarm for testing purposes. When the updated state differs from the previous value, the action configured for the appropriate state is invoked. For example, if your alarm is configured to send an Amazon SNS message when an alarm is triggered, temporarily changing the alarm state to ALARM sends an Amazon SNS message. The alarm returns to its actual state (often within seconds). Because the alarm state change happens very quickly, it is typically only visible in the alarm's History tab in the Amazon CloudWatch console or through DescribeAlarmHistory.
    public func setAlarmState(_ input: SetAlarmStateInput) throws {
        _ = try client.send(operation: "SetAlarmState", path: "/", httpMethod: "POST", input: input)
    }

    ///  Disables the actions for the specified alarms. When an alarm's actions are disabled, the alarm actions do not execute when the alarm state changes.
    public func disableAlarmActions(_ input: DisableAlarmActionsInput) throws {
        _ = try client.send(operation: "DisableAlarmActions", path: "/", httpMethod: "POST", input: input)
    }

    ///  Retrieves the history for the specified alarm. You can filter the results by date range or item type. If an alarm name is not specified, the histories for all alarms are returned. Note that Amazon CloudWatch retains the history of an alarm even if you delete the alarm.
    public func describeAlarmHistory(_ input: DescribeAlarmHistoryInput) throws -> DescribeAlarmHistoryOutput {
        return try client.send(operation: "DescribeAlarmHistory", path: "/", httpMethod: "POST", input: input)
    }

    ///  Gets statistics for the specified metric. Amazon CloudWatch retains metric data as follows:   Data points with a period of 60 seconds (1 minute) are available for 15 days   Data points with a period of 300 seconds (5 minute) are available for 63 days   Data points with a period of 3600 seconds (1 hour) are available for 455 days (15 months)   Note that CloudWatch started retaining 5-minute and 1-hour metric data as of 9 July 2016. The maximum number of data points returned from a single call is 1,440. If you request more than 1,440 data points, Amazon CloudWatch returns an error. To reduce the number of data points, you can narrow the specified time range and make multiple requests across adjacent time ranges, or you can increase the specified period. A period can be as short as one minute (60 seconds). Note that data points are not returned in chronological order. Amazon CloudWatch aggregates data points based on the length of the period that you specify. For example, if you request statistics with a one-hour period, Amazon CloudWatch aggregates all data points with time stamps that fall within each one-hour period. Therefore, the number of values aggregated by CloudWatch is larger than the number of data points returned. For a list of metrics and dimensions supported by AWS services, see the Amazon CloudWatch Metrics and Dimensions Reference in the Amazon CloudWatch User Guide.
    public func getMetricStatistics(_ input: GetMetricStatisticsInput) throws -> GetMetricStatisticsOutput {
        return try client.send(operation: "GetMetricStatistics", path: "/", httpMethod: "POST", input: input)
    }


}