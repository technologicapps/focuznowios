import SwiftUI

struct Stat: Identifiable {
    let id = UUID()
    let title: String
    let value: String
    let status: String
    let statusColor: Color
}
