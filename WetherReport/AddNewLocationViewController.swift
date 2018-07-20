//
//  AddNewLocationViewController.swift
//  WetherReport
//
//  Created by Hari Priyanka on 20/07/18.
//  Copyright © 2018 JNET. All rights reserved.
//

import UIKit
import CoreData

class AddNewLocationViewController: UIViewController {

    
    @IBOutlet var locationnameTextField: UITextField!
    
    @IBOutlet var tempTextField: UITextField!
    
    @IBOutlet var saveButton: UIButton!
    
    @IBAction func saveButtonAction(_ sender: Any) {
        
        let locationName: String = locationnameTextField.text!
        let temp: String = tempTextField.text!
        
        guard locationName.count > 0 else {
           return showAlert(title:"Alert", message: "Please enter valid location")
        }
        guard temp.count > 0 else {
            return showAlert(title:"Alert", message: "Please enter valid location")
        }
        
        savedata(location:locationName, t:temp)
        
        
        
        
    }
    
    
    func savedata(location: String, t: String) {
        
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Wether", in:context)
        
        let wetherdata = NSManagedObject(entity: entity!, insertInto: context)
        
        
        wetherdata.setValue(location, forKey: "area")
        wetherdata.setValue(t, forKey: "temperature")
        
        do {
            
            try context.save()
            self.navigationController?.popViewController(animated: true)
            
        } catch {
            
            showAlert(title: "Alert", message: "Failed saving")
        }
        
        
    }
    
    
    
    func showAlert(title: String,message: String)
    {
        let actionSheetController: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let cancelAction: UIAlertAction = UIAlertAction(title: "OK", style: .cancel) { action -> Void in
            //Just dismiss the action sheet
        }
        actionSheetController.addAction(cancelAction)
        self.present(actionSheetController, animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


extension AddNewLocationViewController: UITextFieldDelegate {
    
    
    /*
     public func textFieldShouldBeginEditing(_ textField: UITextField) {
        return true
    }
    
    
     public func textFieldDidBeginEditing(_ textField: UITextField)
    {
    }
    
    
     public func textFieldShouldEndEditing(_ textField: UITextField) {
        
    }
    
    
    
     public func textFieldDidEndEditing(_ textField: UITextField){
    
    }
    
     public func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
    
    }
    
    
     public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) {
        
    }
    
    
     public func textFieldShouldClear(_ textField: UITextField) {
    
    
    }
    
     public func textFieldShouldReturn(_ textField: UITextField)
    {
        return true
    }
    */
    
    
}
