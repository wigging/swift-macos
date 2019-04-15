import CoreLocation

let geocoder = CLGeocoder()
let address = "Knoxville, TN"

geocoder.geocodeAddressString(address) { (placemarks, error) in
    
    if let placemark = placemarks?.first {
        print("placemark -> \(placemark)")
        if let location = placemark.location,
           let name = placemark.name,
           let state = placemark.administrativeArea {
            print("name and state -> \(name), \(state)")
            print("lat -> \(location.coordinate.latitude)")
            print("lon -> \(location.coordinate.longitude)")
        }
    }
}
