//
//  Endpoint.swift
//  LystApp
//
//  Created by Ridwan Al-Mansur on 18/01/2021.
//

import Foundation

enum Endpoint {
    
    case breeds
    
    func url() -> URL {
        switch self {
        case .breeds:
            return baseURL.appendingPathComponent("breeds")
        }
    }
    
    private var baseURL: URL {
        guard let url = URL(string: Constants.API.baseUrl.rawValue) else {
            fatalError("Failed to create base url")
        }
        return url
    }
}
