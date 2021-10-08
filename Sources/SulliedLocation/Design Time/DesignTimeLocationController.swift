import Foundation
import Combine

public class DesignTimeLocationController: LocationControllerProtocol {
    public var model: LocationModel
    public var serviceModel: LocationServicesModel
    private var subscriptions: [AnyCancellable] = []
    private let timer = Timer.TimerPublisher(interval: 1.0, runLoop: .main, mode: .default).autoconnect()

    public func toggle(always: Bool, background: Bool) {
        // TODO
    }

    public init() {
        self.model = DesignTimeLocationModel.populatedModel()
        self.serviceModel = DesignTimeLocationModel.populatedServiceModel()
        timer.sink { date in
            if self.serviceModel.updating {
                if let longitude = self.model.longitude, let latitude = self.model.latitude {
                    self.model.longitude = longitude + 0.001
                    self.model.latitude = latitude + 0.001
                }
                self.model.timestamp = date
                self.serviceModel.lastUpdate = date
            }
        }.store(in: &subscriptions)
    }
}
