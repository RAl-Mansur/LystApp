//
//  CatBreedsViewControllerTests.swift
//  LystAppTests
//
//  Created by Ridwan Al-Mansur on 19/01/2021.
//

import XCTest
@testable import LystApp

class CatBreedsViewControllerTests: XCTestCase {

    func testShowLoadingSetsAnimationOnLoadingIndicator() {
        let sut = makeSUT()
        XCTAssertFalse(sut.loadingIndicator.isAnimating)
        sut.showLoading(true)
        XCTAssertTrue(sut.loadingIndicator.isAnimating)
        sut.showLoading(false)
        XCTAssertFalse(sut.loadingIndicator.isAnimating)
    }
    
    func testViewModelSetsCollectionView() {
        let viewModel = CatBreedsViewModelSpy()
        viewModel.breeds = getCatBreeds()
        let sut = makeSUT(viewModel: viewModel)
        
        XCTAssertEqual(sut.collectionView.numberOfItems(inSection: 0), 0)
        sut.reloadCollectionView()
        sut.loadViewIfNeeded()
        XCTAssertEqual(sut.collectionView.numberOfItems(inSection: 0), viewModel.breeds.count)
    }
    
    // MARK: - Helpers
    
    private func makeSUT(viewModel: CatBreedsViewModelProtocol = CatBreedsViewModelSpy()) -> CatBreedsViewController {
        let viewController = CatBreedsViewController()
        viewController.viewModel = viewModel
        
        return viewController
    }

    
    private func getCatBreeds() -> [CatBreed] {
        return [
            CatBreed(id: UUID().uuidString, name: UUID().uuidString, image: nil),
            CatBreed(id: UUID().uuidString, name: UUID().uuidString, image: nil),
            CatBreed(id: UUID().uuidString, name: UUID().uuidString, image: nil),
            CatBreed(id: UUID().uuidString, name: UUID().uuidString, image: nil),
            CatBreed(id: UUID().uuidString, name: UUID().uuidString, image: nil)
        ]
    }
}
