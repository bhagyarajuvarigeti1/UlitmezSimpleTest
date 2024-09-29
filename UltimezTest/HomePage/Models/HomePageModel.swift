//
//  HomePageModel.swift
//  UltimezTest
//
//  Created by bhagyaraju on 28/09/24.
//


import Foundation

// MARK: - HomPageModel
class HomePageModel: Codable {
    var results: [Result]
    var pagination: Pagination
    
    init(results: [Result], pagination: Pagination) {
        self.results = results
        self.pagination = pagination
    }
}

// MARK: - Pagination
class Pagination: Codable {
    let key: String?
    
    init(key: String?) {
        self.key = key
    }
}

// MARK: - Result
class Result: Codable {
    let createdAt, price, name, uid: String
    let imageIDS: [String]
    let imageUrls, imageUrlsThumbnails: [String]
    
    enum CodingKeys: String, CodingKey {
        case createdAt = "created_at"
        case price, name, uid
        case imageIDS = "image_ids"
        case imageUrls = "image_urls"
        case imageUrlsThumbnails = "image_urls_thumbnails"
    }
    
    init(createdAt: String, price: String, name: String, uid: String, imageIDS: [String], imageUrls: [String], imageUrlsThumbnails: [String]) {
        self.createdAt = createdAt
        self.price = price
        self.name = name
        self.uid = uid
        self.imageIDS = imageIDS
        self.imageUrls = imageUrls
        self.imageUrlsThumbnails = imageUrlsThumbnails
    }
}

// MARK: - ErrorModel
class ErrorModel: Codable {
    // TODO: Implement custom error model
}
