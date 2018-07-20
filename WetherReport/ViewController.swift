//
//  ViewController.swift
//  WetherReport
//
//  Created by Hari Priyanka on 20/07/18.
//  Copyright © 2018 JNET. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    
    var names: [String] = []

    @IBOutlet var addNewPlacesButton: UIBarButtonItem!
    
    @IBAction func addNewPlacesButtonAction(_ sender: Any) {
        let addNewAreaVC = storyboard?.instantiateViewController(withIdentifier: "AddNewLocationViewController") as! AddNewLocationViewController
        self.navigationController?.pushViewController(addNewAreaVC, animated: true)
        
    }
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
       
        
       
        
        //let entity = NSEntityDescription.entity(forEntityName: "Users", in: context)
        //let newUser = NSManagedObject(entity: entity!, insertInto: context)
        
        
    }
    
    
    var result = [NSManagedObject]()

    override func viewWillAppear(_ animated: Bool) {
        
        
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Wether", in:context)
        
        /*
        let wetherdata = NSManagedObject(entity: entity!, insertInto: context)
        
        
        wetherdata.setValue("Hyderabad", forKey: "area")
        wetherdata.setValue("32", forKey: "temperature")
        
        
        do {
            
            try context.save()
            
        } catch {
            
            print("Failed saving")
        }
        */
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Wether")
        //request.predicate = NSPredicate(format: "age = %@", "12")
        request.returnsObjectsAsFaults = false
        
        //names = request as! [NSManagedObject]
   
        do {
            result = try context.fetch(request) as! [NSManagedObject]
            for data in result as! [NSManagedObject] {
                print(data.value(forKey: "area") as! String)
                print (data.value(forKey: "temperature") as! String)
            }
            
            
            
        } catch {
            
            print("Failed")
        }
        
        tableView.reloadData()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return result.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier", for: indexPath)
        
        
        cell.textLabel?.text = result[indexPath.row].value(forKey: "area") as? String

        return cell

    }
    
//    let cell = tableView.dequeueReusableCellWithIdentifier("ItemCell", forIndexPath: indexPath)
//    let myItem = items[indexPath.row]
//
//    cell.textLabel?.text = myItem.name
//    cell.detailTextLabel?.text = myItem.addedByUser
    
    
}
