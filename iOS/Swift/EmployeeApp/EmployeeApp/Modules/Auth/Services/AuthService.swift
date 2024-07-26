//
//  AuthService.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/26/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class AuthService: AuthServiceProtocol {
    private let db = Firestore.firestore()
}

// MARK: - Methods

extension AuthService {
    func signInUser(
        email: String,
        password: String,
        onSuccess: @escaping SingleResult<UserModel>,
        onError: @escaping ErrorResult
    ) {
        Auth.auth().signIn(
            withEmail: email,
            password: password
        ) { [unowned self] dataResult, error in
            if let error {
                return onError(error)
            }
            
            guard let user = dataResult?.user else {
                return onError(AppError.dataNotFound)
            }
            
            self.fetchUserRecord(
                user: user,
                onSuccess: onSuccess,
                onError: onError
            )
        }
    }
    
    private func fetchUserRecord(
        user: User,
        onSuccess: @escaping SingleResult<UserModel>,
        onError: @escaping ErrorResult
    ) {
        db.collection(Constants.FirestoreColumns.users)
            .document(user.uid)
            .getDocument(as: UserModel.self) { response in
                switch response {
                case .success(let userModel):
                    // TODO: - Do saving of data in local db in Service layer
                    onSuccess(userModel)
                case .failure(let error):
                    onError(error)
                }
            }
    }
    
    func registerUser(
        param: UserParams,
        onSuccess: @escaping SingleResult<UserModel>,
        onError: @escaping ErrorResult
    ) {
        Auth.auth().createUser(
            withEmail: param.email,
            password: param.password
        ) { [unowned self] dataResult, error in
            if let error {
                return onError(error)
            }
            
            guard let user = dataResult?.user else {
                return onError(AppError.dataNotFound)
            }
            
            let userModel = UserModel(
                id: user.uid,
                email: user.email ?? "",
                firstName: param.firstName,
                middleName: param.middleName,
                lastName: param.lastName,
                phoneNumber: param.phoneNumber,
                gender: param.gender ?? .other,
                birthDate: param.birthdate ?? Date(),
                role: param.role
            )
            
            self.createUserRecord(
                userModel: userModel,
                onSuccess: onSuccess,
                onError: onError
            )
        }
    }
    
    private func createUserRecord(
        userModel: UserModel,
        onSuccess: @escaping SingleResult<UserModel>,
        onError: @escaping ErrorResult
    ) {
        do {
            try db
                .collection(Constants.FirestoreColumns.users)
                .document(userModel.id)
                .setData(from: userModel)
            // TODO: - Do saving of data in local db in Service layer
            onSuccess(userModel)
        } catch let error {
            onError(error)
        }
    }
    
    func signoutUser(
        onSuccess: @escaping VoidResult,
        onError: @escaping ErrorResult
    ) {
        do {
            try Auth.auth().signOut()
            onSuccess()
        } catch let error {
            onError(error)
        }
    }
}
