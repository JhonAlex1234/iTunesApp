import SwiftUI

struct SearchStateComponent: View {

    let icon: String
    let title: String
    let message: String

    var isLoading: Bool = false
    var buttonTitle: String? = nil
    var action: (() -> Void)? = nil

    var body: some View {

        VStack(spacing: 12) {

            ZStack {
                Circle()
                    .fill(Color.accentColor.opacity(0.10))
                    .frame(width: 80, height: 80)

                if isLoading {
                    ProgressView()
                        .tint(Color.accentColor)
                        .controlSize(.large)
                } else {
                    Image(systemName: icon)
                        .font(.title)
                        .foregroundStyle(Color.accentColor)
                }
            }

            Text(title)
                .font(.title2)
                .bold()

            Text(message)
                .font(.subheadline)
                .foregroundStyle(.secondary)

            if let buttonTitle, let action {
                Button(buttonTitle, action: action)
                    .buttonStyle(.borderedProminent)
                    .padding(.top, 8)
            }
        }
        .multilineTextAlignment(.center)
        .padding(24)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemGroupedBackground))
    }
}
