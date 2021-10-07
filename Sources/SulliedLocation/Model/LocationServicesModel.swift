import Foundation

public class LocationServicesModel: ObservableObject {
    @Published var enabled = false
    @Published var updating = false
    @Published var authorization: String = "Not determined"
    @Published var error: String? = nil
    var lastUpdate: Date? = nil
    private let dateFormatter: DateFormatter

    var lastUpdateDescription: String {
        get {
            if let timestamp = lastUpdate {
                return dateFormatter.string(from: timestamp)
            } else {
                return "--:--:--"
            }
        }
    }

    public init() {
        self.dateFormatter = DateFormatter()
        self.dateFormatter.dateStyle = .none
        self.dateFormatter.timeStyle = .medium
    }
}
