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

class ViewController: UIViewController {
  
  @IBOutlet weak var toolbarItem: UIBarButtonItem!
  @IBOutlet weak var smallContainerView: UIView!
  @IBOutlet weak var navBarItem: UIBarButtonItem!
  @IBOutlet weak var buttonA: UIButton!
  @IBOutlet weak var buttonB: UIButton!
  @IBOutlet weak var buttonH: UIButton!
  

  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.configureUI()
    
    self.view.backgroundColor = UIColor(hue:0.75, saturation:0.01, brightness:0.96, alpha:1.00)
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    self.toolbarItemAction()
  }
  
  
  @IBAction func barButtonAction(sender: UIBarButtonItem) {
    let text = "Tip view for bar button item displayed within the navigation controller's view. Tap to dismiss."
    var prefs = HighlightFeature.HighlightPreferences()
    prefs.data.title = text
    HighlightFeature(preferences: prefs).show(forItem: self.navBarItem)
  }
  
  @IBAction func toolbarItemAction() {
      
    var preferences = HighlightFeature.HighlightPreferences()
    let text = "EasyTipView is an easy to use tooltip view. It can point to any UIView or UIBarItem subclasses. Tap the buttons to see other"
    preferences.data.title = text
    
    let tip = HighlightFeature(preferences: preferences)
    tip.show(forItem: toolbarItem)
    
  }
  
  @IBAction func buttonAction(sender : UIButton) {
    switch sender {
    case buttonA:
      
      var preferences = HighlightFeature.HighlightPreferences()
      
      let colors = [UIColor.red.cgColor, UIColor.yellow.cgColor]
      let colorSpace = CGColorSpaceCreateDeviceRGB()
      let colorLocations: [CGFloat] = [0.0, 1.0]
      guard let gradient = CGGradient(
        colorsSpace: colorSpace,
        colors: colors as CFArray,
        locations: colorLocations
      ) else {
        return
      }
      
      preferences.data.backgroundColor = .gradient(gradient: gradient, direction: .leftRight)
      preferences.data.textColor = UIColor.darkGray
      preferences.overlay.overlayIsVisible = true
      preferences.overlay.overlayShape = .circle()
      preferences.data.title = "Tip view within the green superview. Tap to dismiss."
      preferences.data.image = UIImage(named: "outline_account_circle_black_36pt")
      let view = HighlightFeature(preferences: preferences)
      view.show(forView: buttonA)
      
    case buttonB:
      
      var preferences = HighlightFeature.HighlightPreferences()
      preferences.data.textColor = .white
      preferences.data.position = .top
      preferences.overlay.overlayIsVisible = true
      
      let text = "Tip view inside the navigation controller's view. Tap to dismiss!"
      preferences.data.title = text
      HighlightFeature(preferences: preferences).show(forView: self.buttonB)
      
    default:
      
      var preferences = HighlightFeature.HighlightPreferences()
      preferences.data.backgroundColor = .solid(buttonH.backgroundColor!)
      preferences.data.textColor = .white
      preferences.data.position = .top
      //preferences.positioning.bubbleInsets = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 4)
      preferences.overlay.overlayIsVisible = true
      preferences.overlay.overlayShape = .rect(rectMargin: 4)
      preferences.data.shouldDismissOnDialogTap = true
      
      preferences.overlay.shouldPassEventToHighlightView = true
      preferences.overlay.shouldDismissOnOverlayTap = false
      preferences.data.title = "Tip view with highlighting overlay"
      let view = HighlightFeature(preferences: preferences)
      view.show(forView: buttonH)
      
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

