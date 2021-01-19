//
//  Coordinator.swift
//  LystApp
//
//  Created by Ridwan Al-Mansur on 18/01/2021.
//

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    func start()
    func showCatBreedDetail(_ breed: CatBreed)
}

class MainCoordinator: Coordinator {
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController = UINavigationController()) {
        self.navigationController = navigationController
    }
    
    func start() {
        let view = CatBreedsViewController()
        let interactor = CatBreedsInteractor()
        let viewModel = CatBreedsViewModel(view: view,
                                           coordinator: self,
                                           interactor: interactor)
        
        view.viewModel = viewModel
        navigationController.pushViewController(view, animated: false)
    }
    
    func showCatBreedDetail(_ breed: CatBreed) {
        let viewModel = CatBreedDetailViewModel(breed: breed)
        let view = CatBreedDetailViewController(viewModel: viewModel)
        
        navigationController.pushViewController(view, animated: true)
    }
}
