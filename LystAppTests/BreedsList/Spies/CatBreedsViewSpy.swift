//
//  CatBreedsViewSpy.swift
//  LystAppTests
//
//  Created by Ridwan Al-Mansur on 19/01/2021.
//

import Foundation
@testable import LystApp

class CatBreedsViewSpy: CatBreedsViewProtocol {
    private(set) var reloadCollectionViewCallCount = 0
    func reloadCollectionView() {
        reloadCollectionViewCallCount += 1
    }
    
    private(set) var showLoadingCalls = [Bool]()
    func showLoading(_ show: Bool) {
        showLoadingCalls.append(show)
    }
}
