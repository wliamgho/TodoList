# TodoList
[![Build Status](https://travis-ci.com/wliamgho/TodoList.svg?branch=master)](https://travis-ci.com/wliam06/TodoList)
[![codecov](https://codecov.io/gh/wliamgho/TodoList/branch/master/graph/badge.svg)](https://codecov.io/gh/wliam06/TodoList)

Welcome to my simple TodoList app by using Viper Architecture with TDD implementation. In this case, i want to test how to code more clearer and testable.

## Viper (View - Interactor - Presenter - Entity - Router)
Viper is an application of [Clean Architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html). The main parts of Viper are:
- **View** represent as displays and giving the input to the Presenter.
- **Interactor** contains the business logic.
- **Presenter** represent as communicator between View (preparing content) and Interactor (processing logic).
- **Entity** contains model objects
- **Routing** represent as navigation logic for describing which screens are shown.

![Screenshot 2019-12-09 at 20 00 55](https://user-images.githubusercontent.com/25744906/70437785-f5e8bb00-1abe-11ea-93b5-b85f5152e95b.png)

## TDD (Test-Driven Development)
In simply, TDD starts with designing and developing test for each one of the features first. The goal of TDD is to make the code *clearer*, *testable behavior*, and *bug-free*. The cycle of perform TDD Test:
 - Add a test
 - Runs a test and see if any test fails.
 - Write development code.
 - Run test and Refactor.
 - Repeat process.

> Refactor means changing some code without affecting its behavior.

<p align="center">
  <img src="https://user-images.githubusercontent.com/25744906/70438793-2598c280-1ac1-11ea-8dd8-ae012918d618.png">
</p>

## Built with
Using `Xcode 11.1` and written with `Swift 5`.

## Credit
Created by [William](https://www.linkedin.com/in/william-b90619b7/)
