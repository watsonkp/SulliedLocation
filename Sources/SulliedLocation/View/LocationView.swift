import SwiftUI

public struct LocationView: View {
    let controller: LocationControllerProtocol
    @ObservedObject var model: LocationModel
    public var body: some View {
        VStack {
            Button(action: { controller.toggle(always: false, background: false) }) {
                Text("\(model.updating ? "Stop" : "Start")")
            }
            Text("\(model.description)")
        }
    }
    public init(controller: LocationControllerProtocol, model: LocationModel) {
        self.controller = controller
        self.model = model
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView(controller: DesignTimeLocationController(),
                     model: DesignTimeLocationModel.populatedModel())
    }
}
