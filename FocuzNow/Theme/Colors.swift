import SwiftUI

extension Color {
    // Primary Brand Colors
    static let electricPurple = Color(hex: "7B2FFF")
    static let cyanBlue = Color(hex: "00D9FF")
    static let deepSpaceBlue = Color(hex: "0A0E27")
    static let elevatedSurface = Color(hex: "1A1F3A")

    // Accent Neon Colors
    static let neonPink = Color(hex: "FF2E97")
    static let neonGreen = Color(hex: "00FF88")
    static let neonYellow = Color(hex: "FFE500")

    // Status Colors
    static let statusCritical = Color(hex: "FF3B30")
    static let statusWarning = Color(hex: "FFE500")
    static let statusSuccess = Color(hex: "00FF88")
    static let statusInfo = Color(hex: "00D9FF")

    // Gradients
    static let primaryGradient = LinearGradient(
        colors: [electricPurple, cyanBlue],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )

    static let backgroundGradient = LinearGradient(
        colors: [deepSpaceBlue, Color(hex: "1A1F3A")],
        startPoint: .top,
        endPoint: .bottom
    )

    // Helper initializer for hex colors
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
