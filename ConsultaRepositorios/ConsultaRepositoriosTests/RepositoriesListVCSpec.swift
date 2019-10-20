//
//  RepositoriesListVCSpec.swift
//  ConsultaRepositoriosTests
//
//  Created by Kleyton Prestes Stringhetta on 20/10/19.
//  Copyright © 2019 Breno Carvalho de Morais. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import ConsultaRepositorios

class RepositoriesListVCSpec: QuickSpec {
    override func spec() {
        var sut: RepositoriesListVC?
        
        describe("Layout") {
            let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "RepositoriesListVC") as! RepositoriesListVC
            vc.loadView()
            sut = vc
            
            it("cannot be nil") {
                sut?.viewDidLoad()
                expect(sut).toNot(beNil())
            }
            
            it("check loading status") {
                sut?.viewDidLoad()
                expect(sut?.loading.isHidden).to(beFalse())
            }
            
            it("check empty status") {
                sut?.didLoadRepositories(repositories: [])
                expect(sut?.errorLabel.isHidden).to(beFalse())
                expect(sut?.errorLabel.text).to(equal("Nenhum repositorio encontrado"))
            }
            
            it("check error status") {
                sut?.didFailedLoadRepositories()
                expect(sut?.errorLabel.isHidden).to(beFalse())
                expect(sut?.errorLabel.text).to(equal("Erro ao processar sua solicitação"))
            }
            
            it("check showing status") {
                sut?.didLoadRepositories(repositories: [Repositories()])
                expect(sut?.tableView.isHidden).to(beFalse())
            }
        }
    }
}


//private func setupViewState(state: ViewState) {
//    self.tableView.isHidden = true
//    self.loading.isHidden = true
//    self.errorLabel.isHidden = true
//
//
//    switch state {
//    case .loading:
//        self.loading.isHidden = false
//        self.loading.startAnimating()
//
//    case .showing:
//        self.tableView.isHidden = false
//
//    case .error:
//        self.errorLabel.text = ""
//        self.errorLabel.isHidden = false
//
//    case .empty:
//        self.errorLabel.text = ""
//        self.errorLabel.isHidden = false
//    }
//}
