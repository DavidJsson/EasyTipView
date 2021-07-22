//
//  TipViewHighlightingBackground.swift
//  EasyTipView
//
//  Created by Jan Lottermoser on 11.03.21.
//  Copyright © 2021 teodorpatras. All rights reserved.
//

import UIKit

final class TipViewHighlightingBackground: UIView {
  
  // MARK: - Public interface
  
  /// The view around which the highlighting will be shown
  var viewToHighlight: UIView?
  
  /// A closure to execute when the view is tapped
  var tapAction: (() -> Void)?
  
  var shape: Shape?
  
  private var overlayShape: OverlayShape?
  
  
  // MARK: - Initialization
  
  public override init(frame: CGRect) {
    super.init(frame: frame)
    setup()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setup()
  }
  
  private func setup() {
    contentMode = .redraw
    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
    addGestureRecognizer(tapGesture)
  }
  
  
  // MARK: - User input
  @objc private func handleTap() {
    tapAction?()
  }
  
  // MARK: - Drawing and layout
  
  public override func draw(_ rect: CGRect) {
    super.draw(rect)
    
    guard let viewToHighlight = viewToHighlight else { return }
    
    switch shape {
    case .circle(let circleMargin, let circleRadius):
      overlayShape = OverlayCircle(circleMargin: circleMargin, circleRadius: circleRadius)
      
    case .rect(let rectMargin):
      overlayShape = OverlayRect(rectMargin: rectMargin)
      
    default:
      overlayShape = OverlayRect()
    }
    
    
    // add a mask with a cicle hole in the position of the viewToHighlight
    let mask = CAShapeLayer()
    let path = overlayShape?.path
    let viewFrame = viewToHighlight.superview?.convert(viewToHighlight.frame, to: self) ?? .zero
    overlayShape?.addShape(viewFrame: viewFrame)
    path?.addRect(bounds)
    
    mask.path = path
    mask.fillRule = .evenOdd
    self.layer.mask = mask
    
  }
  
}
