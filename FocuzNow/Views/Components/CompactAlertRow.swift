import SwiftUI

struct CompactAlertRow: View {
    let icon: String
    let title: String

    var body: some View {
        HStack(spacing: Spacing.md) {
            Text(icon)
                .font(.title3)

            Text(title)
                .font(.callout)
                .foregroundColor(.white.opacity(0.9))

            Spacer()

            Image(systemName: "chevron.right")
                .font(.caption)
                .foregroundColor(.white.opacity(0.5))
        }
        .padding(.vertical, Spacing.sm)
        .padding(.horizontal, Spacing.md)
        .background(Color.elevatedSurface.opacity(0.4))
        .cornerRadius(CornerRadius.small)
    }
}
