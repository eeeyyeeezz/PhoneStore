// 
// PhoneStore
// CarouselViewModel.swift
// Created by eeeyyeeezz on 25.08.2022
// Swift: 5.0
//

import Foundation

class CarouselViewModel {
  func parsData(_ completion: @escaping ((PhoneStruct) -> Void)) {
    if let url = URL(string: "https://run.mocky.io/v3/654bd15e-b121-49ba-a588-960956b15175") {
      URLSession.shared.dataTask(with: url) { data, _, error in
        if let data = data {
          do {
              let result = try JSONDecoder().decode(PhoneStruct.self, from: data)
              completion(result)
          } catch {
              debugPrint(error)
          }
        }
      }.resume()
    }
  }
}
