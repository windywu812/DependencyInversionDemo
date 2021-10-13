//
//  FirebaseDataProvider.swift
//  DependencyInversionDemo
//
//  Created by Windy on 13/10/21.
//

import Foundation

class FirebaseDataProvider: DataProviderProtocol {
    
    func getAllData(completion: @escaping (Result<[String], Error>) -> ()) {
        
        // Fetching from Firebase 
        
        completion(.success([
            "Firebase 1",
            "Firebase 2",
            "Firebase 3",
            "Firebase 4",
            "Firebase 5"])
        )
    }
    
}
