import Foundation

struct BehaviourMetric: Identifiable {
    let id = UUID()
    let title: String
    let value: String
    let change: String
    let changePercentage: String
    let isNegative: Bool
}
