//
//  APIModel.swift
//  API-Alamofire
//
//  Created by Reserveit Support on 22/3/23.
//

import Foundation

// MARK: - SingleGetModel
struct SingleGetModel: Codable {
    let data: DataClass
    let support: Support
}

struct DataClass: Codable {
    let id: Int
    let email, firstName, lastName: String
    let avatar: String

    enum CodingKeys: String, CodingKey {
        case id, email
        case firstName = "first_name"
        case lastName = "last_name"
        case avatar
    }
}

struct Support: Codable {
    let url: String
    let text: String
}


// MARK: - ListGetModel
struct ListGetModel: Codable {
    let page, perPage, total, totalPages: Int
    let data: [Datum]
    let support: ListSupport

    enum CodingKeys: String, CodingKey {
        case page
        case perPage = "per_page"
        case total
        case totalPages = "total_pages"
        case data, support
    }
}

struct Datum: Codable {
    let id: Int
    let email, firstName, lastName: String
    let avatar: String

    enum CodingKeys: String, CodingKey {
        case id, email
        case firstName = "first_name"
        case lastName = "last_name"
        case avatar
    }
}

struct ListSupport: Codable {
    let url: String
    let text: String
}


// MARK: - Post
struct PostModel: Codable {
    let roll: Int
    let name: String
    let email: String
    let password: String
    
    enum CodingKeys: String, CodingKey {
        case roll = "Roll"
        case name = "Name"
        case email = "Email"
        case password = "Password"
    }
}


// MARK: - Put Model
struct PutModel {
    let name: String
    let job: String
    let updatedAt: Date
}
