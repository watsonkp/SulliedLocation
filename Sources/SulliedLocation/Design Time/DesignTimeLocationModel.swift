import Foundation
import CoreLocation

public class DesignTimeLocationModel {
    public static func populatedModel() -> LocationModel {
        let location = CLLocation(coordinate: CLLocationCoordinate2D(latitude: 25.0, longitude: -75.0),
                                  altitude: 100.0,
                                  horizontalAccuracy: 4.0,
                                  verticalAccuracy: 1.0,
                                  course: 160.0,
                                  speed: 5.0,
                                  timestamp: Date())
        return LocationModel(location)
    }

    public static func populatedServiceModel() -> LocationServicesModel {
        let model = LocationServicesModel()
        model.enabled = true
        model.updating = true
        model.authorization = "Authorized when in use"
        model.error = nil
        model.lastUpdate = Date()
        return model
    }
}
