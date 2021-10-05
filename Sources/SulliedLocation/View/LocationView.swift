import SwiftUI

public struct LocationView: View {
    @ObservedObject var model: LocationModel
    public var body: some View {
        Text("\(model.description)")
    }
    public init(model: LocationModel) {
        self.model = model
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView(model: DesignTimeLocationModel.populatedModel())
    }
}
