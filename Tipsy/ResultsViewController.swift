//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Nam on 2/4/25.
//  Copyright © 2025 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingLabel: UILabel!
    
    var eachPersonBill: String?
    var settingText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = eachPersonBill
        settingLabel.text = settingText
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    

}
