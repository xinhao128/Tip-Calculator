//
//  SettingsViewController.swift
//  Tip Calculator
//
//  Created by Xinhao Liang on 12/28/18.
//  Copyright © 2018 Xinhao Liang. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet var viewSettings: UIView!
    @IBOutlet weak var labelTip: UILabel!
    @IBOutlet weak var labelTheme: UILabel!
    @IBOutlet weak var defaultTip: UISegmentedControl!
    @IBOutlet weak var defaultTheme: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let defaults = UserDefaults.standard
        defaultTip.selectedSegmentIndex = defaults.integer(forKey: "Index")
        defaultTheme.selectedSegmentIndex = defaults.integer(forKey: "IndexTheme")
        
        if (defaultTheme.selectedSegmentIndex == 1) {
            darkTheme()
        }
        else {
            whiteTheme()
        }
    }
    
    func darkTheme() {
        viewSettings.backgroundColor = UIColorFromHex(rgb: 0x2d3e51)
        viewSettings.tintColor = UIColorFromHex(rgb: 0xc5d2df)
        
        labelTip.textColor = UIColorFromHex(rgb: 0xc5d2df)
        labelTheme.textColor = UIColorFromHex(rgb: 0xc5d2df)
    }
    
    func whiteTheme() {
        viewSettings.backgroundColor = UIColorFromHex(rgb: 0xfcfcfc)
        viewSettings.tintColor = UIColorFromHex(rgb: 0x007aff)
        
        labelTip.textColor = UIColor.darkText
        labelTheme.textColor = UIColor.darkText
    }
    
    func UIColorFromHex(rgb: UInt) -> UIColor {
        let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgb & 0x0000FF) / 255.0
        
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
    @IBAction func setDefaultTipPercentage(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.set(defaultTip.selectedSegmentIndex, forKey: "Index")
        defaults.synchronize()
    }
    
    @IBAction func setDefaultThemeColor(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.set(defaultTheme.selectedSegmentIndex, forKey:"IndexTheme")
        defaults.synchronize()
        
        if (defaultTheme.selectedSegmentIndex == 1) {
            darkTheme()
        }
        else {
            whiteTheme()
        }
    }
}
