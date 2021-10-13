//
//  DataProviderProtocol.swift
//  DependencyInversionDemo
//
//  Created by Windy on 13/10/21.
//

import Foundation

protocol DataProviderProtocol {
    func getAllData(completion: @escaping (Result<[String], Error>) -> ())
}
