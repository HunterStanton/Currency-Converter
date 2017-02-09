//
//  ViewController.swift
//  Currency Converter
//
//  Created by Hunter Stanton on 2/8/17.
//  Copyright © 2017 Hunter Stanton. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var CurrencyNameLabel: UILabel!
    @IBOutlet weak var ValueInputField: UITextField!
    @IBOutlet weak var BaseCurrencySelector: UISegmentedControl!
    @IBOutlet weak var SecondaryCurrencySelector: UISegmentedControl!
    @IBOutlet weak var BorderView: UIView!
    @IBOutlet weak var CurrencyValue: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up UI stuff
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
    
    
    @IBAction func ConvertButtonPressed(_ sender: Any)
    {
        
        // If the rate entered is invalid, make it 0
        let rate: Float = Float(ValueInputField.text!) ?? 0
        
        // If the rate isn't valid, no point actually making the convert call which will waste resources
        if(rate==0)
        {
            print("Invalid rate.")
            return
        }
        
        // Get the exchange rate
        CurrencyValue.text = String(Currency.ConvertCurrency(currency1: BaseCurrencySelector.titleForSegment(at: BaseCurrencySelector.selectedSegmentIndex)!, currency2: SecondaryCurrencySelector.titleForSegment(at: SecondaryCurrencySelector.selectedSegmentIndex)!, value: rate))
        
        CurrencyNameLabel.text = Currency.currencyNames[SecondaryCurrencySelector.titleForSegment(at: SecondaryCurrencySelector.selectedSegmentIndex)!]
    }
    
    
    /// Gets what UIInterfaceStyle the user has set. Dark or Light depending on AppleTV settings.
    ///
    /// - Returns: The interface style the user has set.
    func checkInterfaceStyle() -> String{
        guard(traitCollection.responds(to: #selector(getter: UITraitCollection.userInterfaceStyle)))
            else { return "1" }
        
        let style = traitCollection.userInterfaceStyle
        
        switch style {
        case .light:
            return("light")
        case .dark:
            return("dark")
        case .unspecified:
            return("unspecified")
        }
    }


}

