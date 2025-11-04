import SwiftUI

// MARK: - Spacing
enum Spacing {
    static let xs: CGFloat = 4
    static let sm: CGFloat = 8
    static let md: CGFloat = 16
    static let lg: CGFloat = 24
    static let xl: CGFloat = 32
    static let xxl: CGFloat = 48
}

// MARK: - Corner Radius
enum CornerRadius {
    static let small: CGFloat = 8
    static let medium: CGFloat = 12
    static let large: CGFloat = 16
    static let xLarge: CGFloat = 24
}

// MARK: - Custom View Modifiers
struct GlowModifier: ViewModifier {
    let color: Color
    let radius: CGFloat

    func body(content: Content) -> some View {
        content
            .shadow(color: color.opacity(0.6), radius: radius, x: 0, y: 0)
            .shadow(color: color.opacity(0.3), radius: radius * 1.5, x: 0, y: 0)
    }
}

struct GlassmorphismModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(
                RoundedRectangle(cornerRadius: CornerRadius.large)
                    .fill(Color.elevatedSurface.opacity(0.6))
                    .overlay(
                        RoundedRectangle(cornerRadius: CornerRadius.large)
                            .fill(Color.white.opacity(0.05))
                    )
                    .shadow(color: .black.opacity(0.3), radius: 12, x: 0, y: 4)
            )
    }
}

struct CardShadowModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: .black.opacity(0.3), radius: 12, x: 0, y: 4)
    }
}

// MARK: - View Extensions
extension View {
    func glow(color: Color = .electricPurple, radius: CGFloat = 20) -> some View {
        self.modifier(GlowModifier(color: color, radius: radius))
    }

    func glassmorphism() -> some View {
        self.modifier(GlassmorphismModifier())
    }

    func cardShadow() -> some View {
        self.modifier(CardShadowModifier())
    }
}
