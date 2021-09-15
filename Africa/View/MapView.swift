//
//  MapView.swift
//  Africa
//
//  Created by Muhammad Usman on 14/09/2021.
//

import SwiftUI
import MapKit

struct MapView: View {
    @State private var region : MKCoordinateRegion = {
        let coordinate = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        let zoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        var region = MKCoordinateRegion(center: coordinate, span: zoomLevel)
        return region
    }()
    
    var locations : [NationalParkLocation] = Bundle.main.decode("locations.json")
    
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: locations, annotationContent: { item in
            MapAnnotation(coordinate: item.location) {
                MapAnnotationView(location: item)
            }
        }).overlay(
            HStack(alignment: .center, spacing: 12){
                Image("compass")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 45, height: 45, alignment: .center)
                
                VStack(alignment: .leading, spacing: 5){
                    HStack{
                    Text("Latitude")
                        .foregroundColor(.accentColor)
                        .font(.footnote)
                        .fontWeight(.bold)
                        
                        Spacer()
                        Text("\(region.center.latitude)")
                            .foregroundColor(.white)
                            .font(.footnote)
                    }
                    Divider()
                    HStack{
                    Text("Logitude")
                        .foregroundColor(.accentColor)
                        .font(.footnote)
                        .fontWeight(.bold)
                        
                        Spacer()
                        Text("\(region.center.longitude)")
                            .foregroundColor(.white)
                            .font(.footnote)
                    }
                }
            }
            .padding(.vertical, 12)
            .padding(.horizontal, 16)
            .background(
                Color.black
                    .opacity(0.6)
                    .cornerRadius(6)
            )
            .padding(.vertical, 15)
            .padding(.horizontal, 15)
            ,alignment: .top
        )
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
