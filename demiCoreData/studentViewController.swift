//
//  studentViewController.swift
//  demiCoreData
//
//  Created by Droisys on 24/08/23.
//

import UIKit

class studentViewController: UIViewController {

    
    @IBOutlet weak var stuTable: UITableView!
    var arrStudent = [Student]()
    
    //reletion
    var college:College?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //by default register cell
        stuTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
  
    override func viewWillAppear(_ animated: Bool) {
        self.arrStudent = databaseHandler.shareInstance.getcStudentData()

        if college?.students?.allObjects != nil{
            arrStudent = college?.students?.allObjects as! [Student]   // Student get kie
        }
//        arrStudent = databaseHandler.shareInstance.StudentgetAllData()
        stuTable.reloadData()   // after save reloaddata

    }
    
    @IBAction func addStudent(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "studentFillViewController") as! studentFillViewController
        vc.college = college
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
}


extension studentViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrStudent.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = stuTable.dequeueReusableCell(withIdentifier: "cell")
        if cell != nil{
            cell = UITableViewCell(style: .value2, reuseIdentifier: "cell")
        }
        cell?.textLabel?.text = arrStudent[indexPath.row].name
        cell?.detailTextLabel?.text = arrStudent[indexPath.row].phone
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        databaseHandler.shareInstance.deleteStudentData(index: indexPath.row)
        stuTable.reloadData()
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            arrStudent = databaseHandler.shareInstance.deleteStudentData(index: indexPath.row)
            //            arrCollege.remove(at: indexPath.row)
            self.stuTable.deleteRows(at: [indexPath], with: .automatic)
            
        }
        
        
    }
}
