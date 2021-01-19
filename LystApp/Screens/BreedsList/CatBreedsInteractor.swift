//
//  CatBreedsInteractor.swift
//  LystApp
//
//  Created by Ridwan Al-Mansur on 18/01/2021.
//

import Foundation

class CatBreedsInteractor: CatBreedsInteractorProtocol {
    
    func fetchCatBreedsRequest() -> URLRequest {
        let url = Endpoint.breeds.url()
        
        var request = URLRequest(url: url)
        request.setValue("x-api-key", forHTTPHeaderField: Constants.API.apiKey.rawValue)
        request.httpMethod = "GET"
        return request
    }
    
    
    func fetchCatBreeds(completion: @escaping (CatBreedsResults) -> Void) {
        let request = fetchCatBreedsRequest()
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let _ = error {
                completion(.failure(.general))
                return
            }

            guard let data = data else {
                completion(.failure(.general))
                return
            }

            guard let parsedData = try? JSONDecoder().decode([CatBreed].self, from: data) else {
                completion(.failure(.parsing))
                return
            }
            
            completion(.success(parsedData))
            
        }.resume()
    }
    
    
}
