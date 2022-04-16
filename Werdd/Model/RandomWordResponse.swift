//
//  RandomWordResponse.swift
//  Werdd
//
//  Created by Yuanjian Liao on 4/15/22.
//

import Foundation


struct RandomWordResponse: Decodable {
    
    let word: String
    let results: [Word]?
    
}
