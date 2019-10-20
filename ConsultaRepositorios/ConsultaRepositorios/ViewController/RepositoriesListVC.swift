//
//  ViewController.swift
//  ConsultaRepositorios
//
//  Created by Breno Carvalho de Morais on 20/10/19.
//  Copyright © 2019 Breno Carvalho de Morais. All rights reserved.
//

import UIKit
import SnapKit

class RepositoriesListVC: UIViewController {
    private var tableView: UITableView = UITableView()
    private var loading: UIActivityIndicatorView = UIActivityIndicatorView()
    private var errorLabel: UILabel = UILabel()
    private var repositoriesListViewModel: RepositoriesListViewModel? = nil
    private var page: Int = 1
    private var repositories: [Repositories] = []
    private var refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViewCode()
        title = "Repositorios"
        setupViewState(state: .loading)
        repositoriesListViewModel = RepositoriesListViewModel(delegate: self)
        repositoriesListViewModel?.loadData(page: page)
        loadRefresh()
    }
    
    private func setupViewCode() {
        self.view.addSubview(tableView)
        self.view.addSubview(loading)
        self.view.addSubview(errorLabel)
        
        loadTable()
        tableView.snp.makeConstraints { (make) -> Void in
            make.top.right.left.bottom.equalTo(0)
        }
        
        loading.style = .gray
        loading.snp.makeConstraints { (make) -> Void in
            make.center.equalTo(self.view)
        }
        
        errorLabel.textAlignment = .center
        errorLabel.snp.makeConstraints { (make) -> Void in
            make.center.equalTo(self.view)
            make.width.equalTo(self.view.frame.width)
            make.height.equalTo(50)
        }
    }
    
    private func loadTable() {
        self.tableView.register(RepositoriesCell.self, forCellReuseIdentifier: "RepositoriesCell")
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.separatorInset.left = 0
        self.tableView.reloadData()
    }
    
    private func setupViewState(state: ViewState) {
        self.tableView.isHidden = true
        self.loading.isHidden = true
        self.errorLabel.isHidden = true
        
        
        switch state {
        case .loading:
            self.loading.isHidden = false
            self.loading.startAnimating()
            
        case .showing:
            self.tableView.isHidden = false
            
        case .error:
            self.errorLabel.text = "Erro ao processar sua solicitação"
            self.errorLabel.isHidden = false
        
        case .empty:
            self.errorLabel.text = "Nenhum repositorio encontrado"
            self.errorLabel.isHidden = false
        }
    }
    
    private func loadRefresh() {
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        self.refreshControl.addTarget(self,
                                      action: #selector(refresh),
                                      for: UIControl.Event.valueChanged)
        self.tableView.addSubview(refreshControl)
    }
    
    @objc
    func refresh(sender: AnyObject) {
        self.setupViewState(state: .loading)
        self.repositories = []
        self.page = 1
        repositoriesListViewModel?.loadData(page: page)
        refreshControl.endRefreshing()
    }
}

extension RepositoriesListVC: RepositoriesListProtocol {
    func didLoadRepositories(repositories: [Repositories]) {
        self.repositories.append(contentsOf: repositories)
        if self.repositories.count > 0 {
            self.tableView.reloadData()
            setupViewState(state: .showing)
        } else {
            setupViewState(state: .empty)
        }
    }
    
    func didFailedLoadRepositories() {
        setupViewState(state: .error)
    }
}

extension RepositoriesListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.repositories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let repo = self.repositories[indexPath.row]
        let cell: RepositoriesCell = tableView.dequeueReusableCell(withIdentifier: "RepositoriesCell", for: indexPath) as! RepositoriesCell
        cell.setupCell(repositorie: repo) 
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == self.repositories.count - 1 {
            page += 1
            self.repositoriesListViewModel?.loadData(page: page)
        }
    }
}

