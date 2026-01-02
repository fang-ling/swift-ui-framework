//
//  LinearGradientTests.swift
//  swift-ui-framework
//
//  Created by Fang Ling on 2026/1/2.
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

import FoundationFramework
import SwiftUI
@testable import SwiftUIFramework
import Testing

@Suite("LinearGradientTests")
struct LinearGradientTests {
  @Test func testZeroDegrees() {
    var points = LinearGradient.convertAngleToPoints(angle: 0, size: (100, 100))
    #expect(FloatingPoint64(points.0.x).checkEquality(to: 0.5, tolerance: 1e-6))
    #expect(FloatingPoint64(points.0.y).checkEquality(to: 1.0, tolerance: 1e-6))
    #expect(FloatingPoint64(points.1.x).checkEquality(to: 0.5, tolerance: 1e-6))
    #expect(FloatingPoint64(points.1.y).checkEquality(to: 0.0, tolerance: 1e-6))

    points = LinearGradient.convertAngleToPoints(angle: 0, size: (200, 100))
    #expect(FloatingPoint64(points.0.x).checkEquality(to: 0.5, tolerance: 1e-6))
    #expect(FloatingPoint64(points.0.y).checkEquality(to: 1.0, tolerance: 1e-6))
    #expect(FloatingPoint64(points.1.x).checkEquality(to: 0.5, tolerance: 1e-6))
    #expect(FloatingPoint64(points.1.y).checkEquality(to: 0.0, tolerance: 1e-6))

    points = LinearGradient.convertAngleToPoints(angle: 0, size: (100, 200))
    #expect(FloatingPoint64(points.0.x).checkEquality(to: 0.5, tolerance: 1e-6))
    #expect(FloatingPoint64(points.0.y).checkEquality(to: 1.0, tolerance: 1e-6))
    #expect(FloatingPoint64(points.1.x).checkEquality(to: 0.5, tolerance: 1e-6))
    #expect(FloatingPoint64(points.1.y).checkEquality(to: 0.0, tolerance: 1e-6))
  }

  @Test func testNinetyDegrees() {
    var points = LinearGradient.convertAngleToPoints(angle: 90, size: (10, 10))
    #expect(FloatingPoint64(points.0.x).checkEquality(to: 0.0, tolerance: 1e-6))
    #expect(FloatingPoint64(points.0.y).checkEquality(to: 0.5, tolerance: 1e-6))
    #expect(FloatingPoint64(points.1.x).checkEquality(to: 1.0, tolerance: 1e-6))
    #expect(FloatingPoint64(points.1.y).checkEquality(to: 0.5, tolerance: 1e-6))

    points = LinearGradient.convertAngleToPoints(angle: 90, size: (20, 10))
    #expect(FloatingPoint64(points.0.x).checkEquality(to: 0.0, tolerance: 1e-6))
    #expect(FloatingPoint64(points.0.y).checkEquality(to: 0.5, tolerance: 1e-6))
    #expect(FloatingPoint64(points.1.x).checkEquality(to: 1.0, tolerance: 1e-6))
    #expect(FloatingPoint64(points.1.y).checkEquality(to: 0.5, tolerance: 1e-6))

    points = LinearGradient.convertAngleToPoints(angle: 90, size: (10, 20))
    #expect(FloatingPoint64(points.0.x).checkEquality(to: 0.0, tolerance: 1e-6))
    #expect(FloatingPoint64(points.0.y).checkEquality(to: 0.5, tolerance: 1e-6))
    #expect(FloatingPoint64(points.1.x).checkEquality(to: 1.0, tolerance: 1e-6))
    #expect(FloatingPoint64(points.1.y).checkEquality(to: 0.5, tolerance: 1e-6))
  }
}
