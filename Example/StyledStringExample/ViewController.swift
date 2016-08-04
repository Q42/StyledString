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

  private func createWithMethods() -> AttributedString {
    let hello = StyledString("Hello")
      .withUnderline()
      .withForegroundColor(.blue())
    let world = StyledString("world")
      .withStrikethrough()
      .withForegroundColor(.red())

    return (hello + " " + world)
      .withShadow()
      .withFont(.boldSystemFont(ofSize: 50))
      .attributedString
  }

  private func createWithVars() -> AttributedString {
    var hello = StyledString("Hello")
    hello.underlineStyle = .styleSingle
    hello.foregroundColor = .blue()

    var world = StyledString("world")
    world.strikethroughStyle = .styleSingle
    world.foregroundColor = .red()

    var helloWord = (hello + " " + world)
    helloWord.shadowOffset = CGSize(width: 1, height: 1)
    helloWord.font = .boldSystemFont(ofSize: 50)

    return helloWord.attributedString
  }


}
