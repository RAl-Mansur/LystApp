//
//  CatBreedDetailViewController.swift
//  LystApp
//
//  Created by Ridwan Al-Mansur on 19/01/2021.
//

import UIKit
import Kingfisher

class CatBreedDetailViewController: UIViewController {

    // MARK: - Properties/View
    
    private let margin: CGFloat = 24.0
    var viewModel: CatBreedDetailViewModel
    
    private(set) var imageView = UIImageView()
    
    private(set) var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        return label
    }()
    
    private(set) var temperamentLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
        return label
    }()
    
    private(set) var wikiLinkLabel: UITextView = {
        let textView = UITextView()
        textView.isEditable = false
        textView.backgroundColor = .clear
        textView.textAlignment = .center
        textView.font = .systemFont(ofSize: 16, weight: .medium)
        return textView
    }()
    
    private(set) var energyLevel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    // MARK: - Lifecycle
    
    required init(viewModel: CatBreedDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .bgColor
        imageView.contentMode = .scaleAspectFit
        navBarSetup()
        labelsSetup()
        setupConstraints()
        setViews()
    }

    
    // MARK: - Setup
    
    private func navBarSetup() {
        title = viewModel.breed.name
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func labelsSetup() {
        [nameLabel, energyLevel, temperamentLabel]
            .forEach {
                $0.numberOfLines = 0
                $0.textAlignment = .center
            }
    }

    private func setupConstraints() {
        [imageView, nameLabel, energyLevel, temperamentLabel, wikiLinkLabel]
            .forEach {
                $0.translatesAutoresizingMaskIntoConstraints = false
                view.addSubview($0)
            }
        
        NSLayoutConstraint.activate([
            wikiLinkLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -margin),
            wikiLinkLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            wikiLinkLabel.widthAnchor.constraint(equalToConstant: 120),
            wikiLinkLabel.heightAnchor.constraint(equalToConstant: 30),
            
            temperamentLabel.bottomAnchor.constraint(equalTo: wikiLinkLabel.topAnchor, constant: -margin),
            temperamentLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: margin),
            temperamentLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -margin),
            
            energyLevel.bottomAnchor.constraint(equalTo: temperamentLabel.topAnchor, constant: -margin),
            energyLevel.leadingAnchor.constraint(equalTo: temperamentLabel.leadingAnchor),
            energyLevel.trailingAnchor.constraint(equalTo: temperamentLabel.trailingAnchor),
            
            nameLabel.bottomAnchor.constraint(equalTo: energyLevel.topAnchor, constant: -margin),
            nameLabel.leadingAnchor.constraint(equalTo: energyLevel.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: energyLevel.trailingAnchor),
            
            imageView.heightAnchor.constraint(equalToConstant: 300),
            imageView.bottomAnchor.constraint(equalTo: nameLabel.topAnchor, constant: -margin),
            imageView.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            imageView.topAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.topAnchor)
        ])
    }
    
    // MARK: - Set View
    
    private func setViews() {
        let wikiLinkText = "Visit wikipedia page"
        let energyStars = String(repeating: "⭐️", count: viewModel.breed.energyLevel)
        
        let attributedString = NSMutableAttributedString(string: wikiLinkText)
        attributedString.addAttribute(.link,
                                      value: viewModel.breed.wikipediaUrl!,
                                      range: NSRange(location: 0, length: wikiLinkText.count))
        
        wikiLinkLabel.attributedText = attributedString
        energyLevel.text = "Energy: \(energyStars)"
        nameLabel.text = viewModel.breed.name
        temperamentLabel.text = viewModel.breed.temperament
        
        if let imageData = viewModel.breed.image {
            setImage(imageData)
        }
    }
    
    private func setImage(_ imageData: CatBreedImage) {
        if let imageUrlString = imageData.url {
            cacheImage(id: imageData.id ?? UUID().uuidString,
                       urlString: imageUrlString)
        }
    }
    
    private func cacheImage(id: String, urlString: String) {
        if let url = URL(string: urlString) {
            let resource = ImageResource(downloadURL: url, cacheKey: id)
            imageView.kf.setImage(with: resource,
                                  placeholder: UIImage(named: "placeholder"))
        }
    }
}

// MARK: - UITextViewDelegate

extension CatBreedDetailViewController: UITextViewDelegate {
    func textView(_ textView: UITextView,
                  shouldInteractWith URL: URL,
                  in characterRange: NSRange,
                  interaction: UITextItemInteraction) -> Bool {
        viewModel.wikiLinkTapped(URL)
        return false
    }
}
