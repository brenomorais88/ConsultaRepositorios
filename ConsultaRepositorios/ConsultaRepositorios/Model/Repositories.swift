//
//  Repositories.swift
//  ConsultaRepositorios
//
//  Created by Breno Carvalho de Morais on 20/10/19.
//  Copyright © 2019 Breno Carvalho de Morais. All rights reserved.
//

import Foundation
import ObjectMapper

class Repositories: Mappable {
    var id: Int?
    var name: String?
    var stargazers_count: Int?
    var owner: RepositorieOwner?
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        stargazers_count <- map["stargazers_count"]
        owner <- map["owner"]
    }
    
    required init?(map: Map){
        
    }
}
