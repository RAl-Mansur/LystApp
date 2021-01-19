//
//  CatBreedCollectionViewCell.swift
//  LystApp
//
//  Created by Ridwan Al-Mansur on 19/01/2021.
//

import UIKit
import Kingfisher

class CatBreedCollectionViewCell: UICollectionViewCell {

    static let reuseIdentifier = "CatBreedCell"
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configureWith(breed: CatBreed) {
        
        if let imageData = breed.image,
           let urlString = imageData.url,
           let url = URL(string: urlString) {
            
            let id = imageData.id ?? UUID().uuidString
            let resource = ImageResource(downloadURL: url, cacheKey: id)
            imageView.kf.setImage(with: resource)
        }
        nameLabel.text = breed.name
    }
 
    static func nib() -> UINib {
        return UINib(nibName: "CatBreedCollectionViewCell", bundle: nil)
    }
}
