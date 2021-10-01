import Foundation

public class DesignTimeLocationController: LocationControllerProtocol {
    public var model: LocationModel

    public func toggle() {
        // TODO
    }

    public init() {
        self.model = DesignTimeLocationModel.populatedModel()
    }
}
