import SwiftUI

class DashboardViewModel: ObservableObject {
    @Published var stats: [Stat] = []
    @Published var criticalAlerts: [Alert] = []
    @Published var behaviourMetrics: [BehaviourMetric] = []
    @Published var monitoringItems: [MonitoringItem] = []
    @Published var compactAlerts: [CompactAlert] = []

    init() {
        loadMockData()
    }

    func loadMockData() {
        // Quick Stats
        stats = [
            Stat(title: "Screen Time", value: "8h 42m", status: "Warning", statusColor: .statusWarning),
            Stat(title: "Apps Blocked", value: "27", status: "Success", statusColor: .statusSuccess),
            Stat(title: "Sites Filtered", value: "143", status: "Success", statusColor: .statusSuccess),
            Stat(title: "Alerts", value: "15", status: "Critical", statusColor: .statusCritical)
        ]

        // Critical Alerts (8 items)
        criticalAlerts = [
            Alert(
                type: .critical,
                icon: "🚨",
                title: "ANTI-TAMPER ALERT",
                message: "Child searched 'how to bypass parental controls'",
                timestamp: "2 min ago",
                severity: .critical
            ),
            Alert(
                type: .warning,
                icon: "⚠️",
                title: "VPN DETECTED",
                message: "Attempted to install VPN app",
                timestamp: "45 min ago",
                severity: .high
            ),
            Alert(
                type: .critical,
                icon: "🔒",
                title: "SUSPICIOUS ACTIVITY",
                message: "Tried to access Instagram 8 times",
                timestamp: "12 min ago",
                severity: .critical
            ),
            Alert(
                type: .warning,
                icon: "👁️",
                title: "INCOGNITO MODE",
                message: "Private browsing used 3 times",
                timestamp: "1 hr ago",
                severity: .high
            ),
            Alert(
                type: .warning,
                icon: "🌐",
                title: "BLOCKED ACCESS",
                message: "Attempted reddit.com/r/teenagers",
                timestamp: "1 hr ago",
                severity: .high
            ),
            Alert(
                type: .critical,
                icon: "💬",
                title: "INAPPROPRIATE MESSAGING",
                message: "Detected inappropriate language",
                timestamp: "2 hrs ago",
                severity: .critical
            ),
            Alert(
                type: .warning,
                icon: "📱",
                title: "SCREEN TIME EXCEEDED",
                message: "Exceeded limit by 2h 42m",
                timestamp: "3 hrs ago",
                severity: .medium
            ),
            Alert(
                type: .critical,
                icon: "🔓",
                title: "RESTRICTIONS BYPASSED",
                message: "Accessed TikTok via browser",
                timestamp: "4 hrs ago",
                severity: .critical
            )
        ]

        // Behaviour Analysis
        behaviourMetrics = [
            BehaviourMetric(
                title: "Risk Score",
                value: "87/100",
                change: "↑ 12%",
                changePercentage: "↑ 12%",
                isNegative: true
            ),
            BehaviourMetric(
                title: "Bypass Attempts",
                value: "15",
                change: "↑ 200%",
                changePercentage: "↑ 200%",
                isNegative: true
            ),
            BehaviourMetric(
                title: "Compliance",
                value: "34%",
                change: "↓ 28%",
                changePercentage: "↓ 28%",
                isNegative: true
            ),
            BehaviourMetric(
                title: "Trust Index",
                value: "Low",
                change: "↓ Critical",
                changePercentage: "↓ Critical",
                isNegative: true
            )
        ]

        // Active Monitoring (8 items)
        monitoringItems = [
            MonitoringItem(
                icon: "📍",
                category: "Location Tracking",
                status: "Active",
                detail: "Current: 123 Main St (Home)"
            ),
            MonitoringItem(
                icon: "📊",
                category: "App Usage Monitor",
                status: "Recording",
                detail: "Top: YouTube (4h 23m)"
            ),
            MonitoringItem(
                icon: "📞",
                category: "Call & SMS Logs",
                status: "Monitored",
                detail: "23 calls, 147 texts today"
            ),
            MonitoringItem(
                icon: "🔍",
                category: "Social Media Scan",
                status: "Active",
                detail: "Scanning 5 platforms"
            ),
            MonitoringItem(
                icon: "🌐",
                category: "Web History",
                status: "Tracked",
                detail: "89 websites visited"
            ),
            MonitoringItem(
                icon: "📸",
                category: "Screenshot Capture",
                status: "Enabled",
                detail: "47 screenshots today"
            ),
            MonitoringItem(
                icon: "⌨️",
                category: "Keylogger",
                status: "Active",
                detail: "3,428 keystrokes logged"
            ),
            MonitoringItem(
                icon: "📷",
                category: "Camera Access",
                status: "Monitored",
                detail: "Used 12 times today"
            )
        ]

        // Compact Alerts (20+ items)
        compactAlerts = [
            CompactAlert(icon: "🎮", title: "Gaming Restriction Violated"),
            CompactAlert(icon: "💸", title: "In-App Purchase Attempt"),
            CompactAlert(icon: "🗣️", title: "Voice Chat Detected"),
            CompactAlert(icon: "📥", title: "Unauthorized Download"),
            CompactAlert(icon: "🔊", title: "Audio Recording Flagged"),
            CompactAlert(icon: "📧", title: "Email Scan Alert"),
            CompactAlert(icon: "🎵", title: "Music Content Warning"),
            CompactAlert(icon: "📺", title: "Video Content Alert"),
            CompactAlert(icon: "🤳", title: "Selfie Camera Overuse"),
            CompactAlert(icon: "🌙", title: "Late Night Usage"),
            CompactAlert(icon: "🔋", title: "Battery Anomaly"),
            CompactAlert(icon: "📲", title: "App Sideloading Detected"),
            CompactAlert(icon: "🎯", title: "Ad Blocker Installed"),
            CompactAlert(icon: "🖼️", title: "Photo Library Access"),
            CompactAlert(icon: "🎤", title: "Microphone Permission"),
            CompactAlert(icon: "📍", title: "Location Spoofing"),
            CompactAlert(icon: "🔐", title: "Password Change Attempt"),
            CompactAlert(icon: "💾", title: "Data Usage Spike"),
            CompactAlert(icon: "🌍", title: "International Access"),
            CompactAlert(icon: "⏰", title: "Homework Time Violation"),
            CompactAlert(icon: "🔴", title: "Live Stream Detected"),
            CompactAlert(icon: "💻", title: "Developer Mode Enabled"),
            CompactAlert(icon: "🌐", title: "Proxy Server Usage"),
            CompactAlert(icon: "📱", title: "Device Jailbreak Attempt")
        ]
    }

    func refresh() {
        // Simulate refresh with haptic feedback
        let impact = UIImpactFeedbackGenerator(style: .medium)
        impact.impactOccurred()

        // In a real app, this would fetch new data
        // For now, just reload mock data
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.loadMockData()
        }
    }
}
