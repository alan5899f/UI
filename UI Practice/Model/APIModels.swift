//
//  APIModels.swift
//  UI Practice
//
//  Created by 陳韋綸 on 2022/11/3.
//

import Foundation

struct API {
    static let api = "https://raw.githubusercontent.com/winwiniosapp/interview/main/interview.json"
}

class APIModels {
    
    static let shared = APIModels()
    
    func api(completion: @escaping (ApiData) -> Void) {
        guard let url = URL(string: API.api) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, err in
            guard let data = data, err == nil else {
                print("error api")
                return
            }
            
            do {
//                let json = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
                let result = try JSONDecoder().decode(ApiData.self, from: data)
                completion(result)
            }
            catch {
                print("no api")
            }
        }
        task.resume()
    }
}
