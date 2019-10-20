//
//  UIImageView+Extensions.swift
//  ConsultaRepositorios
//
//  Created by Breno Carvalho de Morais on 20/10/19.
//  Copyright © 2019 Breno Carvalho de Morais. All rights reserved.
//

import UIKit

extension UIImageView {
    func downloaded(url: URL, contentMode: UIView.ContentMode = .scaleAspectFit) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
            }.resume()
    }
}
