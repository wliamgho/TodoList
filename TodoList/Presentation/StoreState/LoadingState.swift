//
//  LoadingState.swift
//  TodoList
//
//  Created by William on 09/08/20.
//  Copyright © 2020 william. All rights reserved.
//

import Foundation

struct LoadingStateViewModel {
  enum State {
    case initialize
    case loading
    case success
    case failed
  }
}
