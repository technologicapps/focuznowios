import SwiftUI

struct BehaviourCard: View {
    let title: String
    let value: String
    let change: String
    let changePercentage: String
    let isNegative: Bool

    var changeColor: Color {
        isNegative ? .statusCritical : .statusSuccess
    }

    var changeIcon: String {
        isNegative ? "arrow.up" : "arrow.down"
    }

    var body: some View {
        VStack(alignment: .leading, spacing: Spacing.sm) {
            Text(title)
                .font(.callout)
                .foregroundColor(.white.opacity(0.7))

            Text(value)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.white)

            HStack(spacing: 4) {
                Image(systemName: changeIcon)
                    .font(.caption)
                    .foregroundColor(changeColor)

                Text(changePercentage)
                    .font(.caption)
                    .foregroundColor(changeColor)
                    .fontWeight(.medium)
            }
            .padding(.horizontal, Spacing.sm)
            .padding(.vertical, 4)
            .background(changeColor.opacity(0.2))
            .cornerRadius(4)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(Spacing.md)
        .glassmorphism()
    }
}
