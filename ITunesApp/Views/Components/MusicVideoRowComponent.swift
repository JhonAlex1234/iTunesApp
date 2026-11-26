import SwiftUI

struct MusicVideoRowComponent: View {

    let trackName: String
    let artistName: String
    let trackTimeMillis: Int?

    var body: some View {

        HStack(spacing: 12) {

            Image("VideoIconGrey")
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 60)
                .clipShape(RoundedRectangle(cornerRadius: 8))

            VStack(alignment: .leading, spacing: 4) {

                Text(trackName)
                    .font(.headline)
                    .foregroundStyle(.primary)

                Text(artistName)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)

                Text(duration)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }

            Spacer()
        }
        .padding(.vertical, 4)
    }

    private var duration: String {

        guard let trackTimeMillis else {
            return "—"
        }

        let seconds = trackTimeMillis / 1000

        return String(
            format: "%d:%02d",
            seconds / 60,
            seconds % 60
        )
    }
}
