//
//  RepositoriesListViewModel.swift
//  ConsultaRepositorios
//
//  Created by Breno Carvalho de Morais on 20/10/19.
//  Copyright © 2019 Breno Carvalho de Morais. All rights reserved.
//

import Foundation

protocol RepositoriesListProtocol {
    func didLoadRepositories(repositories: [Repositories])
    func didFailedLoadRepositories()
}

class RepositoriesListViewModel {
    let delegate: RepositoriesListProtocol
    let service = Service()
    
    init(delegate: RepositoriesListProtocol) {
        self.delegate = delegate
    }
    
    func loadData(page: Int) {
        service.getTopRepositories(page: page) { (response) in
            if response.error != nil {
                self.delegate.didFailedLoadRepositories()
            } else {
                if let repositories = response.result.value?.items {
                    self.delegate.didLoadRepositories(repositories: repositories)
                }
            }
        }
    }
}
