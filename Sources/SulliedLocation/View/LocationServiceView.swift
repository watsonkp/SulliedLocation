import SwiftUI

public struct LocationServiceView: View {
    @ObservedObject var model: LocationServicesModel
    var controller: LocationControllerProtocol
    var always: Bool
    var background: Bool
    public var body: some View {
        if model.enabled {
            VStack(alignment: .leading) {
                Text("Authorization: \(model.authorization)")
                Text("Error: \(model.error)")
                Toggle("Update location", isOn: $model.updating)
                    .onChange(of: model.updating) { value in
                        NSLog("DEBUG: Toggle model updating \(model.updating) to \(value)")
                        if model.updating != value {
                            controller.toggle(always: always, background: background)
                        }
                    }
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
        LocationServiceView(model: DesignTimeLocationModel.populatedServiceModel(), controller: DesignTimeLocationController())
    }
}
