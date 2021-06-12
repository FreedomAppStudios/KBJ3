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
    @State var jobs = ["Nick","Nathan", "Emma"]
    @State var bodies = [cellShape(name: "Nick", title: "Host")]
    @State var num = 0
    @State var hasRun = false
    var body: some View {
        NavigationView {
            List(bodies, id: \.name) { staf in
                VStack {
                    Text(staf.name)
                        .bold()
                        .onAppear {
                            retrieveData()
                        }
                        .font(.title)
                    
                    Text(staf.title)
                        //.foregroundColor(.white)
                        .font(.caption)
                        
                    
                }
            }
            
            //.colorMultiply(Color.red).padding(.top)
            .navigationBarTitle(dayString)
            
        }
        .listRowBackground(Color.red)
        .background(Color.red)
        
    }
//    init() {
//        UITableView.appearance().separatorStyle = .none
//        UITableViewCell.appearance().backgroundColor = .white
//        UITableView.appearance().backgroundColor = .white
//    }
func retrieveData() {
    //staff = ["nil"]
    if hasRun == false {
        hasRun = true
        staff = []
        db.collection(documentDay).getDocuments { querySnapshot, error in
            if let e = error {
                staff = ["error fetching server"]
                print(e)
            } else {
                //staff = ["found documents"]
                if let snapshotDocuments = querySnapshot?.documents {
                    //staff = ["got inside"]
                    for doc in snapshotDocuments {
                        //staff = ["even farther"]
                        let data = doc.data()
                        if let person = data["person"] as? String, let job = data["job"] as? String{
                            //let count = staff.count
                            let staffMember = person
                            staff.append(staffMember)
                            jobs.append(job)
                            bodies.append(cellShape(name: staffMember, title: job))
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
struct cellShape {
    let name: String
    let title: String
}

