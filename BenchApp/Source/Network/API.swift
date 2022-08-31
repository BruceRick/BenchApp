//
//  API.swift
//  BenchApp
//
//  Created by Bruce Rick on 2022-08-30.
//

import Foundation

protocol API {
  static func request<T: Decodable>(endpoint: Endpoint) async throws -> (data: T, response: URLResponse)
}
