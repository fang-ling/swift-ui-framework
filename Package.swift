// swift-tools-version: 6.2

//
//  Package.swift
//  swift-ui-framework
//
//  Created by Fang Ling on 2025/12/28.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

import PackageDescription

let package = Package(
  name: "swift-ui-framework",
  platforms: [.macOS(.v10_15)],
  products: [
    .library(name: "SwiftUIFramework", targets: ["SwiftUIFramework"])
  ],
  dependencies: [
    .package(
      url: "https://github.com/fang-ling/foundation-framework",
      from: "3.0.0"
    )
  ],
  targets: [
    .target(
      name: "SwiftUIFramework",
      dependencies: [
        .product(name: "FoundationFramework", package: "foundation-framework")
      ]
    ),
    .testTarget(
      name: "SwiftUIFrameworkTests",
      dependencies: ["SwiftUIFramework"]
    )
  ]
)
