# aws-sdk-swift

AWS SDK for the Swift programming language.
This library doesn't depend on Objective-C Runtime, So you can use this with Linux.

[<img src="http://img.shields.io/badge/swift-5.0-brightgreen.svg" alt="Swift 5.0" />](https://swift.org)
[<img src="https://travis-ci.org/swift-aws/aws-sdk-swift.svg?branch=master">](https://travis-ci.org/swift-aws/aws-sdk-swift)


## Compatibility

AWSSDKSwift works on both Linux and Mac. Version 4 is dependent on swift-nio 2, this means certain libraries/frameworks that are dependent on an earlier version of swift-nio will not work with version 4 of AWSSDKSwift. Version 3 can be used if you need to use an earlier version of swift-nio. For instance Vapor 3 uses swift-nio 1.13 so you can only use versions 3.x of AWSSDKSwift with Vapor 3. Below is a compatibility table for versions 3 and 4 of AWSSDKSwift.

| Version | Swift   | MacOS | Linux              | Vapor |
|------|---------|-------|--------------------|-------|
| 3.x | 4.2 - 5.1 | ✓     | Ubuntu 14.04-18.04 | 3.0    |
| 4.x | 5.0 - 5.1 | ✓     | Ubuntu 14.04-18.04 | 4.0    |

## Documentation

Visit the `aws-sdk-swift` [documentation](https://swift-aws.github.io/aws-sdk-swift/index.html) for instructions and browsing api references.

## Installation

### Swift Package Manager

Package.swift

```swift
import PackageDescription

let package = Package(
    name: "MyAWSApp",
    dependencies: [
        .package(url: "https://github.com/swift-aws/aws-sdk-swift.git", from: "3.3.0")
    ],
    targets: [
      .target(
          name: "MyAWSApp",
          dependencies: ["S3", "SES", "CloudFront", "ELBV2", "IAM", "Kinesis"]),
      .testTarget(
          name: "MyAWSToolTests",
          dependencies: ["MyAWSApp"]),
    ]
)
```

## Contributing

All developers should feel welcome and encouraged to contribute to `aws-sdk-swift`.

As contributors and maintainers of this project, and in the interest of fostering an open and welcoming community, we pledge to respect all people who contribute through reporting issues, posting feature requests, updating documentation, submitting pull requests or patches, and other activities.

To contribute a feature or idea to `aws-sdk-swift`, submit an issue and fill in the template. If the request is approved, you or one of the members of the community can start working on it.

If you find a bug, please submit a pull request with a failing test case displaying the bug or create an issue.

If you find a security vulnerability, please contact <yuki@miketokyo.com> and reach out on the [**#aws** channel on the Vapor Discord](https://discordapp.com/channels/431917998102675485/472522745067077632) as soon as possible. We take these matters seriously.

## Configuring Credentials

Before using the SDK, ensure that you've configured credentials.

### Via EC2 Instance Profile

If you are running your code on an AWS EC2 instance, you [can setup an IAM role as the server's Instance Profile](https://docs.aws.amazon.com/codedeploy/latest/userguide/getting-started-create-iam-instance-profile.html) to automatically grant credentials via the metadata service.

There are no code changes or configurations to specify in the code, it will automatically pull and use them.

### Via ECS Container credentials

If you are running your code as an AWS ECS container task, you [can setup an IAM role for your container task](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task-iam-roles.html#create_task_iam_policy_and_role) to automatically grant credentials via the metadata service.

There are no code changes or configurations to specify in the code, it will automatically pull and use them.

### Load Credentials from shared credential file.

You can [set shared credentials in the home directory for the user running the app](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/create-shared-credentials-file.html)

in ~/.aws/credentials,

```
[default]
aws_access_key_id = YOUR_AWS_ACCESS_KEY_ID
aws_secret_access_key = YOUR_AWS_SECRET_ACCESS_KEY
```

### Load Credentials from Environment Variable

Alternatively, you can set the following environment variables:

```
AWS_ACCESS_KEY_ID=YOUR_AWS_ACCESS_KEY_ID
AWS_SECRET_ACCESS_KEY=YOUR_AWS_SECRET_ACCESS_KEY
```

### Pass the Credentials to the AWS Service struct directly

All of the AWS Services's initializers accept `accessKeyId` and `secretAccessKey`

```swift
let ec2 = EC2(
    accessKeyId: "YOUR_AWS_ACCESS_KEY_ID",
    secretAccessKey: "YOUR_AWS_SECRET_ACCESS_KEY"
)
```

## Using `aws-sdk-swift`

AWS Swift Modules can be imported into any swift project. Each module provides a struct that can be initialized, with instance methods to call aws services. See documentation for details on specific services.

The underlying aws-sdk-swift httpclient returns a [swift-nio EventLoopFuture object](https://apple.github.io/swift-nio/docs/current/NIO/Classes/EventLoopFuture.html). An EventLoopFuture _is not_ the response, but rather a container object that will be populated with the response sometime later. In this manner calls to AWS do not block the main thread.

However, operations that require inspection or use of the response require code to be written in a slightly different manner that equivalent synchronous logic. There are numerous references available online to aid in understanding this concept.

The recommended manner to interact with futures is chaining.

```swift
import S3 //ensure this module is specified as a dependency in your package.swift
import NIO

let bucket = "my-bucket"

let s3 = S3(
    accessKeyId: "Your-Access-Key",
    secretAccessKey: "Your-Secret-Key",
    region: .uswest2
)

// Create Bucket, Put an Object, Get the Object
let createBucketRequest = S3.CreateBucketRequest(bucket: bucket)

s3.createBucket(createBucketRequest).flatMap { response -> Future<S3.PutObjectOutput> in
    // Upload text file to the s3
    let bodyData = "hello world".data(using: .utf8)!
    let putObjectRequest = S3.PutObjectRequest(acl: .publicRead, bucket: bucket, contentLength: Int64(bodyData.count), body: bodyData, key: "hello.txt")
    return s3.putObject(putObjectRequest)
}.flatMap { response -> Future<S3.GetObjectOutput> in
    let getObjectRequest = S3.GetObjectRequest(bucket: bucket, key: "hello.txt")
    return s3.getObject(getObjectRequest)
}.whenSuccess { response in
    if let body = response.body {
        print(String(data: body, encoding: .utf8))
    }
}
```

Or you can use the nested method


```swift
import S3 //ensure this module is specified as a dependency in your package.swift

let bucket = "my-bucket"

let s3 = S3(
    accessKeyId: "Your-Access-Key",
    secretAccessKey: "Your-Secret-Key",
    region: .uswest1
)

// Create Bucket, Put an Object, Get the Object
let createBucketRequest = S3.CreateBucketRequest(bucket: bucket)

s3.createBucket(createBucketRequest).whenSuccess { response in
    let bodyData = "hello world".data(using: .utf8)!
    let putObjectRequest = S3.PutObjectRequest(acl: .publicRead, key: "hello.txt", body: bodyData, contentLength: Int64(bodyData.count), bucket: bucket)

    s3.putObject(putObjectRequest).whenSuccess { response in
        let getObjectRequest = S3.GetObjectRequest(bucket: bucket, key: "hello.txt")
        s3.getObject(getObjectRequest).whenSuccess { response in
            if let body = response.body {
                print(String(data: body, encoding: .utf8))
            }
        }
    }
}
```
## upgrading from <3.0.x

The simplest way to upgrade from an existing 1.0 or 2.0 implementation is to call `.wait()` on existing synchronous calls.

However it is recommend to rewrite your synchronous code to work with the returned future objects. It is no longer necessary to use a DispatchQueue.

## Using `aws-sdk-swift` with Vapor

Integration with vapor is pretty straight forward.

```swift
import Vapor
import HTTP
import SES

final class MyController {

     func sendUserEmailFromJSON(_ req: Request) throws -> Future<HTTPStatus> {

          return try req.content.decode(EmailData.self).map { emailData in
              return emailData
          }.flatMap(to: HTTPStatus.self) { emailData -> Future<HTTPStatus> in
              let client = SES(
                  accessKeyId: "Your-Access-Key",
                  secretAccessKey: "Your-Secret-Key",
                  region: .uswest1
              )

              let sendEmailRequest = SES.SendEmailRequest(
                  destination: emailData.address,
                  message: emailData.message
              )

              return client.sendEmail(sendEmailRequest)
                .hopTo(eventLoop: req.eventLoop)
                .map { response -> HTTPResponseStatus in
                  // print(response)
                  return HTTPStatus.ok
              }
          }
     }
}
```

## Using the `aws-sdk-swift` with the swift REPL (OS X)


```swift

$ brew install libressl
$ swift -I .build/debug -L/usr/local/Cellar/libressl/2.7.2/lib -lssl -lcrypto -I/usr/local/Cellar/libressl/2.7.2/include
1> import Foundation
2> import S3

let bucket = "my-bucket"

let s3 = S3(
    accessKeyId: "Your-Access-Key",
    secretAccessKey: "Your-Secret-Key",
    region: .uswest1
)

// Create Bucket, Put an Object, Get the Object
let createBucketRequest = S3.CreateBucketRequest(bucket: bucket)

s3.createBucket(createBucketRequest).whenSuccess { response in
    print(response)
}

```

## Speed Up Compilation

By specifying only those modules necessary for your application, only those modules will compile which makes for fast compilation.

If you want to create a module for your service, you can try using the module-exporter to build a separate repo for any of the modules.

## License
`aws-sdk-swift` is released under the [Apache License, Version 2.0](http://www.apache.org/licenses/LICENSE-2.0). See LICENSE for details.
