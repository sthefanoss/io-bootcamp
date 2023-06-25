//
//  ItemTableViewCell.swift
//  Todoey
//
//  Created by Sthefano Schiavon on 25/06/23.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import UIKit

protocol ItemTableViewCellDelegate {
    func deleteCall(_ item : ItemEntity)
    func toggleCall(_ item : ItemEntity)
}

class ItemTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var markButton: UIButton!
    var delegate : ItemTableViewCellDelegate?
    
    var item : ItemEntity!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func update(value: ItemEntity) {
        self.item = value
        titleLabel.text = item.title
        markButton.setImage(
            UIImage(systemName: item.done ? "checkmark.square" : "square"),
            for: .normal
        )
    }
    
    
    @IBAction func deletePressed(_ sender: Any) {
        delegate?.deleteCall(self.item)
    }
    
    
    @IBAction func markPressed(_ sender: Any) {
        delegate?.toggleCall(self.item)
    }
}
