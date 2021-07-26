//
//  HighlightFeature.swift
//  EasyTipView
//
//  Created by David Johansson on 2021-07-23.
//  Copyright © 2021 teodorpatras. All rights reserved.
//

import UIKit

// MARK: - HighlightFeature class implementation -

open class HighlightFeature {
  
  public enum HighlightAlignment {
    case any
    case top
    case bottom
    case right
    case left
    
    static let allValues = [top, bottom, right, left]
  }
  
  public enum HighlightBackground {
    case gradient(gradient: CGGradient, direction: GradientDirection)
    case solid(_ color: UIColor)
  }
  
  public enum GradientDirection {
    case leftRight
    case topBottom
  }
  public struct HighlightPreferences {
    public struct HighlightOverlay {
      public var overlayIsVisible                = true
      public var overlayShape                    = Shape.rect(rectMargin: 0)
      public var overlayColor                    = UIColor.black.withAlphaComponent(0.6)
      public var shouldDismissOnOverlayTap       = false
      public var shouldPassEventToHighlightView  = false
    }
    
    public struct HighlightData {
      public var title                           = ""
      public var position                        = HighlightAlignment.any
      public var backgroundColor                 = HighlightBackground.solid(UIColor.systemRed)
      public var subtext                         = ""
      public var actionText                      = ""
      public var image: UIImage?                 = nil
      public var maxWidth                        = CGFloat(200)
      public var textColor                       = UIColor.white
      public var shouldDismissOnDialogTap        = true
      public var shouldDismissWhenTapOutside     = false
    }
    
    public var data = HighlightData()
    public var overlay = HighlightOverlay()
    
    public init() {}
  }
  
  var highlightPreferences: HighlightPreferences
  var preferences = EasyTipView.Preferences()

  
  public init(preferences: HighlightPreferences) {
    self.highlightPreferences = preferences
    setup()
  }
  
  public func show(forItem item: UIBarItem) {
    EasyTipView.show(forItem: item,
                     text: highlightPreferences.data.title,
                     preferences: preferences)
  }
  
  public func show(forView view: UIView) {
    EasyTipView.show(forView: view,
                     text: highlightPreferences.data.title,
                     preferences: preferences)
  }
  
  private func setup() {
    arrowPositionSetup()
    backgroundColorSetup()
    overlaySetup()
    
    preferences.animating.dismissOnTap =
      highlightPreferences.data.shouldDismissOnDialogTap
    preferences.drawing.image = highlightPreferences.data.image
  }
  
  private func arrowPositionSetup() {
    let arrowPosition: EasyTipView.ArrowPosition
    switch highlightPreferences.data.position {
    case .any:
      arrowPosition = .any
    case .top:
      arrowPosition = .top
    case .bottom:
      arrowPosition = .bottom
    case .right:
      arrowPosition = .right
    case .left:
      arrowPosition = .left
    }
    preferences.drawing.arrowPosition = arrowPosition
  }
  
  private func backgroundColorSetup() {
    let backgroundColor: EasyTipView.BackgroundColor
    switch highlightPreferences.data.backgroundColor {
    case .gradient(let gradient, let direction):
      switch direction {
      case .leftRight:
        backgroundColor = .gradient(gradient: gradient, direction: .leftRight)
      case .topBottom:
        backgroundColor = .gradient(gradient: gradient, direction: .topBottom)
      }
    case .solid(let color):
      backgroundColor = .solid(color)
    }
    preferences.drawing.backgroundColor = backgroundColor
  }
  
  private func overlaySetup() {
    preferences.highlighting.showsOverlay =
      highlightPreferences.overlay.overlayIsVisible
    preferences.highlighting.overlayShape =
      highlightPreferences.overlay.overlayShape
    preferences.highlighting.overlayColor =
      highlightPreferences.overlay.overlayColor
    preferences.highlighting.shouldDismissOnOverlayTap =
      highlightPreferences.overlay.shouldDismissOnOverlayTap
    preferences.highlighting.shouldPassEventToHighlightView =
      highlightPreferences.overlay.shouldPassEventToHighlightView
  }
}
