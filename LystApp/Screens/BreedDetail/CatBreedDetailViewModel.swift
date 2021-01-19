//
//  CatBreedDetailViewModel.swift
//  LystApp
//
//  Created by Ridwan Al-Mansur on 19/01/2021.
//

import UIKit

protocol CatBreedDetailViewModelProtocol {
    var breed: CatBreed { get }
    func wikiLinkTapped(_ url: URL)
}

class CatBreedDetailViewModel: CatBreedDetailViewModelProtocol {
    
    var breed: CatBreed
    
    init(breed: CatBreed) {
        self.breed = breed
    }
    
    func wikiLinkTapped(_ url: URL) {
        UIApplication.shared.open(url)
    }
}
