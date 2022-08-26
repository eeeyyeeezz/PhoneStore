// 
// PhoneStore
// ProductViewModel.swift
// Created by eeeyyeeezz on 26.08.2022
// Swift: 5.0
//


import Foundation

class ProductViewModel {

  func parsData(_ completion: @escaping ((ProductStruct) -> Void)) {
    if let url = URL(string: "https://run.mocky.io/v3/6c14c560-15c6-4248-b9d2-b4508df7d4f5") {
      URLSession.shared.dataTask(with: url) { data, _, error in
        if let data = data {
          do {
              let result = try JSONDecoder().decode(ProductStruct.self, from: data)
              completion(result)
          } catch {
              debugPrint(error)
          }
        }
      }.resume()
    }
  }
}
