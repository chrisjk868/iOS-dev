//
//  ViewController.swift
//  Hello
//
//  Created by stlp on 4/5/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let screenSize: CGRect = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        let label = UILabel(frame: CGRect(x: screenWidth / 2, y: screenHeight / 2, width: 200, height: 100))
        label.text = "Hello, World"
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.center = self.view.center
        label.adjustsFontSizeToFitWidth = true
        self.view.addSubview(label)
    }


}

