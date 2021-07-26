//
// EasyTipView.swift
//
// Copyright (c) 2015 Teodor Patraş
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

#if canImport(UIKit)
import UIKit

protocol EasyTipViewDelegate : AnyObject {
  func easyTipViewDidTap(_ tipView: EasyTipView)
  func easyTipViewDidDismiss(_ tipView : EasyTipView)
}


// MARK: - Internal methods extension

extension EasyTipView {
  
  // MARK:- Class methods -
  
  /**
   Presents an EasyTipView pointing to a particular UIBarItem instance within the specified superview
   
   - parameter animated:    Pass true to animate the presentation.
   - parameter item:        The UIBarButtonItem or UITabBarItem instance which the EasyTipView will be pointing to.
   - parameter superview:   A view which is part of the UIBarButtonItem instances superview hierarchy. Ignore this parameter in order to display the EasyTipView within the main window.
   - parameter text:        The text to be displayed.
   - parameter preferences: The preferences which will configure the EasyTipView.
   - parameter delegate:    The delegate.
   */
  class func show(animated: Bool = true, forItem item: UIBarItem, withinSuperview superview: UIView? = nil, text: String, preferences: Preferences = EasyTipView.globalPreferences, delegate: EasyTipViewDelegate? = nil){
    
    if let view = item.view {
      show(animated: animated, forView: view, withinSuperview: superview, text: text, preferences: preferences, delegate: delegate)
    }
  }
  
  /**
   Presents an EasyTipView pointing to a particular UIView instance within the specified superview
   
   - parameter animated:    Pass true to animate the presentation.
   - parameter view:        The UIView instance which the EasyTipView will be pointing to.
   - parameter superview:   A view which is part of the UIView instances superview hierarchy. Ignore this parameter in order to display the EasyTipView within the main window.
   - parameter text:        The text to be displayed.
   - parameter preferences: The preferences which will configure the EasyTipView.
   - parameter delegate:    The delegate.
   */
  class func show(animated: Bool = true, forView view: UIView, withinSuperview superview: UIView? = nil, text:  String, preferences: Preferences = EasyTipView.globalPreferences, delegate: EasyTipViewDelegate? = nil){
    
    let ev = EasyTipView(text: text, preferences: preferences, delegate: delegate)
    ev.show(animated: animated, forView: view, withinSuperview: superview)
  }
  
  /**
   Presents an EasyTipView pointing to a particular UIBarItem instance within the specified superview
   
   - parameter animated:    Pass true to animate the presentation.
   - parameter item:        The UIBarButtonItem or UITabBarItem instance which the EasyTipView will be pointing to.
   - parameter superview:   A view which is part of the UIBarButtonItem instances superview hierarchy. Ignore this parameter in order to display the EasyTipView within the main window.
   - parameter contentView: The view to be displayed.
   - parameter preferences: The preferences which will configure the EasyTipView.
   - parameter delegate:    The delegate.
   */
  class func show(animated: Bool = true, forItem item: UIBarItem, withinSuperview superview: UIView? = nil, contentView: UIView, preferences: Preferences = EasyTipView.globalPreferences, delegate: EasyTipViewDelegate? = nil){
    
    if let view = item.view {
      show(animated: animated, forView: view, withinSuperview: superview, contentView: contentView, preferences: preferences, delegate: delegate)
    }
  }
  
  /**
   Presents an EasyTipView pointing to a particular UIView instance within the specified superview
   
   - parameter animated:    Pass true to animate the presentation.
   - parameter view:        The UIView instance which the EasyTipView will be pointing to.
   - parameter superview:   A view which is part of the UIView instances superview hierarchy. Ignore this parameter in order to display the EasyTipView within the main window.
   - parameter contentView: The view to be displayed.
   - parameter preferences: The preferences which will configure the EasyTipView.
   - parameter delegate:    The delegate.
   */
  class func show(animated: Bool = true, forView view: UIView, withinSuperview superview: UIView? = nil, contentView: UIView, preferences: Preferences = EasyTipView.globalPreferences, delegate: EasyTipViewDelegate? = nil){
    
    let ev = EasyTipView(contentView: contentView, preferences: preferences, delegate: delegate)
    ev.show(animated: animated, forView: view, withinSuperview: superview)
  }
  
  /**
   Presents an EasyTipView pointing to a particular UIView instance within the specified superview containing attributed text.
   - parameter animated:       Pass true to animate the presentation.
   - parameter view:           The UIView instance which the EasyTipView will be pointing to.
   - parameter superview:      A view which is part of the UIView instances superview hierarchy. Ignore this parameter in order to display the EasyTipView within the main window.
   - parameter attributedText: The attributed text to be displayed.
   - parameter preferences:    The preferences which will configure the EasyTipView.
   - parameter delegate:       The delegate.
   */
  class func show(animated: Bool = true, forView view: UIView, withinSuperview superview: UIView? = nil, attributedText:  NSAttributedString, preferences: Preferences = EasyTipView.globalPreferences, delegate: EasyTipViewDelegate? = nil){
    
    let ev = EasyTipView(text: attributedText, preferences: preferences, delegate: delegate)
    ev.show(animated: animated, forView: view, withinSuperview: superview)
  }
  
  // MARK:- Instance methods -
  
  /**
   Presents an EasyTipView pointing to a particular UIBarItem instance within the specified superview
   
   - parameter animated:  Pass true to animate the presentation.
   - parameter item:      The UIBarButtonItem or UITabBarItem instance which the EasyTipView will be pointing to.
   - parameter superview: A view which is part of the UIBarButtonItem instances superview hierarchy. Ignore this parameter in order to display the EasyTipView within the main window.
   */
  func show(animated: Bool = true, forItem item: UIBarItem, withinSuperView superview: UIView? = nil) {
    if let view = item.view {
      show(animated: animated, forView: view, withinSuperview: superview)
    }
  }
  
  /**
   Presents an EasyTipView pointing to a particular UIView instance within the specified superview
   
   - parameter animated:  Pass true to animate the presentation.
   - parameter view:      The UIView instance which the EasyTipView will be pointing to.
   - parameter superview: A view which is part of the UIView instances superview hierarchy. Ignore this parameter in order to display the EasyTipView within the main window.
   */
  func show(animated: Bool = true, forView view: UIView, withinSuperview superview: UIView? = nil) {
    
    #if TARGET_APP_EXTENSIONS
    precondition(superview != nil, "The supplied superview parameter cannot be nil for app extensions.")
    
    let superview = superview!
    #else
    precondition(superview == nil || view.hasSuperview(superview!), "The supplied superview <\(superview!)> is not a direct nor an indirect superview of the supplied reference view <\(view)>. The superview passed to this method should be a direct or an indirect superview of the reference view. To display the tooltip within the main window, ignore the superview parameter.")
    
    let superview = superview ?? UIApplication.shared.windows.first!
    #endif
    
    let initialTransform = preferences.animating.showInitialTransform
    let finalTransform = preferences.animating.showFinalTransform
    let initialAlpha = preferences.animating.showInitialAlpha
    let damping = preferences.animating.springDamping
    let velocity = preferences.animating.springVelocity
    
    presentingView = view
    arrange(withinSuperview: superview)
    
    transform = initialTransform
    alpha = initialAlpha
    
    if preferences.highlighting.showsOverlay {
      overlay.viewToHighlight = view
      overlay.withinSuperview = superview
      superview.addSubview(overlay)
    }
    
    let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
    addGestureRecognizer(tap)
    
    superview.addSubview(self)
    
    let animations : () -> () = {
      self.transform = finalTransform
      self.alpha = 1
    }
    
    if animated {
      UIView.animate(withDuration: preferences.animating.showDuration,
                     delay: 0,
                     usingSpringWithDamping: damping,
                     initialSpringVelocity: velocity,
                     options: [.curveEaseInOut],
                     animations: animations,
                     completion: nil)
      
      UIView.animate(withDuration: preferences.animating.showDuration * 0.2) {
        self.overlay.alpha = 1
      }
    } else {
      animations()
    }
  }
  
  /**
   Dismisses the EasyTipView
   
   - parameter completion: Completion block to be executed after the EasyTipView is dismissed.
   */
  func dismiss(withCompletion completion: (() -> ())? = nil){
    
    let damping = preferences.animating.springDamping
    let velocity = preferences.animating.springVelocity
    
    UIView.animate(withDuration: preferences.animating.dismissDuration, delay: 0, usingSpringWithDamping: damping, initialSpringVelocity: velocity, options: [.curveEaseInOut], animations: {
      self.transform = self.preferences.animating.dismissTransform
      self.alpha = self.preferences.animating.dismissFinalAlpha
    }) { (finished) -> Void in
      completion?()
      self.delegate?.easyTipViewDidDismiss(self)
      self.removeFromSuperview()
      self.transform = CGAffineTransform.identity
    }
    
    UIView.animate(withDuration: preferences.animating.dismissDuration * 0.2) {
      self.overlay.alpha = 0
    } completion: { _ in
      self.overlay.removeFromSuperview()
    }
    
  }
}

// MARK: - EasyTipView class implementation -

class EasyTipView: UIView {

  // MARK:- Nested types -
  
  enum ArrowPosition {
    case any
    case top
    case bottom
    case right
    case left
    
    static let allValues = [top, bottom, right, left]
  }
  
  enum BackgroundColor {
    case gradient(gradient: CGGradient, direction: GradientDirection)
    case solid(_ color: UIColor)
  }
  
  enum GradientDirection {
    case leftRight
    case topBottom
  }
  
  struct Preferences {
    
    struct Drawing {
      var cornerRadius        = CGFloat(5)
      var arrowHeight         = CGFloat(5)
      var arrowWidth          = CGFloat(10)
      var foregroundColor     = UIColor.white
      var backgroundColor     = BackgroundColor.solid(UIColor.red)
      var arrowPosition       = ArrowPosition.any
      var textAlignment       = NSTextAlignment.center
      var borderWidth         = CGFloat(0)
      var borderColor         = UIColor.clear
      var font                = UIFont.systemFont(ofSize: 15)
      var shadowColor         = UIColor.clear
      var shadowOffset        = CGSize(width: 0.0, height: 0.0)
      var shadowRadius        = CGFloat(0)
      var shadowOpacity       = CGFloat(0)
      var image: UIImage?      = nil
    }
    
    struct Positioning {
      var bubbleInsets         = UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)
      var contentInsets        = UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)
      var imageSpace           = CGFloat(8)
      var maxWidth             = CGFloat(200)
    }
    
    struct Animating {
      var dismissTransform     = CGAffineTransform(scaleX: 0.1, y: 0.1)
      var showInitialTransform = CGAffineTransform(scaleX: 0, y: 0)
      var showFinalTransform   = CGAffineTransform.identity
      var springDamping        = CGFloat(0.7)
      var springVelocity       = CGFloat(0.7)
      var showInitialAlpha     = CGFloat(0)
      var dismissFinalAlpha    = CGFloat(0)
      var showDuration         = 0.7
      var dismissDuration      = 0.7
      var dismissOnTap         = true
    }
    
    struct Highlighting {
      var showsOverlay         = false
      var overlayColor         = UIColor.black.withAlphaComponent(0.7)
      var overlayShape         = Shape.rect(rectMargin: 0)
      var shouldDismissOnOverlayTap = false
      var shouldPassEventToHighlightView = true
      
    }
    
    var drawing      = Drawing()
    var positioning  = Positioning()
    var animating    = Animating()
    var highlighting = Highlighting()
    var hasBorder : Bool {
      return drawing.borderWidth > 0 && drawing.borderColor != UIColor.clear
    }
    
    var hasShadow : Bool {
      return drawing.shadowOpacity > 0 && drawing.shadowColor != UIColor.clear
    }
    
    init() {}
  }
  
  enum Content: CustomStringConvertible {
    
    case text(String)
    case attributedText(NSAttributedString)
    case view(UIView)
    
    var description: String {
      switch self {
      case .text(let text):
        return "text : '\(text)'"
      case .attributedText(let text):
        return "attributed text : '\(text)'"
      case .view(let contentView):
        return "view : \(contentView)"
      }
    }
  }
  
  
  // MARK:- Variables -
  
  override var backgroundColor: UIColor? {
    didSet {
      guard let color = backgroundColor
            , color != UIColor.clear else {return}
      
      preferences.drawing.backgroundColor = .solid(color)
      backgroundColor = UIColor.clear
    }
  }
  
  override var description: String {
    let type = "'\(String(reflecting: Swift.type(of: self)))'".components(separatedBy: ".").last!
    
    return "<< \(type) with \(content) >>"
  }
  
  fileprivate weak var presentingView: UIView?
  fileprivate weak var delegate: EasyTipViewDelegate?
  fileprivate var arrowTip = CGPoint.zero
  fileprivate(set) var preferences: Preferences
  private let content: Content
  
  fileprivate lazy var overlay: TipViewHighlightingBackground = {
    let background = TipViewHighlightingBackground(frame: UIScreen.main.bounds)
    background.backgroundColor = preferences.highlighting.overlayColor
    background.alpha = 0
    background.shape = preferences.highlighting.overlayShape
    background.tapAction = { [weak self] in self?.dismiss() }
    background.shouldPassEventToHighlightView = preferences.highlighting.shouldPassEventToHighlightView
    background.shouldDismissOnOverlayTap = preferences.highlighting.shouldDismissOnOverlayTap
    return background
  }()
  
  // MARK: - Lazy variables -
  
  fileprivate lazy var contentSize: CGSize = {
    
    [unowned self] in
    
    switch content {
    case .text(let text):
      #if swift(>=4.2)
      var attributes = [NSAttributedString.Key.font : self.preferences.drawing.font]
      #else
      var attributes = [NSAttributedStringKey.font : self.preferences.drawing.font]
      #endif
      
      var textSize = text.boundingRect(with: CGSize(width: self.preferences.positioning.maxWidth, height: CGFloat.greatestFiniteMagnitude), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: attributes, context: nil).size
      
      textSize.width = ceil(textSize.width)
      textSize.height = ceil(textSize.height)
      
      if textSize.width < self.preferences.drawing.arrowWidth {
        textSize.width = self.preferences.drawing.arrowWidth
      }
      if textSize.height < imageSize.height {
        textSize.height = imageSize.height
      }
      
      return textSize
      
    case .attributedText(let text):
      var textSize = text.boundingRect(with: CGSize(width: self.preferences.positioning.maxWidth, height: CGFloat.greatestFiniteMagnitude), options: NSStringDrawingOptions.usesLineFragmentOrigin, context: nil).size
      
      textSize.width = ceil(textSize.width)
      textSize.height = ceil(textSize.height)
      
      if textSize.width < self.preferences.drawing.arrowWidth {
        textSize.width = self.preferences.drawing.arrowWidth
      }
      if textSize.height < imageSize.height {
        textSize.height = imageSize.height
      }
      
      return textSize
      
    case .view(let contentView):
      return contentView.frame.size
    }
  }()
  
  fileprivate lazy var imageSize: CGSize = {
    
    [unowned self] in
    
    if preferences.drawing.image == nil {
      preferences.positioning.imageSpace = 0
      return CGSize.zero
    }
    
    var imageSize = CGSize(width: 28, height: 28)
    
    imageSize.width = ceil(imageSize.width)
    imageSize.height = ceil(imageSize.height)
    
    return imageSize
    
  }()
  
  fileprivate lazy var tipViewSize: CGSize = {
    
    [unowned self] in
    
    var tipViewSize =
      CGSize(
        width: self.contentSize.width + self.imageSize.width + self.preferences.positioning.imageSpace + self.preferences.positioning.contentInsets.left + self.preferences.positioning.contentInsets.right + self.preferences.positioning.bubbleInsets.left + self.preferences.positioning.bubbleInsets.right,
        height: self.contentSize.height + self.preferences.positioning.contentInsets.top + self.preferences.positioning.contentInsets.bottom + self.preferences.positioning.bubbleInsets.top + self.preferences.positioning.bubbleInsets.bottom + self.preferences.drawing.arrowHeight)
    
    return tipViewSize
  }()
  
  // MARK: - Static variables -
  
  static var globalPreferences = Preferences()
  
  // MARK:- Initializer -
  
  convenience init (text: String, preferences: Preferences = EasyTipView.globalPreferences, delegate: EasyTipViewDelegate? = nil) {
    self.init(content: .text(text), preferences: preferences, delegate: delegate)
    
    self.isAccessibilityElement = true
    self.accessibilityTraits = UIAccessibilityTraits.staticText
    self.accessibilityLabel = text
  }
  
  convenience init (contentView: UIView, preferences: Preferences = EasyTipView.globalPreferences, delegate: EasyTipViewDelegate? = nil) {
    self.init(content: .view(contentView), preferences: preferences, delegate: delegate)
  }
  
  convenience init (text: NSAttributedString, preferences: Preferences = EasyTipView.globalPreferences, delegate: EasyTipViewDelegate? = nil) {
    self.init(content: .attributedText(text), preferences: preferences, delegate: delegate)
  }
  
  init (content: Content, preferences: Preferences = EasyTipView.globalPreferences, delegate: EasyTipViewDelegate? = nil) {
    
    self.content = content
    self.preferences = preferences
    self.delegate = delegate
    
    super.init(frame: CGRect.zero)
    
    self.backgroundColor = UIColor.clear
    
    #if swift(>=4.2)
    let notificationName = UIDevice.orientationDidChangeNotification
    #else
    let notificationName = NSNotification.Name.UIDeviceOrientationDidChange
    #endif
    
    NotificationCenter.default.addObserver(self, selector: #selector(handleRotation), name: notificationName, object: nil)
  }
  
  deinit
  {
    NotificationCenter.default.removeObserver(self)
  }
  
  /**
   NSCoding not supported. Use init(text, preferences, delegate) instead!
   */
  required init?(coder aDecoder: NSCoder) {
    fatalError("NSCoding not supported. Use init(text, preferences, delegate) instead!")
  }
  
  // MARK: - Rotation support -
  
  @objc func handleRotation() {
    guard let sview = superview
          , presentingView != nil else { return }
    
    UIView.animate(withDuration: 0.3) {
      self.overlay.frame = UIScreen.main.bounds
      self.arrange(withinSuperview: sview)
      self.setNeedsDisplay()
    }
  }
  
  // MARK: - Private methods -
  
  fileprivate func computeFrame(arrowPosition position: ArrowPosition, refViewFrame: CGRect, superviewFrame: CGRect) -> CGRect {
    var xOrigin: CGFloat = 0
    var yOrigin: CGFloat = 0
    
    switch position {
    case .top, .any:
      xOrigin = refViewFrame.center.x - tipViewSize.width / 2
      yOrigin = refViewFrame.y + refViewFrame.height
    case .bottom:
      xOrigin = refViewFrame.center.x - tipViewSize.width / 2
      yOrigin = refViewFrame.y - tipViewSize.height
    case .right:
      xOrigin = refViewFrame.x - tipViewSize.width
      yOrigin = refViewFrame.center.y - tipViewSize.height / 2
    case .left:
      xOrigin = refViewFrame.x + refViewFrame.width
      yOrigin = refViewFrame.center.y - tipViewSize.height / 2
    }
    
    var frame = CGRect(x: xOrigin, y: yOrigin, width: tipViewSize.width, height: tipViewSize.height)
    adjustFrame(&frame, forSuperviewFrame: superviewFrame)
    return frame
  }
  
  fileprivate func adjustFrame(_ frame: inout CGRect, forSuperviewFrame superviewFrame: CGRect) {
    
    // adjust horizontally
    if frame.x < 0 {
      frame.x =  0
    } else if frame.maxX > superviewFrame.width {
      frame.x = superviewFrame.width - frame.width
    }
    
    //adjust vertically
    if frame.y < 0 {
      frame.y = 0
    } else if frame.maxY > superviewFrame.maxY {
      frame.y = superviewFrame.height - frame.height
    }
  }
  
  fileprivate func isFrameValid(_ frame: CGRect, forRefViewFrame: CGRect, withinSuperviewFrame: CGRect) -> Bool {
    return !frame.intersects(forRefViewFrame)
  }
  
  fileprivate func arrange(withinSuperview superview: UIView) {
    
    var position = preferences.drawing.arrowPosition
    
    let refViewFrame = presentingView!.convert(presentingView!.bounds, to: superview);
    
    let superviewFrame: CGRect
    if let scrollview = superview as? UIScrollView {
      superviewFrame = CGRect(origin: scrollview.frame.origin, size: scrollview.contentSize)
    } else {
      superviewFrame = superview.frame
    }
    
    var frame = computeFrame(arrowPosition: position, refViewFrame: refViewFrame, superviewFrame: superviewFrame)
    
    if !isFrameValid(frame, forRefViewFrame: refViewFrame, withinSuperviewFrame: superviewFrame) {
      for value in ArrowPosition.allValues where value != position {
        let newFrame = computeFrame(arrowPosition: value, refViewFrame: refViewFrame, superviewFrame: superviewFrame)
        if isFrameValid(newFrame, forRefViewFrame: refViewFrame, withinSuperviewFrame: superviewFrame) {
          
          if position != .any {
            print("[EasyTipView - Info] The arrow position you chose <\(position)> could not be applied. Instead, position <\(value)> has been applied! Please specify position <\(ArrowPosition.any)> if you want EasyTipView to choose a position for you.")
          }
          
          frame = newFrame
          position = value
          preferences.drawing.arrowPosition = value
          break
        }
      }
    }
    
    switch position {
    case .bottom, .top, .any:
      var arrowTipXOrigin: CGFloat
      if frame.width < refViewFrame.width {
        arrowTipXOrigin = tipViewSize.width / 2
      } else {
        arrowTipXOrigin = abs(frame.x - refViewFrame.x) + refViewFrame.width / 2
      }
      
      arrowTip = CGPoint(x: arrowTipXOrigin, y: position == .bottom ? tipViewSize.height - preferences.positioning.bubbleInsets.bottom :  preferences.positioning.bubbleInsets.top)
    case .right, .left:
      var arrowTipYOrigin: CGFloat
      if frame.height < refViewFrame.height {
        arrowTipYOrigin = tipViewSize.height / 2
      } else {
        arrowTipYOrigin = abs(frame.y - refViewFrame.y) + refViewFrame.height / 2
      }
      
      arrowTip = CGPoint(x: preferences.drawing.arrowPosition == .left ? preferences.positioning.bubbleInsets.left : tipViewSize.width - preferences.positioning.bubbleInsets.right, y: arrowTipYOrigin)
    }
    
    if case .view(let contentView) = content {
      contentView.translatesAutoresizingMaskIntoConstraints = false
      contentView.frame = getContentRect(from: getBubbleFrame())
    }
    
    self.frame = frame
  }
  
  // MARK:- Callbacks -
  
  @objc func handleTap() {
    self.delegate?.easyTipViewDidTap(self)
    guard preferences.animating.dismissOnTap else { return }
    dismiss()
  }
  
  // MARK:- Drawing -
  
  fileprivate func drawBubble(_ bubbleFrame: CGRect, arrowPosition: ArrowPosition,  context: CGContext) {
    
    let arrowWidth = preferences.drawing.arrowWidth
    let arrowHeight = preferences.drawing.arrowHeight
    let cornerRadius = preferences.drawing.cornerRadius
    
    let contourPath = CGMutablePath()
    
    contourPath.move(to: CGPoint(x: arrowTip.x, y: arrowTip.y))
    
    switch arrowPosition {
    case .bottom, .top, .any:
      
      contourPath.addLine(to: CGPoint(x: arrowTip.x - arrowWidth / 2, y: arrowTip.y + (arrowPosition == .bottom ? -1 : 1) * arrowHeight))
      if arrowPosition == .bottom {
        drawBubbleBottomShape(bubbleFrame, cornerRadius: cornerRadius, path: contourPath)
      } else {
        drawBubbleTopShape(bubbleFrame, cornerRadius: cornerRadius, path: contourPath)
      }
      contourPath.addLine(to: CGPoint(x: arrowTip.x + arrowWidth / 2, y: arrowTip.y + (arrowPosition == .bottom ? -1 : 1) * arrowHeight))
      
    case .right, .left:
      
      contourPath.addLine(to: CGPoint(x: arrowTip.x + (arrowPosition == .right ? -1 : 1) * arrowHeight, y: arrowTip.y - arrowWidth / 2))
      
      if arrowPosition == .right {
        drawBubbleRightShape(bubbleFrame, cornerRadius: cornerRadius, path: contourPath)
      } else {
        drawBubbleLeftShape(bubbleFrame, cornerRadius: cornerRadius, path: contourPath)
      }
      
      contourPath.addLine(to: CGPoint(x: arrowTip.x + (arrowPosition == .right ? -1 : 1) * arrowHeight, y: arrowTip.y + arrowWidth / 2))
    }
    
    contourPath.closeSubpath()
    context.addPath(contourPath)
    context.clip()
    
    paintBubble(context)
    
    if preferences.hasBorder {
      drawBorder(contourPath, context: context)
    }
  }
  
  fileprivate func drawBubbleBottomShape(_ frame: CGRect, cornerRadius: CGFloat, path: CGMutablePath) {
    
    path.addArc(tangent1End: CGPoint(x: frame.x, y: frame.y + frame.height), tangent2End: CGPoint(x: frame.x, y: frame.y), radius: cornerRadius)
    path.addArc(tangent1End: CGPoint(x: frame.x, y: frame.y), tangent2End: CGPoint(x: frame.x + frame.width, y: frame.y), radius: cornerRadius)
    path.addArc(tangent1End: CGPoint(x: frame.x + frame.width, y: frame.y), tangent2End: CGPoint(x: frame.x + frame.width, y: frame.y + frame.height), radius: cornerRadius)
    path.addArc(tangent1End: CGPoint(x: frame.x + frame.width, y: frame.y + frame.height), tangent2End: CGPoint(x: frame.x, y: frame.y + frame.height), radius: cornerRadius)
  }
  
  fileprivate func drawBubbleTopShape(_ frame: CGRect, cornerRadius: CGFloat, path: CGMutablePath) {
    
    path.addArc(tangent1End: CGPoint(x: frame.x, y: frame.y), tangent2End: CGPoint(x: frame.x, y: frame.y + frame.height), radius: cornerRadius)
    path.addArc(tangent1End: CGPoint(x: frame.x, y:  frame.y + frame.height), tangent2End: CGPoint(x: frame.x + frame.width, y: frame.y + frame.height), radius: cornerRadius)
    path.addArc(tangent1End: CGPoint(x: frame.x + frame.width, y: frame.y + frame.height), tangent2End: CGPoint(x: frame.x + frame.width, y: frame.y), radius: cornerRadius)
    path.addArc(tangent1End: CGPoint(x: frame.x + frame.width, y: frame.y), tangent2End: CGPoint(x: frame.x, y: frame.y), radius: cornerRadius)
  }
  
  fileprivate func drawBubbleRightShape(_ frame: CGRect, cornerRadius: CGFloat, path: CGMutablePath) {
    
    path.addArc(tangent1End: CGPoint(x: frame.x + frame.width, y: frame.y), tangent2End: CGPoint(x: frame.x, y: frame.y), radius: cornerRadius)
    path.addArc(tangent1End: CGPoint(x: frame.x, y: frame.y), tangent2End: CGPoint(x: frame.x, y: frame.y + frame.height), radius: cornerRadius)
    path.addArc(tangent1End: CGPoint(x: frame.x, y: frame.y + frame.height), tangent2End: CGPoint(x: frame.x + frame.width, y: frame.y + frame.height), radius: cornerRadius)
    path.addArc(tangent1End: CGPoint(x: frame.x + frame.width, y: frame.y + frame.height), tangent2End: CGPoint(x: frame.x + frame.width, y: frame.height), radius: cornerRadius)
    
  }
  
  fileprivate func drawBubbleLeftShape(_ frame: CGRect, cornerRadius: CGFloat, path: CGMutablePath) {
    
    path.addArc(tangent1End: CGPoint(x: frame.x, y: frame.y), tangent2End: CGPoint(x: frame.x + frame.width, y: frame.y), radius: cornerRadius)
    path.addArc(tangent1End: CGPoint(x: frame.x + frame.width, y: frame.y), tangent2End: CGPoint(x: frame.x + frame.width, y: frame.y + frame.height), radius: cornerRadius)
    path.addArc(tangent1End: CGPoint(x: frame.x + frame.width, y: frame.y + frame.height), tangent2End: CGPoint(x: frame.x, y: frame.y + frame.height), radius: cornerRadius)
    path.addArc(tangent1End: CGPoint(x: frame.x, y: frame.y + frame.height), tangent2End: CGPoint(x: frame.x, y: frame.y), radius: cornerRadius)
  }
  
  fileprivate func paintBubble(_ context: CGContext) {
    
    switch preferences.drawing.backgroundColor {
    case .solid(let color):
      context.setFillColor(color.cgColor)
      context.fill(bounds)
      
    case .gradient(let gradient, let direction):
      let startPoint: CGPoint
      let endPoint: CGPoint
      switch direction {
      case .leftRight:
        startPoint = CGPoint(x: 0, y: bounds.height)
        endPoint = CGPoint(x: bounds.width, y: bounds.height)
      default:
        startPoint = CGPoint.zero
        endPoint = CGPoint(x: 0, y: bounds.height)
      }
      context.drawLinearGradient(
        gradient,
        start: startPoint,
        end: endPoint,
        options: []
      )
    }
    
  }
  
  fileprivate func drawBorder(_ borderPath: CGPath, context: CGContext) {
    context.addPath(borderPath)
    context.setStrokeColor(preferences.drawing.borderColor.cgColor)
    context.setLineWidth(preferences.drawing.borderWidth)
    context.strokePath()
  }
  
  fileprivate func drawText(_ bubbleFrame: CGRect, context : CGContext) {
    guard case .text(let text) = content else { return }
    let paragraphStyle = NSMutableParagraphStyle()
    paragraphStyle.alignment = preferences.drawing.textAlignment
    paragraphStyle.lineBreakMode = NSLineBreakMode.byWordWrapping
    
    
    let textRect = getContentRect(from: bubbleFrame)
    
    #if swift(>=4.2)
    let attributes = [NSAttributedString.Key.font : preferences.drawing.font, NSAttributedString.Key.foregroundColor : preferences.drawing.foregroundColor, NSAttributedString.Key.paragraphStyle : paragraphStyle]
    #else
    let attributes = [NSAttributedStringKey.font : preferences.drawing.font, NSAttributedStringKey.foregroundColor : preferences.drawing.foregroundColor, NSAttributedStringKey.paragraphStyle : paragraphStyle]
    #endif
    
    text.draw(in: textRect, withAttributes: attributes)
  }
  
  fileprivate func drawAttributedText(_ bubbleFrame: CGRect, context : CGContext) {
    guard
      case .attributedText(let text) = content
    else {
      return
    }
    
    let textRect = getContentRect(from: bubbleFrame)
    
    text.draw(with: textRect, options: .usesLineFragmentOrigin, context: .none)
  }
  
  fileprivate func drawImage(_ bubbleFrame: CGRect, context: CGContext) {
    if let image = preferences.drawing.image {
      let imageRect = getImageRect(from: bubbleFrame)
      image.draw(in: imageRect)
    }
  }
  
  fileprivate func drawShadow() {
    if preferences.hasShadow {
      self.layer.masksToBounds = false
      self.layer.shadowColor = preferences.drawing.shadowColor.cgColor
      self.layer.shadowOffset = preferences.drawing.shadowOffset
      self.layer.shadowRadius = preferences.drawing.shadowRadius
      self.layer.shadowOpacity = Float(preferences.drawing.shadowOpacity)
    }
  }
  
  override func draw(_ rect: CGRect) {
    
    let bubbleFrame = getBubbleFrame()
    
    let context = UIGraphicsGetCurrentContext()!
    context.saveGState ()
    
    drawBubble(bubbleFrame, arrowPosition: preferences.drawing.arrowPosition, context: context)
    
    switch content {
    case .text:
      drawText(bubbleFrame, context: context)
    case .attributedText:
      drawAttributedText(bubbleFrame, context: context)
    case .view (let view):
      addSubview(view)
    }
    drawImage(bubbleFrame, context: context)
    drawShadow()
    context.restoreGState()
  }
  
  private func getBubbleFrame() -> CGRect {
    let arrowPosition = preferences.drawing.arrowPosition
    let bubbleWidth: CGFloat
    let bubbleHeight: CGFloat
    let bubbleXOrigin: CGFloat
    let bubbleYOrigin: CGFloat
    switch arrowPosition {
    case .bottom, .top, .any:
      
      bubbleWidth = tipViewSize.width - preferences.positioning.bubbleInsets.left - preferences.positioning.bubbleInsets.right
      bubbleHeight = tipViewSize.height - preferences.positioning.bubbleInsets.top - preferences.positioning.bubbleInsets.bottom - preferences.drawing.arrowHeight
      
      bubbleXOrigin = preferences.positioning.bubbleInsets.left
      bubbleYOrigin = arrowPosition == .bottom ? preferences.positioning.bubbleInsets.top : preferences.positioning.bubbleInsets.top + preferences.drawing.arrowHeight
      
    case .left, .right:
      
      bubbleWidth = tipViewSize.width - preferences.positioning.bubbleInsets.left - preferences.positioning.bubbleInsets.right - preferences.drawing.arrowHeight
      bubbleHeight = tipViewSize.height - preferences.positioning.bubbleInsets.top - preferences.positioning.bubbleInsets.left
      
      bubbleXOrigin = arrowPosition == .right ? preferences.positioning.bubbleInsets.left : preferences.positioning.bubbleInsets.left + preferences.drawing.arrowHeight
      bubbleYOrigin = preferences.positioning.bubbleInsets.top
      
    }
    return CGRect(x: bubbleXOrigin, y: bubbleYOrigin, width: bubbleWidth, height: bubbleHeight)
  }
  
  private func getContentRect(from bubbleFrame: CGRect) -> CGRect {
    return CGRect(x: bubbleFrame.origin.x + preferences.positioning.contentInsets.left + imageSize.width + preferences.positioning.imageSpace, y: bubbleFrame.origin.y + preferences.positioning.contentInsets.top, width: contentSize.width, height: contentSize.height)
  }
  
  private func getImageRect(from bubbleFrame: CGRect) -> CGRect {
    return CGRect(x: bubbleFrame.origin.x + preferences.positioning.contentInsets.left, y: bubbleFrame.midY - imageSize.height/2, width: imageSize.width, height: imageSize.height)
  }
  
}
#endif
