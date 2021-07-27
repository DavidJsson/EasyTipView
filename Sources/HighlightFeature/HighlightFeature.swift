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
      public var position                        = HighlightAlignment.any
      public var backgroundColor                 = HighlightBackground.solid(UIColor.systemRed)
      public var image: UIImage?                 = nil
      public var widthRatio: CGFloat?            = nil
      public var minWidthRatio: CGFloat?         = nil
      public var maxWidthRatio: CGFloat?         = nil
      public var shouldDismissOnDialogTap        = true
      public var shouldDismissWhenTapOutside     = false
    }
    
    public struct HighlightPadding {
      public var contentPadding: UIEdgeInsets    = UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)
      public var dialogPadding: UIEdgeInsets     = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
      public var imageSpace: CGFloat             = CGFloat(8)
    }
    
    public struct HighlightText {
      public var title: String = ""
      public var subtext: String = ""
      public var actionText: String = ""
      public var titleFont: UIFont = UIFont.systemFont(ofSize: 15)
      public var subtextFont: UIFont = UIFont.systemFont(ofSize: 10)
      public var actionTextFont: UIFont = UIFont.systemFont(ofSize: 8)
      public var textColor: UIColor = UIColor.white
      
      func toAttributedText() -> NSAttributedString {
        var text = "<div style='text-align:Center; color: white'>"
        if title != "" { text +=  "<h2 style='font:\(titleFont); margin:0'>\(title)</h2>"}
        if subtext != "" { text +=  "<p style='font:\(subtextFont); margin:0'>\(subtext)</p>"}
        if actionText != "" { text +=  "<small style='font:\(actionTextFont); margin: 5 0 0 0'>(\(actionText))</small>"}
        text += "</div>"
        let htmlData = NSString(string: text).data(using: String.Encoding.utf8.rawValue)
        let options = [NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html]
        let attributedString = try! NSMutableAttributedString(data: htmlData!, options: options, documentAttributes: nil)
        attributedString.addAttributes([.foregroundColor: textColor], range: NSRange(location:0, length: attributedString.length-1))
        return attributedString
      }
    }
    
    public var data = HighlightData()
    public var overlay = HighlightOverlay()
    public var text = HighlightText()
    public var padding = HighlightPadding()
    
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
                     attributedText: highlightPreferences.text.toAttributedText(),
                     preferences: preferences)
  }
  
  public func show(forView view: UIView) {
    EasyTipView.show(forView: view,
                     attributedText: highlightPreferences.text.toAttributedText(),
                     preferences: preferences)
  }
  
  private func setup() {
    arrowPositionSetup()
    backgroundColorSetup()
    overlaySetup()
    widthSetup()
    paddingSetup()
    
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
  
  private func paddingSetup() {
    preferences.positioning.bubbleInsets  = highlightPreferences.padding.dialogPadding
    preferences.positioning.contentInsets = highlightPreferences.padding.contentPadding
    preferences.positioning.imageSpace    =  highlightPreferences.padding.imageSpace
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
  
  private func widthSetup() {
    preferences.positioning.widthRatio = highlightPreferences.data.widthRatio
    
    if let maxWidthRatio = highlightPreferences.data.maxWidthRatio {
      preferences.positioning.maxWidthRatio = maxWidthRatio
    }
    
    if let minWidthRatio = highlightPreferences.data.minWidthRatio {
      preferences.positioning.minWidthRatio = minWidthRatio
    }
  }
}
