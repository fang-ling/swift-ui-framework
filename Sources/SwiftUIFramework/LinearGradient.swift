//
//  LinearGradient.swift
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

import FoundationFramework
import SwiftUI

extension LinearGradient {
  /// Creates a linear gradient from a collection of color stops at a specified
  /// angle, adjusted for the container's dimensions.
  ///
  /// - Parameters:
  ///   - stops: Array of color stops for the gradient.
  ///   - angle: Angle in degrees.
  ///   - size: The width and height of the container.
  public init(
    stops: [Gradient.Stop],
    angle: FloatingPoint64,
    size: (width: FloatingPoint64, height: FloatingPoint64)
  ) {
    let points = Self.convertAngleToPoints(angle: angle, size: size)

    self.init(stops: stops, startPoint: points.0, endPoint: points.1)
  }

  static func convertAngleToPoints(
    angle: FloatingPoint64,
    size: (width: FloatingPoint64, height: FloatingPoint64)
  ) -> (UnitPoint, UnitPoint) {
    // Normalize angle to radians: CSS 0° is North, rotating clockwise.
    let radians = angle * .π / 180

    let dx = radians.calculateSine()
    let dy = -radians.calculateCosine()

    // CSS 'Magic' length formula to ensure colors reach the corners correctly
    let length = (size.width * radians.calculateSine()).makeAbsolute() +
                 (size.height * radians.calculateCosine()).makeAbsolute()

    // Convert to UnitPoint space (0.0 to 1.0)
    // We divide the projected vector by the dimension to normalize it
    let xOffset = (dx * length / size.width) / 2
    let yOffset = (dy * length / size.height) / 2

    return (
      start: UnitPoint(x: 0.5 - xOffset, y: 0.5 - yOffset),
      end: UnitPoint(x: 0.5 + xOffset, y: 0.5 + yOffset)
    )
  }
}
