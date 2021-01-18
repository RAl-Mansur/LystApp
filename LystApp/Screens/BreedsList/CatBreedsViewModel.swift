//
//  CatBreedsViewModel.swift
//  LystApp
//
//  Created by Ridwan Al-Mansur on 18/01/2021.
//

import Foundation

protocol CatBreedsViewModelProtocol {
    func getCatBreeds()
    func showBreedDetail()
}

class CatBreedsViewModel {
    
    let interactor: CatBreedsInteractorProtocol
    
    init(interactor: CatBreedsInteractor) {
        self.interactor = interactor
    }
    
}

extension CatBreedsViewModel: CatBreedsViewModelProtocol {
    func getCatBreeds() {
        interactor.fetchCatBreeds { results in
            switch results {
            case .success(let breeds):
                print(breeds)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func showBreedDetail() {
        
    }
}


