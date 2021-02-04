//
//  HomeDetailViewController.swift
//  testNews
//
//  Created by Jernard Ducon on 4/02/21.
//

import UIKit
import AlamofireImage

class HomeDetailViewController: UIViewController, HomeDetailViewControllerProtocol {

    

    var presenter: HomeDetailPresenterProtocol?
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var headerImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var detailTextArea: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.fetchDetailNews()
    }
    
    func setup(presenter: HomeDetailPresenterProtocol) {
        self.presenter = presenter
    }
    
    func didFetchDetailNew(model: FullNewModel) {
        let documento = model.documento
        self.categoryLabel.text = documento.editoria
        self.titleLabel.text = documento.titulo
        self.authorLabel.text = documento.credito
        self.dateLabel.text = documento.datapub
        setupImage(url: documento.imagem ?? "")
        setDetailNew(detail: documento.corpoformatado ?? "")
    }
    
    private func setupImage(url: String) {
        if let url = URL(string: url) {
            let placeholder = UIImage(named: "photo")
            let filter = AspectScaledToFillSizeFilter(size: headerImageView.frame.size)
            headerImageView.af.setImage(withURL: url, placeholderImage: placeholder, filter: filter)
        } else {
            let placeholder = UIImage(named: "photo")
            headerImageView.image = placeholder
        }
    }
    
    private func setDetailNew(detail: String) {
        detailTextArea.attributedText = detail.htmlToAttributedString
    }
}
