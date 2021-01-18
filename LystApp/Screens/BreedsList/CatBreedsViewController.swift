//
//  CatBreedsViewController.swift
//  LystApp
//
//  Created by Ridwan Al-Mansur on 18/01/2021.
//

import UIKit

class CatBreedsViewController: UIViewController {
    
    var viewModel: CatBreedsViewModelProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .red
        viewModel?.getCatBreeds()
    }

}

