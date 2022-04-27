//
//  FeedCellTableViewCell.swift
//  
//
//  Created by Michelle Yun on 4/27/22.
//

import UIKit

class FeedCellTableViewCell: UITableViewCell {

    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var mood: UIImageView!
    @IBOutlet weak var skincare: UIImageView!
    @IBOutlet weak var sleep: UIImageView!
    @IBOutlet weak var water: UIImageView!
    @IBOutlet weak var workout: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

} // FeedCellTableViewCell
