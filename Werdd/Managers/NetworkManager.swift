//
//  NetworkManager.swift
//  Werdd
//
//  Created by Yuanjian Liao on 4/15/22.
//

import Foundation


struct NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    let endpoint = "https://wordsapiv1.p.rapidapi.com/words/"
    
    let headers = [
        "X-RapidAPI-Host": "wordsapiv1.p.rapidapi.com",
        "X-RapidAPI-Key": "f184e6cc9amshbbb89a4acde5f19p1562d6jsnd4bce0cbe9d1"
    ]
    
    func getRandomWord(completionHandler: @escaping (RandomWordResponse?) -> Void) {
        guard let url = URL(string: "\(endpoint)?random=true") else { return }
        
        var request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard error == nil,
                  let data = data else
            {
                completionHandler(nil)
                return
            }
            
            do {
                let result = try JSONDecoder().decode(RandomWordResponse.self, from: data)
                completionHandler(result)
            } catch {
                completionHandler(nil)
            }
                    
        }.resume()
    }
    
}
