//
//  FamousFilmTableViewCell.swift
//  PopularFilmApplication
//
//  Created by IPS-153 on 06/10/22.
//

import UIKit

class FamousFilmTableViewCell: UITableViewCell {

    @IBOutlet weak var lblFilmTitle: UILabel!
    @IBOutlet weak var lblRelaseDate: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var imgFilmImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(secType:ViewControllerSec,apiDate:Results) {
        switch secType {
        case .title:
            break
        case .list:
            DispatchQueue.main.async {
                self.lblFilmTitle.text = apiDate.title
                self.lblRelaseDate.text = apiDate.release_date
                self.lblDescription.text = apiDate.overview
                let url = URL(string:"\(Utilies.shared.imageUrl)/\(apiDate.poster_path)")
                    if let data = try? Data(contentsOf: url!)
                    {
                        self.imgFilmImageView.image = UIImage(data: data)
                    }
            }
            
        }
    }

}
