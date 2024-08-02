//
//  EmployeesService.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/28/24.
//

import Foundation
import FirebaseFirestore
import FirebaseStorage

class EmployeesService: EmployeesServiceProtocol {
    private let db = Firestore.firestore()
    private let storage = Storage.storage()
}

// MARK: - Methods

extension EmployeesService {
    func getEmployees(
        onSuccess: @escaping SingleResult<[EmployeeModel]>,
        onError: @escaping ErrorResult
    ) {
        db.collection(Constants.FirestoreColumns.employees)
            .order(by: "created_at", descending: true)
            .addSnapshotListener { snapshot, error in
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
    
    func createEmployee(
        param: EmployeeParams,
        onSuccess: @escaping VoidResult,
        onError: @escaping ErrorResult
    ) {
        uploadImage(
            param: param,
            onSuccess: onSuccess,
            onError: onError
        )
    }
    
    private func uploadImage(
        param: EmployeeParams,
        onSuccess: @escaping VoidResult,
        onError: @escaping ErrorResult
    ) {
        guard let imageData = param.imageData else {
            return onError(AppError.error(reason: "No Image found"))
        }
        
        let imageRef = storage.reference()
            .child("images/profile_pic_\(UUID().uuidString).jpg")
        
        imageRef.putData(imageData) { meta, error in
            if let error {
                return onError(error)
            }
            
            imageRef.downloadURL { url, error in
                if let error {
                    return onError(error)
                }
                
                self.uploadResume(
                    imageURL: url!,
                    param: param,
                    onSuccess: onSuccess,
                    onError: onError
                )
            }
        }
    }
    
    private func uploadResume(
        imageURL: URL,
        param: EmployeeParams,
        onSuccess: @escaping VoidResult,
        onError: @escaping ErrorResult
    ) {
        guard
            let resumeURL = param.resumeLocalURL,
            resumeURL.startAccessingSecurityScopedResource(),
            let resumeData = try? Data(contentsOf: resumeURL)
        else {
            return onError(AppError.error(reason: "No Resume found"))
        }
        
        let resumeRef = storage.reference()
            .child("resumes/\(resumeURL.lastPathComponent)")
        
        resumeRef.putData(resumeData) { meta, error in
            if let error {
                return onError(error)
            }
            
            resumeURL.stopAccessingSecurityScopedResource()
            
            resumeRef.downloadURL { url, error in
                if let error {
                    return onError(error)
                }
                
                self.saveEmployeeData(
                    imageURL: imageURL,
                    resumeURL: url!,
                    param: param,
                    onSuccess: onSuccess,
                    onError: onError
                )
            }
        }
    }
    
    private func saveEmployeeData(
        imageURL: URL,
        resumeURL: URL,
        param: EmployeeParams,
        onSuccess: @escaping VoidResult,
        onError: @escaping ErrorResult
    ) {
        // TODO: - Improve conversion of params to model
        let employee = EmployeeModel(
            email: param.email ?? "",
            firstName: param.firstname ?? "",
            middleName: param.middlename ?? "",
            lastName: param.lastname ?? "",
            phoneNumber: param.phoneNumber ?? "",
            gender: param.gender ?? .other,
            birthDate: param.birthdate ?? Date(),
            role: param.role ?? "",
            isCurrentEmployedHere: param.endDate == nil,
            startDate: param.startDate ?? Date(),
            endDate: param.endDate,
            reasonForLeaving: param.reasonForLeaving ?? "",
            resume: resumeURL.absoluteString,
            personalSkills: param.personalSkills ?? [],
            technicalSkills: param.technicalSkills ?? [],
            imageURL: imageURL.absoluteString, 
            createdAt: Date()
        )
        
        do {
            try db.collection(Constants.FirestoreColumns.employees)
                .document()
                .setData(from: employee)
            
            onSuccess()
        } catch {
            onError(error)
        }
    }
}
