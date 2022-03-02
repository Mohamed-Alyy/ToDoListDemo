//
//  NewTaskViewController.swift
//  ToDoListDemo
//
//  Created by Mohamed Ali on 02/03/2022.
//

import UIKit

class NewTaskViewController: UIViewController {
    
    // MARK: - ================== Variables ==================
    
    var delegate: getTaskProtocol?
    

    // MARK: - ================== IBOutlet ==================
    
    
    @IBOutlet weak var newTaskTextField: UITextField!{
        didSet{
            newTaskTextField.layer.cornerRadius = 5
            
        }
    }
    @IBOutlet weak var backGroundView: UIView!{
        didSet{
            backGroundView.layer.cornerRadius = 10
        }
    }
    
    
    @IBOutlet weak var addTaskButnOutlet: UIButton!{
        didSet{
            addTaskButnOutlet.layer.cornerRadius = 8
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newTaskTextField.delegate=self
       // newTaskTextField.resignFirstResponder()
    }
    

   
    @IBAction func addTaskButnPressed(_ sender: UIButton) {
        
        newTaskTextField.endEditing(true)
        
    }
    
 
    
    // MARK: - ================== add new task ==================
    
    func addNewTask(){
        guard newTaskTextField.text?.isEmpty == false else {return}
        if let task = newTaskTextField.text {
            delegate?.getData(newTask: task)
        }
        navigationController?.popViewController(animated: true)
    }
    


}

    // MARK: - ================== UiTextField delegate ==================

extension NewTaskViewController: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    
        textField.endEditing(true)
        return true
    }
    
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        
        if textField.text == "" {
            textField.placeholder = "برجاء كتابة مهمة جديدة لإضافتها"
            return false
        }else{
            return true
        }
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        addNewTask()
    }
}


