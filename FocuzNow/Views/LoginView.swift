import SwiftUI

struct LoginView: View {
    @Binding var isLoggedIn: Bool
    @State private var showAlert = false
    @State private var animateGlow = false

    var body: some View {
        ZStack {
            // Background gradient
            Color.backgroundGradient
                .ignoresSafeArea()

            // Neon glow circles
            GeometryReader { geometry in
                Circle()
                    .fill(Color.electricPurple.opacity(0.3))
                    .frame(width: 300, height: 300)
                    .blur(radius: 100)
                    .offset(x: -100, y: -100)
                    .scaleEffect(animateGlow ? 1.2 : 1.0)

                Circle()
                    .fill(Color.cyanBlue.opacity(0.3))
                    .frame(width: 250, height: 250)
                    .blur(radius: 80)
                    .position(x: geometry.size.width - 50, y: geometry.size.height * 0.3)
                    .scaleEffect(animateGlow ? 1.0 : 1.2)

                Circle()
                    .fill(Color.neonPink.opacity(0.2))
                    .frame(width: 200, height: 200)
                    .blur(radius: 70)
                    .position(x: geometry.size.width * 0.5, y: geometry.size.height - 150)
                    .scaleEffect(animateGlow ? 1.1 : 0.9)
            }

            // Content
            VStack(spacing: Spacing.xl) {
                Spacer()

                // Logo and Title
                VStack(spacing: Spacing.md) {
                    Text("FocuzNow")
                        .font(.system(size: 48, weight: .bold))
                        .foregroundColor(.white)
                        .glow(color: .electricPurple, radius: 30)

                    Text("Parental Control Reimagined")
                        .font(.title3)
                        .foregroundColor(.cyanBlue)
                        .fontWeight(.medium)
                }

                Spacer()

                // Buttons
                VStack(spacing: Spacing.md) {
                    GradientButton(
                        title: "Log In",
                        icon: "lock.shield.fill",
                        action: {
                            withAnimation(.spring(response: 0.6)) {
                                isLoggedIn = true
                            }
                        },
                        isPrimary: true
                    )

                    GradientButton(
                        title: "Create Account",
                        icon: "person.badge.plus",
                        action: {
                            showAlert = true
                        },
                        isPrimary: false
                    )
                }
                .padding(.horizontal, Spacing.xl)

                // Footer
                VStack(spacing: Spacing.sm) {
                    HStack(spacing: Spacing.sm) {
                        Image(systemName: "checkmark.shield.fill")
                            .foregroundColor(.neonGreen)
                        Text("Secure")
                            .foregroundColor(.white.opacity(0.7))

                        Text("•")
                            .foregroundColor(.white.opacity(0.5))

                        Image(systemName: "eye.slash.fill")
                            .foregroundColor(.cyanBlue)
                        Text("Private")
                            .foregroundColor(.white.opacity(0.7))

                        Text("•")
                            .foregroundColor(.white.opacity(0.5))

                        Image(systemName: "brain.head.profile")
                            .foregroundColor(.electricPurple)
                        Text("Intelligent")
                            .foregroundColor(.white.opacity(0.7))
                    }
                    .font(.callout)
                }
                .padding(.bottom, Spacing.xl)
            }
        }
        .onAppear {
            withAnimation(.easeInOut(duration: 3).repeatForever(autoreverses: true)) {
                animateGlow = true
            }
        }
        .alert("Development in Progress", isPresented: $showAlert) {
            Button("OK", role: .cancel) { }
        } message: {
            Text("Account creation is coming soon!")
        }
    }
}
