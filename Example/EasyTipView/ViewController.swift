//
// ViewController.swift
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

import UIKit
import Darwin
import EasyTipView

class ViewController: UIViewController, EasyTipViewDelegate {
  
  @IBOutlet weak var toolbarItem: UIBarButtonItem!
  @IBOutlet weak var smallContainerView: UIView!
  @IBOutlet weak var navBarItem: UIBarButtonItem!
  @IBOutlet weak var buttonA: UIButton!
  @IBOutlet weak var buttonB: UIButton!
  @IBOutlet weak var buttonH: UIButton!
  
  weak var tipView: EasyTipView?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.configureUI()
    
    self.view.backgroundColor = UIColor(hue:0.75, saturation:0.01, brightness:0.96, alpha:1.00)
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    self.toolbarItemAction()
  }
  
  func easyTipViewDidTap(_ tipView: EasyTipView) {
    print("\(tipView) did tap!")
  }
  
  func easyTipViewDidDismiss(_ tipView: EasyTipView) {
    print("\(tipView) did dismiss!")
  }
  
  @IBAction func barButtonAction(sender: UIBarButtonItem) {
    let text = "Tip view for bar button item displayed within the navigation controller's view. Tap to dismiss."
    EasyTipView.show(forItem: self.navBarItem,
                     withinSuperview: self.navigationController?.view,
                     text: text,
                     delegate : self)
  }
  
  @IBAction func toolbarItemAction() {
    if let tipView = tipView {
      tipView.dismiss(withCompletion: {
        print("Completion called!")
      })
    } else {
      let text = "EasyTipView is an easy to use tooltip view. It can point to any UIView or UIBarItem subclasses. Tap the buttons to see other tooltips."
      
      var preferences = EasyTipView.globalPreferences
      preferences.drawing.shadowColor = UIColor.black
      preferences.drawing.shadowRadius = 2
      preferences.drawing.shadowOpacity = 0.75
      
      let tip = EasyTipView(text: text, preferences: preferences, delegate: self)
      tip.show(forItem: toolbarItem)
      tipView = tip
    }
  }
  
  @IBAction func buttonAction(sender : UIButton) {
    switch sender {
    case buttonA:
      
      var preferences = EasyTipView.Preferences()
      
      preferences.drawing.backgroundColor = UIColor(hue:0.58, saturation:0.1, brightness:1, alpha:1)
      preferences.drawing.foregroundColor = UIColor.darkGray
      preferences.drawing.textAlignment = NSTextAlignment.center
      preferences.highlighting.showsOverlay = true
      preferences.highlighting.overlayShape = Shape.circle()
      
      let view = EasyTipView(text: "Tip view within the green superview. Tap to dismiss.", preferences: preferences)
      view.show(forView: buttonA)
      
    case buttonB:
      
      var preferences = EasyTipView.Preferences()
      preferences.drawing.foregroundColor = UIColor.white
      preferences.drawing.font = UIFont(name: "HelveticaNeue-Light", size: 14)!
      preferences.drawing.textAlignment = NSTextAlignment.justified
      preferences.drawing.arrowPosition = .top
      preferences.highlighting.showsOverlay = true
      
      let text = "Tip view inside the navigation controller's view. Tap to dismiss!"
      EasyTipView.show(forView: self.buttonB,
                       withinSuperview: self.navigationController?.view,
                       text: text,
                       preferences: preferences)
      
      
      
    default:
      
      var preferences = EasyTipView.Preferences()
      preferences.drawing.backgroundColor = buttonH.backgroundColor!
      preferences.drawing.foregroundColor = UIColor.white
      preferences.drawing.textAlignment = NSTextAlignment.center
      preferences.drawing.arrowPosition = .top
      preferences.positioning.maxWidth = 150
      preferences.positioning.bubbleInsets = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 4)
      preferences.highlighting.showsOverlay = true
      preferences.highlighting.overlayShape = Shape.rect(rectMargin: 4)
      
      let view = EasyTipView(text: "Tip view with highlighting overlay", preferences: preferences)
      view.show(forView: buttonH, withinSuperview: self.navigationController?.view!)
    }
  }
  
  func configureUI () {
    let color = UIColor(hue:0.46, saturation:0.99, brightness:0.6, alpha:1)
    
    buttonA.backgroundColor = UIColor(hue:0.58, saturation:0.1, brightness:1, alpha:1)
    
    self.navigationController?.view.tintColor = color
    
    self.buttonB.backgroundColor = color
    self.smallContainerView.backgroundColor = color
  }
}

