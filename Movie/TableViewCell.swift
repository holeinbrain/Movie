//
//  TableViewCell.swift
//  Movie
//
//  Created by Anton Levin on 03.12.2020.
//

import UIKit
class TableViewCell: UITableViewCell {
    @IBOutlet var title: UILabel!
    @IBOutlet var moviePoster: UIImageView!
    
    @IBOutlet var year: UILabel!
    @IBOutlet var rating: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
