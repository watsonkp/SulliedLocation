import SwiftUI

public struct LocationView: View {
    @ObservedObject var model: LocationModel
    public var body: some View {
        VStack(alignment: .leading) {
            Text("\(model.description)")
                .font(.body)
            Text("Updated \(model.lastUpdateDescription)")
                .font(.footnote)
        }
    }
    public init(model: LocationModel) {
        self.model = model
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        let controller = DesignTimeLocationController()
        LocationView(model: controller.model)
    }
}
