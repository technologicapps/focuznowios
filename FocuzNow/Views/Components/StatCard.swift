import SwiftUI

struct StatCard: View {
    let title: String
    let value: String
    let status: String
    let statusColor: Color

    var body: some View {
        VStack(spacing: Spacing.sm) {
            Text(title)
                .font(.callout)
                .foregroundColor(.white.opacity(0.7))
                .multilineTextAlignment(.center)

            Text(value)
                .font(.system(size: 32, weight: .bold))
                .foregroundColor(.white)

            HStack(spacing: 4) {
                Circle()
                    .fill(statusColor)
                    .frame(width: 6, height: 6)

                Text(status)
                    .font(.caption)
                    .foregroundColor(statusColor)
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, Spacing.lg)
        .glassmorphism()
    }
}
