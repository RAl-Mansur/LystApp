//
//  CatBreed.swift
//  LystApp
//
//  Created by Ridwan Al-Mansur on 18/01/2021.
//

import Foundation

struct CatBreed: Codable {
    let id: String
    let name: String
    let temperament: String
    let energyLevel: Int
    let wikipediaUrl: String?
    let image: CatBreedImage?
}

struct CatBreedImage: Codable {
    let id: String?
    let url: String?
}
