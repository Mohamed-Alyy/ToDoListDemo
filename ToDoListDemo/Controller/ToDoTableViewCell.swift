//
//  ToDoTableViewCell.swift
//  ToDoListDemo
//
//  Created by Mohamed Ali on 02/03/2022.
//

import UIKit

class ToDoTableViewCell: UITableViewCell {

    // MARK: - IBOutlet
    
    @IBOutlet weak var backGroundView: UIView!
    @IBOutlet weak var newTaskLBL: UILabel!
    
    
    @IBOutlet weak var UpButtonOutlet: UIButton!
    
    @IBOutlet weak var downBttonOutlet: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    // MARK: - IBAction
    

    
}
