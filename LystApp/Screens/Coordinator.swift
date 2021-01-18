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
}

class MainCoordinator: Coordinator {
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController = UINavigationController()) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = CatBreedsViewController()
        let interactor = CatBreedsInteractor()
        let viewModel = CatBreedsViewModel(interactor: interactor)
        
        viewController.viewModel = viewModel
        navigationController.pushViewController(viewController, animated: false)
    }
}
