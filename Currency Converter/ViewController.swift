//
//  ViewController.swift
//  Currency Converter
//
//  Created by Hunter Stanton on 2/8/17.
//  Copyright © 2017 Hunter Stanton. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var BorderView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        BorderView.backgroundColor = UIColor(white: 1.0, alpha: 0.9)
        BorderView.layer.borderWidth = 5.0
        BorderView.layer.cornerRadius = 10.0
        BorderView.layer.borderColor = UIColor.white.cgColor
        BorderView.layer.shadowColor = UIColor.black.cgColor
        BorderView.layer.shadowOffset = CGSize.zero
        BorderView.layer.shadowRadius = 10.0
        BorderView.layer.shadowOpacity = 1.0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

