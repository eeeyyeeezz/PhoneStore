// 
// PhoneStore
// CartStruct.swift
// Created by eeeyyeeezz on 30.08.2022
// Swift: 5.0
//


import Foundation

// MARK: - CartStruct
struct CartStruct: Codable {
    let cpu, camera: String
    let capacity, color: [String]
    let id: String
    let images: [String]
    let isFavorites: Bool
    let price: Int
    let rating: Double
    let sd, ssd, title: String

    enum CodingKeys: String, CodingKey {
        case cpu = "CPU"
        case camera, capacity, color, id, images, isFavorites, price, rating, sd, ssd, title
    }
}
