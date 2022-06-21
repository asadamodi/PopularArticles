//
//  ArticleListTableViewCell.swift
//  PopularArticles
//
//  Created by Asad on 22/06/22.
//

import UIKit

class ArticleListTableViewCell: UITableViewCell {

    @IBOutlet weak var m_thumbnailImageView: UIImageView!
    @IBOutlet weak var m_titleLabel: UILabel!
    
    @IBOutlet weak var m_subTitleLabel: UILabel!
    
    
    @IBOutlet weak var m_dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
