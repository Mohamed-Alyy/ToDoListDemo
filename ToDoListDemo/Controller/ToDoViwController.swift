//
//  ViewController.swift
//  ToDoListDemo
//
//  Created by Mohamed Ali on 02/03/2022.
//

import UIKit
    // MARK: - ================== Delegate Protocol ==================
protocol getTaskProtocol {
    func getData(newTask: String)
}


class ToDoViwController: UIViewController {


    // MARK: - ================== IBOutlet ==================
    
    @IBOutlet weak var toDoTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        toDoTableView.dataSource=self
        toDoTableView.delegate=self
    }
    
    
    // MARK: - ================== Variables ==================
    
    var taskArray: [List] = []

    
    // MARK: - ================== IBAction ==================
    
    @IBAction func editBttonPressed(_ sender: UIBarButtonItem) {
       
        toDoTableView.isEditing = !toDoTableView.isEditing

    }
    

    @IBAction func newTaskButtonPressed(_ sender: UIBarButtonItem) {
       // performSegue(withIdentifier: K.newTaskSegue, sender: self)
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let newTaskVC = segue.destination as? NewTaskViewController else {return}
        
        newTaskVC.delegate = self
    }
    
}

// MARK: - ================== delegate protocle implementaion ==================

extension ToDoViwController: getTaskProtocol {
    
    func getData(newTask: String) {
        taskArray.append(List(taskName: newTask))
       // print("the new task is: \(newTask)")
        toDoTableView.reloadData()
        
    }
}



// MARK: - ================== Table Data Source ==================

extension ToDoViwController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        taskArray.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: K.toDoCellid, for: indexPath) as? ToDoTableViewCell {
            
            let currentTask = taskArray[indexPath.row]
            cell.newTaskLBL.text = currentTask.taskName
    
            return cell
        }
        return UITableViewCell()
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath){
            
            if cell.accessoryType == .checkmark{
                cell.accessoryType = .none
            }else{
                cell.accessoryType = .checkmark
            }
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    

}


// MARK: - ================== Table View Delegate ==================

extension ToDoViwController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        K.screenHight / 14
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        taskArray.remove(at: indexPath.row)
        tableView.reloadData()
        
    }
    
    
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        taskArray.swapAt(sourceIndexPath.row, destinationIndexPath.row)
    }
}
