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
      .with(foregroundColor: .blue)
    let world = StyledString("world")
      .withStrikethrough()
      .with(foregroundColor: .red)

    return (hello + " " + world)
      .withShadow()
      .with(font: .boldSystemFont(ofSize: 50))
      .nsAttributedString
  }

  private func createWithVars() -> NSAttributedString {
    var hello = StyledString("Hello")
    hello.underlineStyle = .styleSingle
    hello.foregroundColor = .blue

    var world = StyledString("world")
    world.strikethroughStyle = .styleSingle
    world.foregroundColor = .red

    var helloWord = (hello + " " + world)
    helloWord.shadowOffset = CGSize(width: 1, height: 1)
    helloWord.font = .boldSystemFont(ofSize: 50)

    return helloWord.nsAttributedString
  }

}
