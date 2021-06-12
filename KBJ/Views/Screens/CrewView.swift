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
let documentDay = "fridayPM" //getDocument(day: weekDay, hour: hour)


var db: Firestore!

struct CrewView: View {
    @State var staff = ["Nick"]
    var body: some View {
        NavigationView {
            List{
                Text(staff[0])
                    .onAppear {
                        retrieveData()
                    }

            }
            
            .navigationBarTitle(documentDay)
        }.onAppear {
            doSomething()
        }
    }
    func retrieveData() {
        staff = []
        db.collection(documentDay).getDocuments { querySnapshot, error in
            if let e = error {
                print("error from retrieving \(e)")
            } else {
                if let snapshotDocuments = querySnapshot?.documents {
                    for doc in snapshotDocuments {
                        let data = doc.data()
                        if let person = data["person"] as? String {
                            staff.append(person)
                        }
                    }
                    if staff == []{
                        staff = ["error"]
                    }
                }
            }
        }
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
