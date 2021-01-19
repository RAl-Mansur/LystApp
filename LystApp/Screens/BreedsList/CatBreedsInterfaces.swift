//
//  CatBreedsInterfaces.swift
//  LystApp
//
//  Created by Ridwan Al-Mansur on 19/01/2021.
//

import Foundation

protocol CatBreedsViewProtocol: AnyObject {
    func reloadCollectionView()
    func showLoading(_ show: Bool)
}

protocol CatBreedsViewModelProtocol {
    var breeds: [CatBreed] { get }
    func getCatBreeds()
    func showBreedDetail()
}
