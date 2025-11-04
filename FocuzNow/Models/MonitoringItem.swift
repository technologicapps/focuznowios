import Foundation

struct MonitoringItem: Identifiable {
    let id = UUID()
    let icon: String
    let category: String
    let status: String
    let detail: String
}
