//
//  BudgetViewController.swift
//  Flagler Student
//
//  Created by Jeremy Wang on 2/6/24.
//

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
        if let name = nameTextField.text, !name.isEmpty, let gradeLevel = gradeLevelTextField.text, !gradeLevel.isEmpty{
            //Attempt to covert tuition and scholarship into double type, using optional binding)
            if let tuition = Double(tuitionTextField.text ?? ""), let scholarship = Double(scholarshipTextField.text ?? ""){
                //main logic here
                
                var balance = tuition - scholarship
                
                //implement the honor studnet discount
                if honorSwitch.isOn {
                    balance = balance * (1 - 0.1)
                }
                
                //implement the grade discount logic
                let gradeLevel = gradeLevelTextField.text?.lowercased()
                switch gradeLevel {
                case "senior":
                    //balance = balance * ( 1- 0.05) //reduce balance by 5%
                    balance *= 0.95
                case "junior":
                    balance *= 0.97
                case "sophmore":
                    balance *= 0.98
                case "freshman":
                    balance *= 1.00
                default:
                    balanceLabel.text = "Please enter a valid grade"
                    //print("Please enter a valid grade") //This will go to the console for debugging
                    
                }
                
                //make recommendation based the balance
                if balance > 10000 {
                    balanceLabel.text = "\(name), your balance is \(balance.formatted(.currency(code: "USD"))). Please consider a student loan."
                }else{
                    balanceLabel.text = "\(name), your balance is \(balance.formatted(.currency(code: "USD")))."
                }              
               
                
            }else{
                balanceLabel.text = "Please enter valid numbers for tuition and scholarship!"
            }
            
        }else{
            balanceLabel.text = "Please enter valid name and grade!"
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
