//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var currentPct = 0.1
    var currentSplit = 2
    var eachPayBill : Double?
    var calcResult: String?

    @IBAction func tipChanged(_ sender: UIButton) {
        if sender == zeroPctButton {
            zeroPctButton.isSelected = true
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
            currentPct = 0.0
        } else if sender == tenPctButton {
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = true
            twentyPctButton.isSelected = false
            currentPct = 0.1

        } else {
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = true
            currentPct = 0.2
        }
        
        billTextField.endEditing(true)
        

    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(Int(sender.value))   // stepper의 value에 따라 double형으로 라벨에 값 전달
        currentSplit = Int(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        eachPayBill = ((Double(billTextField.text!) ?? 0) * (1.0 + currentPct)) / Double(currentSplit)
        calcResult = String(format: "%.2f", eachPayBill ?? 0)
//        print(calcResult)
//        print(currentPct + 1.0)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.eachPersonBill = calcResult
            destinationVC.settingText = "Split between \(currentSplit) people with \(currentPct * 100)% tip"
        }
    }
    
    
}

