//
//  CatBreedsViewController.swift
//  LystApp
//
//  Created by Ridwan Al-Mansur on 18/01/2021.
//

import UIKit

class CatBreedsViewController: UIViewController {
    
    // MARK: - Properties/Views
    
    var viewModel: CatBreedsViewModelProtocol?
    
    private(set) var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 180, height: 200)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .bgColor
        return collectionView
    }()
    
    private(set) var loadingIndicator = UIActivityIndicatorView(style: .medium)

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        navBarSetup()
        collectionViewSetup()
        setupConstraints()
        viewModel?.getCatBreeds()
    }
    
    // MARK: - Setup
    
    private func navBarSetup() {
        title = "Cat Breeds"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func collectionViewSetup() {
        collectionView.register(CatBreedCollectionViewCell.nib(),
                                forCellWithReuseIdentifier: CatBreedCollectionViewCell.reuseIdentifier)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func setupConstraints() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loadingIndicator)
        NSLayoutConstraint.activate([
            loadingIndicator.topAnchor.constraint(equalTo: view.topAnchor),
            loadingIndicator.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            loadingIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

}

// MARK: - CatBreedsViewProtocol

extension CatBreedsViewController: CatBreedsViewProtocol {
    func reloadCollectionView() {
        collectionView.reloadData()
    }
    
    func showLoading(_ show: Bool) {
        show ? loadingIndicator.startAnimating() : loadingIndicator.stopAnimating()
    }
}

// MARK: - Collection View Helpers

extension CatBreedsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        print("Tapped index: \(indexPath)")
    }
}

extension CatBreedsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.breeds.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CatBreedCollectionViewCell.reuseIdentifier,
                                                            for: indexPath) as? CatBreedCollectionViewCell,
              let breed = viewModel?.breeds[indexPath.row] else {
            fatalError("Could not create CatBreedCollectionViewCell")
        }
        
        cell.configureWith(breed: breed)
        return cell
    }
}

extension CatBreedsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 180, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 24.0, left: 12.0, bottom: 32.0, right: 12.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}
