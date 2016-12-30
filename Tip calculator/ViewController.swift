//
//  ViewController.swift
//  Tip calculator
//
//  Created by Sang Son on 12/14/16.
//  Copyright © 2016 Heejung Emily Son. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
        
    }

    @IBAction func calculateTip(sender: AnyObject) {
        
        let tipPercentages = [0.18, 0.2, 0.25]
        
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        
        let defaultTipValue = UserDefaults.standard
        let default_tip = defaultTipValue.integer(forKey: "defaultTip")
        print("View Will Appear")
        
        switch default_tip {
        case 0...1:
            tipControl.selectedSegmentIndex = default_tip
        default:
            tipControl.selectedSegmentIndex = 0
        }
        
        //after loading new default tip, recalculate the tip and total
        
        let bill = Double(billField.text!) ?? 0
        let tip = bill * Double(default_tip/100)
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
}

