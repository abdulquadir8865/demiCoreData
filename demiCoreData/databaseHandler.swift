//
//  databaseHandler.swift
//  demiCoreData
//
//  Created by Droisys on 21/08/23.
//

import UIKit
import CoreData
class databaseHandler: NSObject {
    
  static  let shareInstance = databaseHandler()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    // college data
    func saveCollegeData(clgDict:[String:String]){
        let college = NSEntityDescription.insertNewObject(forEntityName: "College", into: context) as! College
        college.name = clgDict["collegeName"]
        college.address = clgDict["collegeAddress"]
        college.city = clgDict["collegeCity"]
        college.university = clgDict["collegeUniversity"]
        do{
            try context.save()
        }
        catch{
            print("error college")
        }
        
    }
    //fetch clgData
    func getclgData()->[College]{
        var arrClg = [College]()
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "College")
        do{
            arrClg = try context.fetch(fetchRequest) as! [College]
            print(arrClg)
        }catch{
            print("error")
        }
        
        return arrClg
        
    }
    
    // delete collegedata
    func deleteClgData(index:Int)->[College]{
        var collegeData = self.getclgData()//getdata
        context.delete(collegeData[index])//remove from coredata
        collegeData.remove(at: index) // remove from array clg.
        do{
            try context.save()
            
        }catch{
            print("error")
        }
        return collegeData
    }

    //for edit collegedata
    func editCollegeData(clgDict:[String:String],indx:Int){
        var college = self.getclgData()
        //originaldata                , pass krega then save krega
        college[indx].name = clgDict["collegeName"]  //editdata 
        college[indx].address = clgDict["collegeAddress"]
        college[indx].city = clgDict["collegeCity"]
        college[indx].university = clgDict["collegeUniversity"]
        
        do{
            try context.save()
        }catch{
            print("error failed")
        }
    }
    
    
    
    //for student data
    func saveStudentData(studentDict:[String:String],college:College){
        let student = NSEntityDescription.insertNewObject(forEntityName: "Student", into: context) as! Student
        student.name =  studentDict[ "studentName"]
        student.email =  studentDict[ "studentEmail"]
        student.phone =  studentDict[ "studentPhone"]
        student.toCollege = college
        do{
            try context.save()
        }
        catch{
            print("error student")
        }

    }
    
    //alldata for student
    func StudentgetAllData()->[Student]{
        var arrStudent = [Student]()

        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Student")
        do{
            arrStudent = try context.fetch(fetchRequest) as! [Student]
            print(arrStudent)
        }catch{
            print("error")
        }
        return arrStudent
        
    }
    
    //fetch student
    func getcStudentData()->[Student]{
        var arrClg = [Student]()
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Student")
        do{
            arrClg = try context.fetch(fetchRequest) as! [Student]
            print(arrClg)
        }catch{
            print("error")
        }
        
        return arrClg
        
    }

    
    func deleteStudentData(index:Int)->[Student]{   // indexpath cell select k lie
        var studentData = self.getcStudentData()//getdata
        context.delete(studentData[index])//remove from coredata
        studentData.remove(at: index) // remove from array contact.
        do{
            try context.save()
            print(studentData)
        }catch{
            print("error")
        }
        return studentData
    }
    
}
