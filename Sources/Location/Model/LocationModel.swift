import Foundation
import CoreLocation

public class LocationModel: ObservableObject {
    @Published var updating: Bool = false
    @Published var timestamp: Date?
    @Published var longitude: CLLocationDegrees?
    @Published var latitude: CLLocationDegrees?
    var dateFormatter: DateFormatter
    var description: String {
        get {
            if let timestamp = timestamp, let longitude = longitude, let latitude = latitude {
                return "\(dateFormatter.string(from: timestamp)): \(longitude), \(latitude)"
            }
            return "--: --, --"
        }
    }
    
    public init() {
        self.timestamp = nil
        self.longitude = nil
        self.latitude = nil
        self.dateFormatter = DateFormatter()
        self.dateFormatter.dateStyle = .none
        self.dateFormatter.timeStyle = .medium
    }
    
    public init(_ location: CLLocation) {
        self.timestamp = location.timestamp
        self.longitude = location.coordinate.longitude
        self.latitude = location.coordinate.latitude
        self.dateFormatter = DateFormatter()
        self.dateFormatter.dateStyle = .none
        self.dateFormatter.timeStyle = .medium
    }
}
