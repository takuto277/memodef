//
//  HomeTableViewCell.swift
//  memodef
//
//  Created by 小野拓人 on 2023/05/07.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var TitleLabel: UILabel!
    @IBOutlet weak var DetailLabel: UILabel!
    @IBOutlet weak var WhenLabel: UILabel!
    @IBOutlet weak var WhereLabel: UILabel!
    @IBOutlet weak var WhoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
