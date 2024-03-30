//
//  ViewController.swift
//  demiCoreData
//
//  Created by Droisys on 21/08/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    
    var arrCollege = [College]()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.arrCollege = databaseHandler.shareInstance.getclgData()
    }
    override func viewWillAppear(_ animated: Bool) {
        self.arrCollege = databaseHandler.shareInstance.getclgData()
        tableView.reloadData()

    }


    @IBAction func AddBtn(_ sender: Any) {
        
        let clgForm = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        
        self.navigationController?.pushViewController(clgForm, animated: true)
    }
}

extension ViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrCollege.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        cell.clg = arrCollege[indexPath.row]
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController
        
        vc?.clgDetails = arrCollege[indexPath.row]
        vc?.indexRow = indexPath.row    // edit index k lie
        arrCollege.remove(at: indexPath.row)
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
        
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            arrCollege = databaseHandler.shareInstance.deleteClgData(index: indexPath.row)
//            arrCollege.remove(at: indexPath.row)
           self.tableView.deleteRows(at: [indexPath], with: .automatic)
           
        }

    }
    
}

