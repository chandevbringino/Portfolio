//
//  ContentViewFour.swift
//  WeSplit
//
//  Created by Christian Bringino on 6/22/24.
//

import SwiftUI

struct ContentViewFour: View {
    @State private var marathon = Measurement(value: 26.2, unit: UnitLength.miles)
    @State private var name = PersonNameComponents(
        givenName: "Christian Jay",
        middleName: "Aguilos",
        familyName: "Bringino",
        nickname: "CJ"
    )
    
    var body: some View {
        Text("Week of the Year \(Date().formatted(.dateTime.week()))")
        Text("Week of Month \(Date().formatted(.dateTime.week(.weekOfMonth)))")
        Text("Weekday \(Date().formatted(.dateTime.weekday(.wide)))")
        Text("Day of Month \(Date().formatted(.dateTime.day(.ordinalOfDayInMonth)))")
        
        Text("Time \(Date().formatted(.dateTime.hour(.twoDigits(amPM: .omitted))))")
            .padding(.bottom, 30)
        
        Text(marathon, format: .measurement(width: .wide))
            .padding(.bottom, 50)
        
        Text("My name: ")
        + Text(
            name,
            format: .name(style: .short)
        )
    }
}

#Preview {
    ContentViewFour()
}
