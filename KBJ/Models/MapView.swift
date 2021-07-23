//
//  MapView.swift
//  KBJ
//
//  Created by Other user on 7/22/21.
//
import SwiftUI
import MapKit

struct MapView: View {
    
    //cordinares
    @State private var region = MKCoordinateRegion(
           center: CLLocationCoordinate2D(latitude: 33.053632, longitude: -96.795217),
           span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
       )
    
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: pointsOfInterest) { item in
            MapMarker(coordinate: item.coordinate, tint: .red)
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
struct AnnotatedItem: Identifiable {
    let id = UUID()
    var name: String
    var coordinate: CLLocationCoordinate2D
}
private var pointsOfInterest = [
    AnnotatedItem(name: "Kenny's", coordinate: .init(latitude: 33.053632, longitude: -96.795217))
    ]
