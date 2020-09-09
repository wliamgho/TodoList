//
//  DataState.swift
//  TodoList
//
//  Created by William on 09/08/20.
//  Copyright © 2020 william. All rights reserved.
//

import Foundation

public protocol StoreState: Equatable {}
public protocol ViewState: StoreState {}

public extension Equatable where Self: StoreState {
  static func ==(lhs: Self, rhs: Self) -> Bool {
    return false
  }
}

public enum DataState<T, E: Error>: StoreState {
  case loading(T?)
  case success(T)
  case error(E)
}
