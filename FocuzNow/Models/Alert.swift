import SwiftUI

struct Alert: Identifiable {
    let id = UUID()
    let type: AlertType
    let icon: String
    let title: String
    let message: String
    let timestamp: String
    let severity: Severity
}

enum AlertType: String {
    case critical = "Critical"
    case warning = "Warning"
    case info = "Info"
}

enum Severity {
    case critical
    case high
    case medium
    case low

    var color: Color {
        switch self {
        case .critical:
            return .statusCritical
        case .high:
            return .statusWarning
        case .medium:
            return .statusInfo
        case .low:
            return .statusSuccess
        }
    }
}
