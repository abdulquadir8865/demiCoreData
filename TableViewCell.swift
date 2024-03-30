//
//  TableViewCell.swift
//  demiCoreData
//
//  Created by Droisys on 21/08/23.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var lblName: UILabel!
    
    @IBOutlet weak var lblAddress: UILabel!
    
    @IBOutlet weak var lblCity: UILabel!
    
    
    @IBOutlet weak var lblUniversity: UILabel!
    
    var clg:College?{
        didSet{
            lblName.text = clg!.name ?? ""
            lblAddress.text = clg!.address ?? ""
            lblCity.text = clg!.city ?? ""
            lblUniversity.text = clg?.university ?? ""
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
