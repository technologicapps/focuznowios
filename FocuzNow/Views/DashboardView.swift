import SwiftUI

struct DashboardView: View {
    @Binding var isLoggedIn: Bool
    @StateObject private var viewModel = DashboardViewModel()
    @State private var isRefreshing = false
    @State private var pulseAnimation = false

    var body: some View {
        NavigationView {
            ZStack {
                // Background
                Color.deepSpaceBlue
                    .ignoresSafeArea()

                ScrollView {
                    VStack(spacing: Spacing.lg) {
                        // Status Header
                        HStack {
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Parent Dashboard")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)

                                HStack(spacing: 6) {
                                    Circle()
                                        .fill(Color.neonGreen)
                                        .frame(width: 8, height: 8)
                                        .scaleEffect(pulseAnimation ? 1.2 : 1.0)

                                    Text("LIVE")
                                        .font(.caption)
                                        .fontWeight(.bold)
                                        .foregroundColor(.neonGreen)
                                }
                            }

                            Spacer()

                            Button(action: {
                                withAnimation {
                                    isLoggedIn = false
                                }
                            }) {
                                Image(systemName: "rectangle.portrait.and.arrow.right")
                                    .foregroundColor(.cyanBlue)
                                    .font(.title3)
                            }
                        }
                        .padding(.horizontal, Spacing.lg)
                        .padding(.top, Spacing.md)

                        // Quick Stats Grid
                        LazyVGrid(columns: [
                            GridItem(.flexible(), spacing: Spacing.md),
                            GridItem(.flexible(), spacing: Spacing.md)
                        ], spacing: Spacing.md) {
                            ForEach(viewModel.stats) { stat in
                                StatCard(
                                    title: stat.title,
                                    value: stat.value,
                                    status: stat.status,
                                    statusColor: stat.statusColor
                                )
                            }
                        }
                        .padding(.horizontal, Spacing.lg)

                        // Critical Alerts Section
                        VStack(alignment: .leading, spacing: Spacing.md) {
                            HStack {
                                Text("🚨")
                                    .font(.title2)
                                Text("Critical Alerts")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)

                                Spacer()

                                Text("\(viewModel.criticalAlerts.count)")
                                    .font(.headline)
                                    .foregroundColor(.statusCritical)
                                    .padding(.horizontal, Spacing.sm)
                                    .padding(.vertical, 4)
                                    .background(Color.statusCritical.opacity(0.2))
                                    .cornerRadius(6)
                            }
                            .padding(.horizontal, Spacing.lg)

                            ScrollView(.vertical, showsIndicators: false) {
                                VStack(spacing: Spacing.md) {
                                    ForEach(viewModel.criticalAlerts) { alert in
                                        AlertCard(alert: alert)
                                    }
                                }
                                .padding(.horizontal, Spacing.lg)
                            }
                        }

                        // Behaviour Analysis Section
                        VStack(alignment: .leading, spacing: Spacing.md) {
                            HStack {
                                Text("📊")
                                    .font(.title2)
                                Text("Behaviour Analysis")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                            }
                            .padding(.horizontal, Spacing.lg)

                            LazyVGrid(columns: [
                                GridItem(.flexible(), spacing: Spacing.md),
                                GridItem(.flexible(), spacing: Spacing.md)
                            ], spacing: Spacing.md) {
                                ForEach(viewModel.behaviourMetrics) { metric in
                                    BehaviourCard(
                                        title: metric.title,
                                        value: metric.value,
                                        change: metric.change,
                                        changePercentage: metric.changePercentage,
                                        isNegative: metric.isNegative
                                    )
                                }
                            }
                            .padding(.horizontal, Spacing.lg)
                        }

                        // Active Monitoring Section
                        VStack(alignment: .leading, spacing: Spacing.md) {
                            HStack {
                                Text("👁️")
                                    .font(.title2)
                                Text("Active Monitoring")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)

                                Spacer()

                                Text("\(viewModel.monitoringItems.count) Active")
                                    .font(.caption)
                                    .foregroundColor(.neonGreen)
                                    .padding(.horizontal, Spacing.sm)
                                    .padding(.vertical, 4)
                                    .background(Color.neonGreen.opacity(0.2))
                                    .cornerRadius(6)
                            }
                            .padding(.horizontal, Spacing.lg)

                            VStack(spacing: Spacing.md) {
                                ForEach(viewModel.monitoringItems) { item in
                                    MonitoringCard(item: item)
                                }
                            }
                            .padding(.horizontal, Spacing.lg)
                        }

                        // Additional Alerts Section
                        VStack(alignment: .leading, spacing: Spacing.md) {
                            HStack {
                                Text("⚡")
                                    .font(.title2)
                                Text("Additional Alerts")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)

                                Spacer()

                                Text("\(viewModel.compactAlerts.count)")
                                    .font(.caption)
                                    .foregroundColor(.statusWarning)
                                    .padding(.horizontal, Spacing.sm)
                                    .padding(.vertical, 4)
                                    .background(Color.statusWarning.opacity(0.2))
                                    .cornerRadius(6)
                            }
                            .padding(.horizontal, Spacing.lg)

                            VStack(spacing: Spacing.sm) {
                                ForEach(viewModel.compactAlerts) { alert in
                                    CompactAlertRow(icon: alert.icon, title: alert.title)
                                }
                            }
                            .padding(.horizontal, Spacing.lg)
                        }

                        // Bottom padding for safe area
                        Color.clear.frame(height: Spacing.xl)
                    }
                    .padding(.top, Spacing.xs)
                }
                .refreshable {
                    await refreshData()
                }
            }
            .navigationBarHidden(true)
        }
        .onAppear {
            withAnimation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true)) {
                pulseAnimation = true
            }
        }
    }

    private func refreshData() async {
        isRefreshing = true
        viewModel.refresh()
        try? await Task.sleep(nanoseconds: 1_000_000_000)
        isRefreshing = false
    }
}
