//
//  CatBreedsViewModelSpy.swift
//  LystAppTests
//
//  Created by Ridwan Al-Mansur on 19/01/2021.
//

import Foundation
@testable import LystApp

class CatBreedsViewModelSpy: CatBreedsViewModelProtocol {
    var breeds: [CatBreed] = []
    
    private(set) var getCatBreedsCallCount = 0
    func getCatBreeds() {
        getCatBreedsCallCount += 1
    }
    
    private(set) var showBreedDetailCallCount = 0
    func showBreedDetail() {
        showBreedDetailCallCount += 1
    }
}
