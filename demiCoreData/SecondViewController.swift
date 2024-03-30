//
//  SecondViewController.swift
//  demiCoreData
//
//  Created by Droisys on 21/08/23.
//

import UIKit

class SecondViewController: UIViewController {
    
    
    // outlets
    @IBOutlet weak var textName: UITextField!
    
    @IBOutlet weak var textAddress: UITextField!
    @IBOutlet weak var txtCity: UITextField!
    
    @IBOutlet weak var txtUniversity: UITextField!
    
    @IBOutlet weak var view1: UIView!
    
    
    @IBOutlet weak var saveBtn: UIButton!   //btn outlet for edit update
    
    var name = ""
    
    
    //edit
    var isUpdate = false
    var indexRow = Int()
    
    var collegeDetails:College?
    
    //view lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        textName.text = name
        view1.layer.cornerRadius = 20
        self.view1.layer.masksToBounds = true
        // Do any additional setup after loading the view.
        
        self.textName.text = collegeDetails?.name
        self.textAddress.text = collegeDetails?.address
        self.txtCity.text = collegeDetails?.city
        self.txtUniversity.text = collegeDetails?.university
        
        textName.text = name
    }
    
    //willapper me use krenge
    override func viewWillAppear(_ animated: Bool) {
        if isUpdate{
            saveBtn.setTitle("Update", for: .normal)
        }else{
            saveBtn.setTitle("Save", for: .normal)
        }
    }
}

// action
    extension SecondViewController{
        
    @IBAction func sabBtn(_ sender: Any) {
        self.collegeSaveData()
 
        self.navigationController?.popViewController(animated: true)

        
    }
    
}


//action methods
extension SecondViewController{
    
    func collegeSaveData(){
        
        guard let collegeName = textName.text else {return}
        guard let collegeAddress = textAddress.text else {return}
        guard let collegeCity = txtCity.text else {return}
        guard let collegeUniversity = txtUniversity.text else {return}

        
        let collegeDict = [
            "collegeName" : collegeName,
            "collegeAddress" : collegeAddress,
            "collegeCity" : collegeCity,
            "collegeUniversity" : collegeUniversity,
        ]
        
        // check for dataupdate
        if isUpdate{
            //for eidt
            databaseHandler.shareInstance.editCollegeData(clgDict: collegeDict, indx: indexRow)
            isUpdate = false
        }else{
            //for save
            databaseHandler.shareInstance.saveCollegeData(clgDict: collegeDict)

        }


        
    }
}


