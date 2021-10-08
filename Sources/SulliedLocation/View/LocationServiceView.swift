import SwiftUI

public struct LocationServiceView: View {
    @ObservedObject var model: LocationServicesModel
    var controller: LocationControllerProtocol
    var always: Bool
    var background: Bool
    public var body: some View {
        if model.enabled {
            Toggle(isOn: $model.updating) {
                VStack(alignment: .leading) {
                    Text("Location updates")
                        .font(.headline)
                    Text(model.authorization)
                        .font(.subheadline)
                    if model.error != nil {
                        Text("\(model.error!)")
                    }
                    Text("Updated at \(model.lastUpdateDescription)")
                        .font(.subheadline)
                }
            }.onChange(of: model.updating) { value in
                    NSLog("DEBUG: Toggle model updating \(model.updating) to \(value)")
                    controller.toggle(always: always, background: background)
                }
        } else {
            Text("Need to enable location services in settings")
        }
    }

    public init(model: LocationServicesModel, controller: LocationControllerProtocol, always: Bool = false, background: Bool = false) {
        self.model = model
        self.controller = controller
        self.always = always
        self.background = background
    }
}

struct LocationServiceView_Previews: PreviewProvider {
    static var previews: some View {
        let controller = DesignTimeLocationController()
        LocationServiceView(model: controller.serviceModel, controller: controller)
    }
}
