//
//  Page.swift
//  TMDbCore
//
//  Created by David Lopez Rodriguez on 15/04/2018.
//  Copyright © 2018 Guille Gonzalez. All rights reserved.
//

import Foundation

struct Page<Element>: Decodable where Element : Decodable {
    let page: Int
    let totalPages: Int
    let totalResults: Int
    let results: [Element]
    
    private enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}
