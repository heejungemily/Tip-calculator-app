//
//  SettingsViewController.swift
//  Tip calculator
//
//  Created by Sang Son on 12/29/16.
//  Copyright © 2016 Heejung Emily Son. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    
    @IBOutlet weak var defaultTipControl: UISegmentedControl!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func setDefaultTip(_ sender: UISegmentedControl) {
        let defaultTipValue = UserDefaults.standard
        
        defaultTipValue.set(sender.selectedSegmentIndex, forKey: "defaultTip")
        defaultTipValue.synchronize()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let defaultTipValue = UserDefaults.standard
        let default_tip = defaultTipValue.integer(forKey: "defaultTip")
        print("View Will Appear")
        
        switch default_tip {
        case 0...1:
        defaultTipControl.selectedSegmentIndex = default_tip
        default:
        defaultTipControl.selectedSegmentIndex = 0
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("View Has Appeared")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("View Will Disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    print("View Has Disappeared")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

   
}
