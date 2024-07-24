//
//  Closures.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/23/24.
//

import Foundation

typealias EmptyResult<ReturnType> = () -> ReturnType
typealias SingleResultWithReturn<T, ReturnType> = ((T) -> ReturnType)
typealias SingleResult<T> = SingleResultWithReturn<T, Void>
typealias VoidResult = EmptyResult<Void>
typealias ErrorResult = SingleResult<Error>
