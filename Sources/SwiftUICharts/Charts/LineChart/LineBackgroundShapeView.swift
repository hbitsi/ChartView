import SwiftUI

struct LineBackgroundShapeView: View {
    var chartData: ChartData
    var geometry: GeometryProxy
    var style: ChartStyle

    var body: some View {
        LineBackgroundShape(data: chartData.normalisedPoints)
            .transform(CGAffineTransform(scaleX: geometry.size.width / CGFloat(chartData.normalisedPoints.count - 1),
                                         y: geometry.size.height / CGFloat(chartData.normalisedRange)))
            .fill(LinearGradient(gradient: Gradient(colors: style.backgroundGradient ?? []),
                                 startPoint: .top,
                                 endPoint: .bottom))
            .rotationEffect(.degrees(180), anchor: .center)
            .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
    }
}
