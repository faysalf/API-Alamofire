//
//  Ext+UIImage.swift
//  API-Alamofire
//
//  Created by Md. Faysal Ahmed on 24/3/23.
//

import UIKit

extension UIImageView {
    func loadImageFromUrl(_ urlString: String) {
        guard let url = URL(string: urlString) else {
            return
        }
        
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                // Handle the error
                print("Error loading image: \(error.localizedDescription)")
            } else if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.image = image
                }
            }
        }
        task.resume()
    }
}
