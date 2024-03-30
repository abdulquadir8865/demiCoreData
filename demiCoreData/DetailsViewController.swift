//
//  DetailsViewController.swift
//  demiCoreData
//
//  Created by Droisys on 21/08/23.
//

import UIKit

class DetailsViewController: UITableViewController {

    @IBOutlet weak var lblname: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var lblcity: UILabel!
    @IBOutlet weak var lbluniversity: UILabel!
    @IBOutlet weak var lblStudents: UILabel!
    
    
    var clgDetails:College?
    var indexRow = Int()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        lblname.text = clgDetails?.name
        lblAddress.text = clgDetails?.address
        lblcity.text = clgDetails?.city
        lbluniversity.text = clgDetails?.university
        
        //relation  // for count of student
        if let student = clgDetails?.students?.allObjects as? [Student]{
            lblStudents.text = "\(student.count)"
        }else{
            lblStudents.text = "0"
        }

    }

    @IBAction func editBtn(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        vc.name = lblname.text!  //for name
        vc.isUpdate = true
        vc.collegeDetails = clgDetails
        vc.indexRow = indexRow
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    //reletion
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 4{
            let vc2 = storyboard?.instantiateViewController(withIdentifier: "studentViewController") as! studentViewController
            vc2.college = clgDetails
            self.navigationController?.pushViewController(vc2, animated: true)
        }else if indexPath.row == 5{
            let vc2 = storyboard?.instantiateViewController(withIdentifier: "UniverSityViewController") as! UniverSityViewController
            self.navigationController?.pushViewController(vc2, animated: true)
        }
       
    }
}
