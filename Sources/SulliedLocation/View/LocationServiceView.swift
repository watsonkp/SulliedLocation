import SwiftUI

public struct LocationServiceView: View {
    @ObservedObject var model: LocationServicesModel
    public var body: some View {
        VStack(alignment: .leading) {
            Text("Enabled: \(model.enabled ? "True" : "False")")
            Text("Authorization: \(model.authorization)")
            Text("Error: \(model.error)")
        }
    }

    public init(model: LocationServicesModel) {
        self.model = model
    }
}

struct LocationServiceView_Previews: PreviewProvider {
    static var previews: some View {
        LocationServiceView(model: DesignTimeLocationModel.populatedServiceModel())
    }
}
