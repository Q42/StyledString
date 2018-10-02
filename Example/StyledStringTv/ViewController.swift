//
//  ViewController.swift
//  StyledStringTv
//
//  Created by Tom Lokhorst on 2018-05-20.
//  Copyright © 2018 Q42. All rights reserved.
//

import UIKit
import StyledString

class ViewController: UIViewController {
  @IBOutlet weak var label: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()

    label.attributedText = createWithMethods()
  }
  
  private func createWithMethods() -> NSAttributedString {
    let hello = StyledString("Hello")
      .withUnderline()
      .with(foregroundColor: .blue)
    let world = StyledString("world")
      .withStrikethrough()
      .with(foregroundColor: .red)

    return (hello + " " + world)
      .withShadow()
      .with(font: .boldSystemFont(ofSize: 50))
      .withTextEffect()
      .nsAttributedString
  }

}

