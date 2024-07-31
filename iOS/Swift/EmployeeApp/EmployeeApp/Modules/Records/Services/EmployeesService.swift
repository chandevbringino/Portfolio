//
//  EmployeesService.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/28/24.
//

import Foundation
import FirebaseFirestore

class EmployeesService: EmployeesServiceProtocol {
    private let db = Firestore.firestore()
}

// MARK: - Methods

extension EmployeesService {
    func getEmployees(
        onSuccess: @escaping SingleResult<[EmployeeModel]>,
        onError: @escaping ErrorResult
    ) {
        db.collection(Constants.FirestoreColumns.employees)
            .getDocuments { snapshot, error in
                if let error {
                    return onError(error)
                }
                
                if let documents = snapshot?.documents {
                    let employees = documents.map({ try! $0.data(as: EmployeeModel.self) })
                    onSuccess(employees)
                } else {
                    onError(AppError.dataNotFound)
                }
            }
    }
}
