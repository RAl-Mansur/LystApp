//
//  CatBreedCollectionViewCell.swift
//  LystApp
//
//  Created by Ridwan Al-Mansur on 19/01/2021.
//

import UIKit

class CatBreedCollectionViewCell: UICollectionViewCell {

    static let reuseIdentifier = "CatBreedCell"
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configureWith(breed: CatBreed) {
        imageView.image = #imageLiteral(resourceName: "example")
        nameLabel.text = breed.name
    }
 
    static func nib() -> UINib {
        return UINib(nibName: "CatBreedCollectionViewCell", bundle: nil)
    }
}
