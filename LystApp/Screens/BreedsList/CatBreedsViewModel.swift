//
//  CatBreedsViewModel.swift
//  LystApp
//
//  Created by Ridwan Al-Mansur on 18/01/2021.
//

import Foundation

class CatBreedsViewModel {
    
    private weak var view: CatBreedsViewProtocol?
    private let interactor: CatBreedsInteractorProtocol
    private(set) var breeds = [CatBreed]()
    
    init(view: CatBreedsViewProtocol,
         interactor: CatBreedsInteractorProtocol) {
        self.view = view
        self.interactor = interactor
        view.showLoading(true)
    }
    
}

extension CatBreedsViewModel: CatBreedsViewModelProtocol {
    func getCatBreeds() {
        interactor.fetchCatBreeds { [weak self] results in
            guard let self = self else { return }
            
            switch results {
            case .success(let breeds):
                self.breeds = breeds
                
                DispatchQueue.main.async {
                    self.view?.reloadCollectionView()
                    self.view?.showLoading(false)
                }
            case .failure(let error):
                // TODO: - Handle error
                print(error)
            }
        }
    }
    
    func showBreedDetail() {
        
    }
}


