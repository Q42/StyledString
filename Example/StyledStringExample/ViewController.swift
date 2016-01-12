//
//  ViewController.swift
//  StyledStringExample
//
//  Created by Sander de Vos on 12/02/2015.
//  Copyright (c) 2015 Sander de Vos. All rights reserved.
//

import UIKit
import StyledString

class ViewController: UIViewController {

  @IBOutlet weak var label1: UILabel!
  @IBOutlet weak var label2: UILabel!

  override func viewDidLoad() {
    super.viewDidLoad()

    label1.attributedText = createWithMethods()
    label2.attributedText = createWithMethods()
  }

  private func createWithMethods() -> NSAttributedString {
    let hello = StyledString("Hello")
      .withUnderline()
      .withForegroundColor(.blueColor())
    let world = StyledString("world")
      .withStrikethrough()
      .withForegroundColor(.redColor())

    return (hello + " " + world)
      .withShadow()
      .withFont(.boldSystemFontOfSize(50))
      .NSAttributedString()
  }

  private func createWithVars() -> NSAttributedString {
    var hello = StyledString("Hello")
    hello.underlineStyle = .StyleSingle
    hello.foregroundColor = .blueColor()

    var world = StyledString("world")
    world.strikethroughStyle = .StyleSingle
    world.foregroundColor = .redColor()

    var helloWord = (hello + " " + world)
    helloWord.shadowOffset = CGSizeMake(1, 1)
    helloWord.font = .boldSystemFontOfSize(50)

    return helloWord.NSAttributedString()
  }


}