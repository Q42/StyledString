//
//  ViewController.swift
//  StyledTextExample
//
//  Created by Sander de Vos on 12/02/2015.
//  Copyright (c) 2015 Sander de Vos. All rights reserved.
//

import UIKit
import StyledString

class ViewController: UIViewController {

  @IBOutlet weak var label: UILabel!

  override func viewDidLoad() {
    super.viewDidLoad()

    let hello = StyledString(string: "Hello")
      .withUnderline()
      .withColor(UIColor.blueColor())
    let world = StyledString(string: "world")
      .withStrikethrough()
      .withColor(UIColor.redColor())

    label.attributedText = (hello + " " + world)
      .withShadow()
      .withFont(UIFont.boldSystemFontOfSize(50))
      .NSAttributedString()

  }

}