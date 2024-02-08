//
//  BudgetViewController.swift
//  Flagler Student
//
//  Created by Jeremy Wang on 2/6/24.
//

import UIKit


class BudgetViewController: UIViewController {

    //Put the IBOutlet before the viewDidLoad
    
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var tuitionTextField: UITextField!
        
    @IBOutlet weak var scholarshipTextField: UITextField!
    
    @IBOutlet weak var balanceLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //Put the IBActions right after the viewDidLoad
    
    @IBAction func calculateButton(_ sender: UIButton) {
        
        //Get input from storyboard
        let name = nameTextField.text! //unwrapping by using the ! symbol
        let tuition = Double(tuitionTextField.text!)
        let scholarship = Double(scholarshipTextField.text!)
        
        //Processing
        let balance = tuition! - scholarship!
        
        //Output - it's best to use interpolation in Swift!
        balanceLabel.text = "Welcome, \(name)! Your balance is: \(balance.formatted(.currency(code:"USD")))"
        
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
