//
//  ViewController.swift
//  Flagler Student
//
//  Created by Jeremy Wang on 1/25/24.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var welcomeMsg: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func submitButton(_ sender: UIButton) {
        
        welcomeMsg.text = "hello world!"
    }
    
}

