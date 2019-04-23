//
//  DocumentsCell.swift
//  RestApi
//
//  Created by Vidzemes Augstkola on 02/04/2019.
//  Copyright © 2019 Vidzemes Augstkola. All rights reserved.
//

import UIKit

class DocumentsCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var btnDown: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
