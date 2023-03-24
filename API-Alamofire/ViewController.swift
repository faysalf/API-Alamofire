//
//  ViewController.swift
//  API-Alamofire
//
//  Created by Md. Faysal Ahmed on 21/3/23.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var idField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    let baseURL = "https://reqres.in/"
    
    let singleGet = "api/users/2"
    let listGet = "api/users?page=2"
    let putPoint = "api/users/2"            // replace entire resources
    let postPoint = "api/users"             // Create
    let patchPoint = "api/users/2"          // replace a part of resources
    let deletePoint = "api/users/2"         // Delete
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

    }
    
    
    @IBAction func singleGetAction(_ sender: UIButton) {
        singleMethodGet()
    }
    
    @IBAction func listGetAction(_ sender: UIButton) {
        listMethodGet()
    }
    
    @IBAction func patchAction(_ sender: UIButton) {
        patchMethod()
    }
    
    @IBAction func postAction(_ sender: UIButton) {
        postMethod()
    }
    
    @IBAction func putButtonAction(_ sender: UIButton) {
        putMethod()
    }
    
    @IBAction func deleteButtonAction(_ sender: UIButton) {
        deleteMethod()
    }
    
    
    func singleMethodGet() {
        AF.request(baseURL + singleGet).responseJSON { response in
            switch response.result {
            case .success(let value):
                guard let jsonData = try? JSONSerialization.data(withJSONObject: value, options: []),
                      let myData = try? JSONDecoder().decode(SingleGetModel.self, from: jsonData) else {
                    return
                }
                print(myData)
                
            case .failure(let error):
                print("Error retrieving data: \(error)")
            }
        }
    }
    
    func listMethodGet() {
        AF.request(baseURL + listGet).responseJSON { response in
            switch response.result {
            case .success(let value):
                
                guard let jsonData = try? JSONSerialization.data(withJSONObject: value, options: []),
                      let myData = try? JSONDecoder().decode(ListGetModel.self, from: jsonData) else {
                    return
                }
                let url = myData.data[0].avatar
                self.imageView.loadImageFromUrl(url)
                
            case .failure(let error):
                print("Error retrieving data: \(error)")
            }
        }
    }
    
    //patch replaces a part of resource but put replaces the entire resource.
    func patchMethod() {
        AF.request(baseURL + patchPoint, method: .patch).responseJSON { response in
            print(response)
        }
    }
    
    func putMethod() {
        let param: [String: Any] = [
            "name": "Faysal Ahmed",
            "job": "Jr. iOS Developer"
        ]
        AF.request(baseURL + putPoint,
                   method: .put,
                   parameters: param,
                   encoding: JSONEncoding.default).responseJSON { response in
            print(response)
        }
    }
    
    func postMethod() {
        
        let user = PostModel(roll: 54, name: "Md. Faysal Ahmed", email: "mdfaysal@gmail.com", password: "mdfaysal")

        AF.request(baseURL + postPoint, method: .post, parameters: user, encoder: JSONParameterEncoder.default).responseJSON { response in
            
            switch response.result {
            case .success(let value):
                print("Response: \(response).")
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func deleteMethod() {
        AF.request(baseURL + deletePoint,
                   method: .delete).responseJSON { response in
            print(response.response)
            
        }
    }
    
    
}

