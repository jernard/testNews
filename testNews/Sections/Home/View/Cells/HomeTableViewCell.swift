//
//  HomeTableViewCell.swift
//  testNews
//
//  Created by Jernard Ducon on 4/02/21.
//

import UIKit
import AlamofireImage

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var newImageView: UIImageView!
    
    override func prepareForReuse() {
        newImageView.image = UIImage()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(new: NewModel) {
        self.categoryLabel.text = new.chapeu
        self.titleLabel.text = new.titulo
        self.descriptionLabel.text = new.linha_fina
        self.dateLabel.text = new.data_hora_publicacao
        setupImage(url: new.imagem)
    }
    
    private func setupImage(url: String) {
        if let url = URL(string: url) {
            let placeholder = UIImage(named: "photo")
            let filter = AspectScaledToFillSizeFilter(size: newImageView.frame.size)
            newImageView.af.setImage(withURL: url, placeholderImage: placeholder, filter: filter)
        } else {
            newImageView.image = .add
        }
    }
    
}
