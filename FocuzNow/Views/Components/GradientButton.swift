import SwiftUI

struct GradientButton: View {
    let title: String
    let icon: String?
    let action: () -> Void
    var isPrimary: Bool = true

    @State private var isPressed = false

    var body: some View {
        Button(action: {
            // Haptic feedback
            let impact = UIImpactFeedbackGenerator(style: .light)
            impact.impactOccurred()

            action()
        }) {
            HStack(spacing: Spacing.sm) {
                if let icon = icon {
                    Image(systemName: icon)
                        .font(.headline)
                }
                Text(title)
                    .font(.headline)
                    .fontWeight(.semibold)
            }
            .frame(maxWidth: .infinity)
            .frame(height: 54)
            .background(
                Group {
                    if isPrimary {
                        Color.primaryGradient
                    } else {
                        Color.clear
                    }
                }
            )
            .foregroundColor(.white)
            .overlay(
                RoundedRectangle(cornerRadius: CornerRadius.medium)
                    .stroke(isPrimary ? Color.clear : Color.cyanBlue, lineWidth: 2)
            )
            .cornerRadius(CornerRadius.medium)
            .scaleEffect(isPressed ? 0.95 : 1.0)
            .glow(color: isPrimary ? .electricPurple : .cyanBlue, radius: isPrimary ? 20 : 10)
        }
        .buttonStyle(PlainButtonStyle())
        .simultaneousGesture(
            DragGesture(minimumDistance: 0)
                .onChanged { _ in
                    withAnimation(.spring(response: 0.3)) {
                        isPressed = true
                    }
                }
                .onEnded { _ in
                    withAnimation(.spring(response: 0.3)) {
                        isPressed = false
                    }
                }
        )
    }
}
