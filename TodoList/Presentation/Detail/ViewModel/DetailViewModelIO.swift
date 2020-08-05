//
//  DetailViewModelIO.swift
//  TodoList
//
//  Created by William on 05/08/20.
//  Copyright © 2020 william. All rights reserved.
//

import Foundation

protocol DetailViewModelInput: class {}

protocol DetailViewModelOutput: class {
  var name: String { get }
}

protocol DetailViewModel: DetailViewModelInput, DetailViewModelOutput {}
