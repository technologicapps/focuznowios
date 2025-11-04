import SwiftUI

struct AlertCard: View {
    let alert: Alert

    var body: some View {
        HStack(alignment: .top, spacing: Spacing.md) {
            // Left colored border indicator
            Rectangle()
                .fill(alert.severity.color)
                .frame(width: 4)
                .cornerRadius(2)

            // Icon
            Text(alert.icon)
                .font(.title2)
                .frame(width: 40, height: 40)
                .background(alert.severity.color.opacity(0.2))
                .cornerRadius(CornerRadius.small)

            // Content
            VStack(alignment: .leading, spacing: Spacing.xs) {
                HStack {
                    Text(alert.type.rawValue.uppercased())
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(alert.severity.color)
                        .padding(.horizontal, Spacing.sm)
                        .padding(.vertical, 4)
                        .background(alert.severity.color.opacity(0.2))
                        .cornerRadius(4)

                    Spacer()

                    Text(alert.timestamp)
                        .font(.caption)
                        .foregroundColor(.white.opacity(0.5))
                }

                Text(alert.title)
                    .font(.headline)
                    .foregroundColor(.white)
                    .fontWeight(.semibold)

                Text(alert.message)
                    .font(.callout)
                    .foregroundColor(.white.opacity(0.7))
                    .lineLimit(2)
            }
        }
        .padding(Spacing.md)
        .glassmorphism()
    }
}
