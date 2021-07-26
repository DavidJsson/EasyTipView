//
//  OverlayShape.swift
//  EasyTipView
//
//  Created by David Johansson on 2021-07-22.
//

import UIKit

public enum Shape {
  case rect(rectMargin: CGFloat = 0)
  case circle(circleMargin: CGFloat = 4, circleRadius: CGFloat? = nil)
}

protocol OverlayShape {
  var path: CGMutablePath { get }
  
  func addShape(viewFrame: CGRect)
  
}

class OverlayRect: OverlayShape {
  var path: CGMutablePath
  
  var rectMargin: CGFloat
  
  init(rectMargin: CGFloat = 0) {
    path = CGMutablePath()
    self.rectMargin = rectMargin
  }
  
  func addShape(viewFrame: CGRect) {
    path.addRect(
      CGRect(x: viewFrame.x - rectMargin,
             y: viewFrame.y - rectMargin,
             width: viewFrame.width + rectMargin*2,
             height: viewFrame.height + rectMargin*2
      )
    )
  }
  
}

class OverlayCircle: OverlayShape {
  var path: CGMutablePath
  /// The default margin of the highlighting circle to the frame of `viewToHighlight.
  /// This property only takes effect if `circleRadius` is nil.
  var circleMargin: CGFloat
  
  /// The radius of the highlighting circle.
  /// If this property has a non-nil value the `circleMargin` property is ignored.
  var circleRadius: CGFloat?
  
  init(circleMargin: CGFloat = 4, circleRadius: CGFloat? = nil) {
    path = CGMutablePath()
    self.circleMargin = circleMargin
    self.circleRadius = circleRadius
  }
  
  func addShape(viewFrame: CGRect) {
    // for the radius of the circle either take the provided `circleRadius` value
    // or compute a radius so the circle has `circleMargin` distance from the corner of the view
    let width = viewFrame.width / 2
    let height = viewFrame.height / 2
    let distanceToEdge = ((width * width) + (height * height)).squareRoot()
    let radius = circleRadius ?? distanceToEdge + circleMargin
    
    path.addArc(center: viewFrame.center,
                radius: radius,
                startAngle: 0,
                endAngle: 2 * CGFloat.pi,
                clockwise: true)
  }
  
}
