//
//  
//  RandomUserDetailsViewModel.swift
//  RandomUsersApp
//
//  Created by Christian Bringino on 8/3/24.
//
//
import Foundation

class RandomUserDetailsViewModel: RandomUserDetailsViewModelProtocol {
    private let user: UserModel
    
    init(user: UserModel) {
        self.user = user
    }
}

// MARK: - Getters

extension RandomUserDetailsViewModel {
    var fullname: String { firstname + " " + lastname }
    var firstname: String { user.name.first }
    var lastname: String { user.name.last }
    var birthday: String {
        let formatter = Constants.serverDateFormatter
        guard let bdate = formatter.date(from: user.dob.date ?? "") else { return "N/A" }
        let bdayFormatter = Constants.birthdateFormatter
        return bdayFormatter.string(from: bdate)
    }
    var age: String { "\(user.dob.age ?? 0)" }
    var email: String { user.email }
    var mobileNumber: String { user.cell }
    var address: String {
        let number = location.street.number ?? 0
        let streetname = location.street.name ?? ""
        let city = location.city ?? ""
        let state = location.state ?? ""
        let country = location.country ?? ""
        
        return "\(number) \(streetname), \(city), \(state), \(country)"
    }
    
    private var location: Location {
        user.location
    }
    
    var imageURL: URL? { URL(string: user.picture.large ?? "") }
}
