//
//  BudgetViewController.swift
//  Flagler Student
//
//  Created by Jeremy Wang on 2/6/24.
//  Last updated by J.W. on 2/22/24

import UIKit


class BudgetViewController: UIViewController, UITextFieldDelegate {

    //Put the IBOutlet before the viewDidLoad
    
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var tuitionTextField: UITextField!
        
    @IBOutlet weak var scholarshipTextField: UITextField!
    
    @IBOutlet weak var gradeLevelTextField: UITextField!
    
    @IBOutlet weak var honorSwitch: UISwitch!
    
    
    @IBOutlet weak var balanceLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //This can be used to initialize values or DB lookups
        honorSwitch.isOn = false
        balanceLabel.isHidden = true
        
        //Hide/show virtual keyboard
        nameTextField.delegate = self
        tuitionTextField.delegate = self
        scholarshipTextField.delegate  = self
        gradeLevelTextField.delegate = self
        
    }
    
    //Put the IBActions right after the viewDidLoad
    
    @IBAction func calculateButton(_ sender: UIButton) {
        
        /*
        //Get input from storyboard
        let name = nameTextField.text! //unwrapping by using the ! symbol
        let tuition = Double(tuitionTextField.text!)
        let scholarship = Double(scholarshipTextField.text!)
        
        //Processing
        let balance = tuition! - scholarship!
        
        //Output - it's best to use interpolation in Swift!
        balanceLabel.text = "Welcome, \(name)! Your balance is: \(balance.formatted(.currency(code:"USD")))"
        */
        
        balanceLabel.isHidden = false
        
        // Validate name field
        guard let name = nameTextField.text, !name.isEmpty else {
            balanceLabel.text = "Please enter a valid name!"
            return
        }
        
       
        // Validate tuition field
        guard let tuitionText = tuitionTextField.text, !tuitionText.isEmpty, let tuition = Double(tuitionText) else {
            balanceLabel.text = "Please enter a valid tuition amount!"
            return
        }
        
        // Validate scholarship field
        guard let scholarshipText = scholarshipTextField.text, !scholarshipText.isEmpty, let scholarship = Double(scholarshipText) else {
            balanceLabel.text = "Please enter a valid scholarship amount!"
            return
        }
        
        // Validate grade level field
        guard let gradeLevel = gradeLevelTextField.text, !gradeLevel.isEmpty else {
            balanceLabel.text = "Please enter a valid grade level!"
            return
        }
        
        
        // Calculate initial balance
        var balance = tuition - scholarship
        
        // Apply honor student discount
        if honorSwitch.isOn {
            balance *= 0.90 // 10% discount
        }
        
        // Normalize gradeLevel for comparison
        let normalizedGradeLevel = gradeLevel.lowercased()
        
        // Apply grade-level discounts
        switch normalizedGradeLevel {
            case "senior":
                balance *= 0.95 // 5% discount
            case "junior":
                balance *= 0.97 // 3% discount
            case "sophomore":
                balance *= 0.98 // 2% discount
            case "freshman":
                balance *= 1.00 // No discount
            default:
                balanceLabel.text = "Please enter a valid grade level!"
                return
        }
        
        // Display balance recommendation
        if balance > 10_000 {
            balanceLabel.text = "\(name), your balance is \(balance.formatted(.currency(code: "USD"))). Please consider a student loan."
        } else {
            balanceLabel.text = "\(name), your balance is \(balance.formatted(.currency(code: "USD")))."
        }

        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Dismiss the keyboard
        textField.resignFirstResponder()
        return true
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
