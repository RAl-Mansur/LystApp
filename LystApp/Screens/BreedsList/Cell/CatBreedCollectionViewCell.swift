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
    static let cellSize = CGSize(width: 180, height: 200)
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    // MARK: - View setup
    
    private func setupView() {
        imageView.layer.cornerRadius = 10.0
        imageView.clipsToBounds = true
        
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 15.0
        contentView.layer.borderWidth = 1.0
        contentView.layer.borderColor = UIColor.clear.cgColor
        contentView.layer.masksToBounds = true

        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 0.2)
        layer.shadowRadius = 6.0
        layer.shadowOpacity = 0.2
        layer.masksToBounds = false
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: contentView.layer.cornerRadius).cgPath
        layer.backgroundColor = UIColor.clear.cgColor
    }
    
    // MARK: - Configuration

    func configureWith(breed: CatBreed) {
        if let imageData = breed.image,
           let urlString = imageData.url,
           let url = URL(string: urlString) {
            
            let id = imageData.id ?? UUID().uuidString
            let resource = ImageResource(downloadURL: url, cacheKey: id)
            imageView.kf.setImage(with: resource)
            imageView.kf.setImage(with: resource,
                                  placeholder: UIImage(named: "placeholder"))
        }
        
        
        nameLabel.text = breed.name
    }
 
    static func nib() -> UINib {
        return UINib(nibName: "CatBreedCollectionViewCell", bundle: nil)
    }
    
    // MARK: - Animation
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        UIView.animate(withDuration: 0.5) {
            self.transform = .init(scaleX: 0.95, y: 0.95)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        UIView.animate(withDuration: 0.5) {
            self.transform = .identity
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        UIView.animate(withDuration: 0.5) {
            self.transform = .identity
        }
    }
}
