import Foundation

public class LocationServicesModel: ObservableObject {
    @Published var enabled = false
    @Published var authorization: String = "Not determined"
    @Published var error: String = "nil"
}
