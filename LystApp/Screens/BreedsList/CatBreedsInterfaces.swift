//
//  CatBreedsInterfaces.swift
//  LystApp
//
//  Created by Ridwan Al-Mansur on 19/01/2021.
//

import Foundation

enum CatBreedsResults {
    case success([CatBreed])
    case failure(ApiError)
}

protocol CatBreedsInteractorProtocol {
    func fetchCatBreedsRequest() -> URLRequest
    func fetchCatBreeds(completion: @escaping (CatBreedsResults) -> Void)
}

protocol CatBreedsViewProtocol: AnyObject {
    func reloadCollectionView()
    func showLoading(_ show: Bool)
}

protocol CatBreedsViewModelProtocol {
    var breeds: [CatBreed] { get }
    func getCatBreeds()
    func showBreedDetail()
}
