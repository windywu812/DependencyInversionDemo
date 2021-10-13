//
//  CompanyDataProvider.swift
//  DependencyInversionDemo
//
//  Created by Windy on 13/10/21.
//

import Foundation

class CompanyDataProvider: DataProviderProtocol {
    
    let url: URL = URL(string: "")!
    
    func getAllData(completion: @escaping (Result<[String], Error>) -> ()) {
        
        completion(.success([
            "Company 1",
            "Company 2",
            "Company 3",
            "Company 4",
            "Company 5"])
        )
        
//        URLSession.shared.dataTask(with: url) { data, respone, err in
//             Do something with the apicall
//        }.resume()
    }
        
}
