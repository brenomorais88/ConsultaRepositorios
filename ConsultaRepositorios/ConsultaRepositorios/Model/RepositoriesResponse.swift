//
//  RepositoriesResponse.swift
//  ConsultaRepositorios
//
//  Created by Kleyton Prestes Stringhetta on 20/10/19.
//  Copyright © 2019 Breno Carvalho de Morais. All rights reserved.
//

import Foundation
import ObjectMapper

class RepositoriesResponse: Mappable {
    var total_count: Int?
    var incomplete_results: Bool?
    var items: [Repositories]?
    
    func mapping(map: Map) {
        total_count <- map["total_count"]
        incomplete_results <- map["incomplete_results"]
        items <- map["items"]
    }
    
    required init?(map: Map){
        
    }
}
