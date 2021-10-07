import Foundation
import CoreLocation

public class LocationModel: ObservableObject {
    @Published var updating: Bool = false
    @Published var timestamp: Date?
    @Published var longitude: CLLocationDegrees?
    @Published var latitude: CLLocationDegrees?
    @Published var horizontalAccuracy: CLLocationAccuracy?
    @Published var altitude: CLLocationDistance?
    var dateFormatter: DateFormatter
    var description: String {
        get {
            if let longitude = longitude, let latitude = latitude, let accuracy = horizontalAccuracy, let altitude = altitude {
                return String(format: "%.6f, %.6f ±%.0f m %.0f m", longitude, latitude, accuracy, altitude)
            }
            return "--, --"
        }
    }

    var lastUpdateDescription: String {
        get {
            if let timestamp = timestamp {
                return dateFormatter.string(from: timestamp)
            } else {
                return "--:--:--"
            }
        }
    }
    
    public init() {
        self.timestamp = nil
        self.longitude = nil
        self.latitude = nil
        self.horizontalAccuracy = nil
        self.altitude = nil
        self.dateFormatter = DateFormatter()
        self.dateFormatter.dateStyle = .none
        self.dateFormatter.timeStyle = .medium
    }
    
    public init(_ location: CLLocation) {
        self.timestamp = location.timestamp
        self.longitude = location.coordinate.longitude
        self.latitude = location.coordinate.latitude
        self.horizontalAccuracy = location.horizontalAccuracy
        self.altitude = location.altitude
        self.dateFormatter = DateFormatter()
        self.dateFormatter.dateStyle = .none
        self.dateFormatter.timeStyle = .medium
    }
}
