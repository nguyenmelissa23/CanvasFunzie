//
//  PostCell.swift
//  InstaMoment
//
//  Created by Melissa Phuong Nguyen on 2/25/18.
//  Copyright © 2018 Melissa Phuong Nguyen. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {
    
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var imageCaptLabel: UILabel!
    
    var post: [String: Any] = [:]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
