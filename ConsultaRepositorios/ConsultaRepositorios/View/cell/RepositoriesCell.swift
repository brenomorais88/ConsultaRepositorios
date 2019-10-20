//
//  RepositoriesCell.swift
//  ConsultaRepositorios
//
//  Created by Breno Carvalho de Morais on 20/10/19.
//  Copyright © 2019 Breno Carvalho de Morais. All rights reserved.
//

import UIKit
import SnapKit

class RepositoriesCell: UITableViewCell {
    let repoImage: UIImageView = UIImageView(image: UIImage(named: "placeholder"))
    let repoTitle: UILabel = UILabel()
    let repoAuthor: UILabel = UILabel()
    let repoStars: UILabel = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.repoTitle.text = ""
        self.repoAuthor.text = ""
        self.repoStars.text = ""
        self.repoImage.image = UIImage(named: "placeholder")
    }
    
    func setupCell(repositorie: Repositories) {
        self.repoTitle.text = repositorie.name
        self.repoAuthor.text = repositorie.owner?.login
        
        if let stars = repositorie.stargazers_count {
            self.repoStars.text = "estrelas: \(stars)"
        }
        
        if let url = URL(string: repositorie.owner?.avatar_url ?? "") {
            repoImage.downloaded(url: url)
        }
        
        setupLayout()
    }
    
    private func setupLayout() {
        self.repoAuthor.textColor = UIColor.darkGray
        self.repoStars.textColor = UIColor.darkGray
        
        self.addSubview(repoImage)
        self.addSubview(repoTitle)
        self.addSubview(repoAuthor)
        self.addSubview(repoStars)
        
        repoImage.snp.makeConstraints { (make) -> Void in
            make.width.height.equalTo(64)
            make.left.top.equalTo(8)
        }
        
        repoTitle.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(repoImage.snp.right).offset(8)
            make.top.right.equalTo(8)
        }
        
        repoAuthor.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(repoImage.snp.right).offset(8)
            make.top.equalTo(repoTitle.snp.bottom).offset(2)
            make.right.equalTo(8)
        }
        
        repoStars.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(repoImage.snp.right).offset(8)
            make.top.equalTo(repoAuthor.snp.bottom).offset(2)
            make.right.equalTo(8)
        }
    }

}
