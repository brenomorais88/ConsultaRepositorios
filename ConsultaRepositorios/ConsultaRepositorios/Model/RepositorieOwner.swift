//
//  RepositorieOwner.swift
//  ConsultaRepositorios
//
//  Created by Breno Carvalho de Morais on 20/10/19.
//  Copyright © 2019 Breno Carvalho de Morais. All rights reserved.
//

import Foundation
import ObjectMapper

class RepositorieOwner: Mappable {
    var avatar_url: String?
    var login: String?
    
    func mapping(map: Map) {
        avatar_url <- map["avatar_url"]
        login <- map["login"]
    }
    
    required init?(map: Map){
        
    }
}

