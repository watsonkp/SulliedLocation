import Foundation
import Combine
import CoreLocation

public protocol LocationControllerProtocol {
    func toggle() -> Void
}

public class LocationController: NSObject, CLLocationManagerDelegate, LocationControllerProtocol {
    private let manager: CLLocationManager
    private var locationPublisher = PassthroughSubject<CLLocation, Never>()
    var model: LocationModel? = nil
    
    init(_ manager: CLLocationManager) {
        self.manager = manager
    }
    
    public func toggle() {
        if let model = model {
            if model.updating {
                manager.stopUpdatingLocation()
                model.updating = false
            } else {
                // Configure the location manager
                // TODO: Does order matter? Document outcome of testing.
                manager.pausesLocationUpdatesAutomatically = false
                manager.activityType = CLActivityType.fitness
                manager.desiredAccuracy = kCLLocationAccuracyBest
//                manager.allowsBackgroundLocationUpdates = true
                manager.showsBackgroundLocationIndicator = true

                manager.requestWhenInUseAuthorization()
                manager.startUpdatingLocation()
                model.updating = true
            }
        }
    }

    // Tells the delegate when the app creates the location manager and when the authorization status changes.
    public func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        NSLog("didChangeAuthorization()")
        switch manager.authorizationStatus {
        case .notDetermined:
            NSLog("didChangeAuthorization: not determined")
        case .restricted:
            NSLog("didChangeAuthorization: restricted")
        case .denied:
            NSLog("didChangeAuthorization: denied")
        case .authorizedAlways:
            NSLog("didChangeAuthorization: authorized always")
        case .authorizedWhenInUse:
            NSLog("didChangeAuthorization: authorized when in use")
        @unknown default:
            NSLog("didChangeAuthorization: WARNING unknown")
        }
    }

    // Tells the delegate that the location manager was unable to retrieve a location value.
    public func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        NSLog("didFailWithError(): \(error)")
        if let clError = error as? CLError {
            switch clError.code {
            case .locationUnknown:
                NSLog("the location manager was unable to obtain a location value right now")
            case .denied:
                NSLog("User denied access to the location service")
            case .network:
                NSLog("Network was unavailable or a network error occurred")
            case .headingFailure:
                NSLog("Location manager can’t determine the heading")
            case .rangingUnavailable:
                NSLog("Ranging is disabled")
            case .rangingFailure:
                NSLog("General ranging error occurred")
            case .promptDeclined:
                NSLog("User didn’t grant the requested temporary authorization")
            case .regionMonitoringDenied:
                NSLog("User denied access to the region monitoring service")
            case .regionMonitoringFailure:
                NSLog("Location manager failed to monitor a registered region")
            case .regionMonitoringSetupDelayed:
                NSLog("Core Location failed to initialize the region monitoring feature")
            case .regionMonitoringResponseDelayed:
                NSLog("Core Location will deliver events but they may be delayed")
            case .geocodeFoundNoResult:
                NSLog("Geocode request yielded no result")
            case .geocodeFoundPartialResult:
                NSLog("Geocode request yielded a partial result")
            case .geocodeCanceled:
                NSLog("Geocode request was canceled")
            case .deferredFailed:
                NSLog("Location manager didn’t enter deferred mode for an unknown reason")
            case .deferredNotUpdatingLocation:
                NSLog("Location manager didn’t enter deferred mode because location updates were already disabled or paused")
            case .deferredAccuracyTooLow:
                NSLog("Deferred mode isn’t supported for the requested accuracy")
            case .deferredDistanceFiltered:
                NSLog("Deferred mode doesn’t support distance filters")
            case .deferredCanceled:
                NSLog("Your app or the location manager canceled the request for deferred updates")
            @unknown default:
                NSLog("CLError.Code unknown value \(clError.code)")
            }
        }
    }

    // Tells the delegate that new location data is available.
    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        for location in locations {
            locationPublisher.send(location)
            if let model = model {
                model.timestamp = location.timestamp
                model.longitude = location.coordinate.longitude
                model.latitude = location.coordinate.latitude
            }
        }
    }

    // Tells the delegate that updates will no longer be deferred.
    public func locationManager(_ manager: CLLocationManager, didFinishDeferredUpdatesWithError error: Error?) {
        NSLog("didFinishDeferredUpdatesWithError()")
    }

    // Tells the delegate that location updates were paused.
    public func locationManagerDidPauseLocationUpdates(_ manager: CLLocationManager) {
        NSLog("didPauseLocationUpdates()")
    }

    // Tells the delegate that the delivery of location updates has resumed.
    public func locationManagerDidResumeLocationUpdates(_ manager: CLLocationManager) {
        NSLog("didResumeLocationUpdates()")
    }
}
