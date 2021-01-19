//
//  CatBreedsInteractorSpy.swift
//  LystAppTests
//
//  Created by Ridwan Al-Mansur on 19/01/2021.
//

import Foundation
@testable import LystApp

class CatBreedsInteractorSpy: CatBreedsInteractorProtocol {
    
    typealias CatBreedsMessage = (CatBreedsResults) -> Void
    
    private(set) var fetchCatBreedsRequestCallCount = 0
    func fetchCatBreedsRequest() -> URLRequest {
        fetchCatBreedsRequestCallCount += 1
        return URLRequest(url: URL(string: "https://www.google.com")!)
    }
    
    private(set) var fetchCatBreedsRequestCalls = [CatBreedsMessage]()
    func fetchCatBreeds(completion: @escaping (CatBreedsResults) -> Void) {
        fetchCatBreedsRequestCalls.append(completion)
    }
}
