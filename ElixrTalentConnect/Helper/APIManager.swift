//
//  APIManager.swift
//  ElixrTalentConnect
//
//  Created by Devasurya on 21/01/24.
//

import Foundation
import UIKit

final class APIManager{
    static let shared  = APIManager()
    private init(){}
    typealias Handler = (Result<[Jobs],DataError>) -> Void
    func fetchJobs (completion:@escaping Handler) {
        guard let url = URL(string: "http://localhost:9001/elixr/jobs")  else {
            completion(.failure((.invalidURL)))
            print("invalidURL")

            return
        }
        URLSession.shared.dataTask(with: url){
            data,response,error in
            guard let data = data,error == nil else  {
                completion(.failure(.invalidData))
                print("invalidData")
                return
            }
            guard let response  = response as? HTTPURLResponse,
                  200...299 ~= response.statusCode
            else {
                completion(.failure(.invalidResponse))
                print("invalidResponse")

                return
            }
            do{
                let product = try JSONDecoder().decode(JobsResponse.self, from: data)
                completion(.success(product.jobs))
                print("Success")
            }
            catch{
                completion(.failure(.network(_error: error)))
                print("network error")
            }
        }.resume()
        print("ended")
    }
}
enum DataError:Error{
    case invalidResponse
    case invalidURL
    case invalidData
    case network(_error:Error?)
}
