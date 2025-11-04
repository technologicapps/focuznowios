import SwiftUI

struct MonitoringCard: View {
    let item: MonitoringItem

    var body: some View {
        HStack(spacing: Spacing.md) {
            // Icon
            Text(item.icon)
                .font(.title2)
                .frame(width: 50, height: 50)
                .background(Color.electricPurple.opacity(0.2))
                .cornerRadius(CornerRadius.medium)

            // Content
            VStack(alignment: .leading, spacing: Spacing.xs) {
                HStack {
                    Text(item.category)
                        .font(.headline)
                        .foregroundColor(.white)
                        .fontWeight(.semibold)

                    Spacer()

                    StatusBadge(status: item.status)
                }

                Text(item.detail)
                    .font(.callout)
                    .foregroundColor(.white.opacity(0.7))
                    .lineLimit(1)
            }

            Spacer()
        }
        .padding(Spacing.md)
        .glassmorphism()
    }
}

struct StatusBadge: View {
    let status: String

    var statusColor: Color {
        switch status.lowercased() {
        case "active", "enabled":
            return .neonGreen
        case "recording", "monitored":
            return .statusInfo
        case "critical":
            return .statusCritical
        default:
            return .cyanBlue
        }
    }

    var body: some View {
        HStack(spacing: 4) {
            Circle()
                .fill(statusColor)
                .frame(width: 6, height: 6)

            Text(status)
                .font(.caption)
                .fontWeight(.medium)
                .foregroundColor(statusColor)
        }
        .padding(.horizontal, Spacing.sm)
        .padding(.vertical, 4)
        .background(statusColor.opacity(0.2))
        .cornerRadius(4)
    }
}
