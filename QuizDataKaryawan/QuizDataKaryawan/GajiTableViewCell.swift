//
//  GajiTableViewCell.swift
//  QuizDataKaryawan
//
//  Created by DOTS2 on 10/27/17.
//  Copyright © 2017 Arjuna. All rights reserved.
//

import UIKit

class GajiTableViewCell: UITableViewCell {

    @IBOutlet weak var labelGajiii: UILabel!
    @IBOutlet weak var labelGolong: UILabel!
    @IBOutlet weak var labelStafff: UILabel!
    @IBOutlet weak var labelNama: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
