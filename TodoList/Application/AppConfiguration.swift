//
//  AppConfiguration.swift
//  TodoList
//
//  Created by William on 05/08/20.
//  Copyright © 2020 william. All rights reserved.
//

import Foundation

final class AppConfiguration {
  internal lazy var apiKey: String = {
    guard let apiKey = Bundle.main.object(forInfoDictionaryKey: "ApiKey") as? String else {
      fatalError("ApiKey is empty")
    }
    return apiKey
  }()

  internal lazy var baseURL: String = {
    guard let url = Bundle.main.object(forInfoDictionaryKey: "ApiBaseURL") as? String else {
      fatalError("ApiBaseURL is empty")
    }
    return url
  }()
}
