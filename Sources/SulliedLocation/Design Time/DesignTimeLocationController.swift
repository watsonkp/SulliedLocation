import Foundation

public class DesignTimeLocationController: LocationControllerProtocol {
    public var model: LocationModel
    public var serviceModel: LocationServicesModel

    public func toggle(always: Bool, background: Bool) {
        // TODO
    }

    public init() {
        self.model = DesignTimeLocationModel.populatedModel()
        self.serviceModel = DesignTimeLocationModel.populatedServiceModel()
    }
}
