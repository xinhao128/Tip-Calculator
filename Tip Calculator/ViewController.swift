//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Xinhao Liang on 12/27/18.
//  Copyright © 2018 Xinhao Liang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var viewControllerHome: UIView!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var plusSign: UILabel!
    @IBOutlet weak var equalSign: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        billField.becomeFirstResponder()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let defaults = UserDefaults.standard
        let themeIndex = defaults.integer(forKey: "IndexTheme")
        
        tipControl.selectedSegmentIndex = defaults.integer(forKey: "Index")
        
        calculateTipHelper()
        
        if (themeIndex == 1) {
            darkTheme()
        }
        else {
            whiteTheme()
        }
    }
    
    func darkTheme() {
        viewControllerHome.backgroundColor = UIColorFromHex(rgb: 0x2d3e51)
        viewControllerHome.tintColor = UIColorFromHex(rgb: 0xc5d2df)
        
        plusSign.textColor = UIColorFromHex(rgb: 0xb9c8d8)
        equalSign.textColor = UIColorFromHex(rgb: 0xb9c8d8)
        
        billField.backgroundColor = UIColorFromHex(rgb: 0x34485e)
        billField.textColor = UIColorFromHex(rgb: 0xdfe6ed)
        
        tipLabel.textColor = UIColorFromHex(rgb: 0xd2dce6)
        totalLabel.textColor = UIColorFromHex(rgb: 0xd2dce6)
    }
    
    func whiteTheme() {
        viewControllerHome.backgroundColor = UIColorFromHex(rgb: 0xfcfcfc)
        viewControllerHome.tintColor = UIColorFromHex(rgb: 0x007aff)
        
        plusSign.textColor = UIColorFromHex(rgb: 0x007aff)
        equalSign.textColor = UIColorFromHex(rgb: 0x007aff)
        
        billField.backgroundColor = UIColorFromHex(rgb: 0xffffff)
        billField.textColor = UIColor.darkText
        
        tipLabel.textColor = UIColorFromHex(rgb: 0x676767)
        totalLabel.textColor = UIColorFromHex(rgb: 0x676767)
    }
    
    func UIColorFromHex(rgb: UInt) -> UIColor {
        let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgb & 0x0000FF) / 255.0
        
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }

    @IBAction func calculateTip(_ sender: Any) {
        calculateTipHelper()
        let defaults = UserDefaults.standard
        defaults.set(tipControl.selectedSegmentIndex, forKey: "Index")
        defaults.synchronize()
    }
    
    func calculateTipHelper()
    {
        let tipPercentages = [0.18, 0.2, 0.25]
        
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
}
