import SwiftUI

struct LocationServiceView: View {
    @ObservedObject var model: LocationServicesModel
    var body: some View {
        VStack(alignment: .leading) {
            Text("Enabled: \(model.enabled ? "True" : "False")")
            Text("Authorization: \(model.authorization)")
            Text("Error: \(model.error)")
        }
    }
}

struct LocationServiceView_Previews: PreviewProvider {
    static var previews: some View {
        LocationServiceView(model: DesignTimeLocationModel.populatedServiceModel())
    }
}
