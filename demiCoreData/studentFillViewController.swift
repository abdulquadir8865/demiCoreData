//
//  studentFillViewController.swift
//  demiCoreData
//
//  Created by Droisys on 24/08/23.
//

import UIKit

class studentFillViewController: UIViewController {


    
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPhone: UITextField!
    
    var college:College?
    var indexRow = Int()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveData(_ sender: Any) {
        
        guard let name = txtName.text else{ return}
        guard let email = txtEmail.text else{ return}
        guard let phone = txtPhone.text else{ return}
        
        guard let mainCollege = college else{return} //colllege pass kia
        
        var stuDict = [
            "studentName" : name,
            "studentEmail" : email,
            "studentPhone" : phone
            
        ]
        
        databaseHandler.shareInstance.saveStudentData(studentDict: stuDict, college: college!)
        self.navigationController?.popViewController(animated: true)
    }
    
}
