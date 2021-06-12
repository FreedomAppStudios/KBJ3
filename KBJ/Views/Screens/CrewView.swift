//
//  CrewView.swift
//  KBJ
//
//  Created by Other user on 6/11/21.
//

import SwiftUI

import Firebase

let date = Date()
let calendar = Calendar.current
let hour = calendar.component(.hour, from: date)
let minutes = calendar.component(.minute, from: date)
let weekDay = Date().dayNumberOfWeek()!
var dayString = getDayOfWeek(input: weekDay)
let documentDay = getDocument(day: weekDay, hour: hour)


let db = Firestore.firestore()

struct CrewView: View {
    @State var staff = ["Nick","Nathan", "Emma"]
    @State var num = 0
    var body: some View {
        NavigationView {
            List(staff, id: \.self) { staf in
                Text(staf)
                    .onAppear {
                        retrieveData()
                    }
            }
        }
        .navigationBarTitle(documentDay)
    }
func retrieveData() {
    staff = []
    db.collection(documentDay).addSnapshotListener { querySnapshot, error in
        if let e = error {
            //staff = ["error getting documents"]
        } else {
            //staff = ["found documents"]
            if let snapshotDocuments = querySnapshot?.documents {
                //staff = ["got inside"]
                for doc in snapshotDocuments {
                    staff = ["even farther"]
                    let data = doc.data()
                    if let person = data["person"] as? String {
                        //let count = staff.count
                        let staffMember = person
                        staff.append(staffMember)
                        num = 1
                    }
                }
            }
        }
    }
//    if staff == []{
//        staff = ["this error"]
//    }
}
}

struct CrewView_Previews: PreviewProvider {
    static var previews: some View {
        CrewView()
    }
}
extension Date {
    func dayNumberOfWeek() -> Int? {
        return Calendar.current.dateComponents([.weekday], from: self).weekday
    }
}
func getDayOfWeek(input: Int) -> String {
    let days = ["Sunday","Monday","Tueday","Wednesday", "Thursday","Friday", "Saturday"]
    let new = input-1
    return days[new]
}
func getDocument(day: Int, hour: Int) -> String {
    let days = ["sunday","monday","tueday","wednesday", "thursday","friday", "saturday"]
    var shift = "hello world"
    if hour >= 16 {
        shift = "PM"
    } else {
        shift = "AM"
    }
    return days[day-1] + shift
}

func doSomething() {
    dayString = "hello"
}

