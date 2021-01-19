//
//  CatBreedsViewModelTests.swift
//  LystAppTests
//
//  Created by Ridwan Al-Mansur on 19/01/2021.
//

import XCTest
@testable import LystApp

class CatBreedsViewModelTests: XCTestCase {

    // MARK: - Interactor tests
    
    func testGetCatBreedsCallsFetchCatBreedsOnInteractor() {
        let interactor = CatBreedsInteractorSpy()
        let sut = makeSUT(interactor: interactor)
        
        XCTAssertEqual(interactor.fetchCatBreedsRequestCalls.count, 0)
        sut.getCatBreeds()
        XCTAssertEqual(interactor.fetchCatBreedsRequestCalls.count, 1)
    }
    
    // MARK: - View tests
    
    func testShowLoadingIsCalledOnInit() {
        let view = CatBreedsViewSpy()
        XCTAssertEqual(view.showLoadingCalls, [])
        let _ = makeSUT(view: view)
        XCTAssertEqual(view.showLoadingCalls, [true])
    }
    
    func testShowLoadingIsCalledOnFetchCatBreedsSuccess() {
        let view = CatBreedsViewSpy()
        let interactor = CatBreedsInteractorSpy()
        let sut = makeSUT(view: view, interactor: interactor)
        
        XCTAssertEqual(view.showLoadingCalls, [true])
        sut.getCatBreeds()
        interactor.fetchCatBreedsRequestCalls.last?(.success(getSuccessResponse()))
        
        let exp = expectation(description: "Wait for DispatchQueue")
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            XCTAssertEqual(view.showLoadingCalls, [true, false])
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 5.0)
    }
    
    func testReloadCollectionViewIsCalledOnFetchCatBreedsSuccess() {
        let view = CatBreedsViewSpy()
        let interactor = CatBreedsInteractorSpy()
        let sut = makeSUT(view: view, interactor: interactor)
        
        XCTAssertEqual(view.reloadCollectionViewCallCount, 0)
        sut.getCatBreeds()
        interactor.fetchCatBreedsRequestCalls.last?(.success(getSuccessResponse()))
        
        let exp = expectation(description: "Wait for DispatchQueue")
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            XCTAssertEqual(view.reloadCollectionViewCallCount, 1)
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 5.0)
    }
    
    
    // MARK: - Helpers
    
    private func makeSUT(view: CatBreedsViewProtocol = CatBreedsViewSpy(),
                         interactor: CatBreedsInteractorProtocol = CatBreedsInteractorSpy()) -> CatBreedsViewModel {
        
        return CatBreedsViewModel(view: view, interactor: interactor)
    }
    
    private func getSuccessResponse() -> [CatBreed] {
        return [
            CatBreed(id: UUID().uuidString,
                     name: UUID().uuidString, image: nil),
            CatBreed(id: UUID().uuidString,
                     name: UUID().uuidString, image: nil),
            CatBreed(id: UUID().uuidString,
                     name: UUID().uuidString, image: nil)
        ]
    }

}
