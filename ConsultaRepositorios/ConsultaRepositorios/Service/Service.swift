//
//  Service.swift
//  ConsultaRepositorios
//
//  Created by Kleyton Prestes Stringhetta on 20/10/19.
//  Copyright © 2019 Breno Carvalho de Morais. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper
import Foundation

class Service {
    let baseUrl: String = "http://api.github.com/"
    public func getTopRepositories(page: Int,
                                   completionHandler: @escaping (DataResponse<RepositoriesResponse>) -> Void) {
        let requestUrl: String = "\(self.baseUrl)search/repositories?q=stars&sort=stars&per_page=15&page=\(page)"
        guard let url = URL(string: requestUrl) else {
            return
        }
        Alamofire.request(url).responseObject { (response: DataResponse<RepositoriesResponse>) in
            completionHandler(response)
        }
    }
}
