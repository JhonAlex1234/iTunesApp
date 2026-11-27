
import SwiftUI
import AVKit

struct MusicVideoDetailView: View {

    let video: MusicVideo

    @State private var player: AVPlayer?

    var body: some View {

        ScrollView {

            VStack(spacing: 24) {


                videoPreview


                VStack(spacing: 6) {

                    Text(video.trackName)
                        .font(.largeTitle)
                        .bold()

                    Text(video.artistName)
                        .font(.title3)
                        .foregroundStyle(.secondary)
                }
                .multilineTextAlignment(.center)
                

                VStack(alignment: .leading, spacing: 8) {

                    Text("INFORMATION")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                        .padding(.leading, 12)

                    VStack(spacing: 0) {

                        row("Genre", video.primaryGenreName)

                        Divider()

                        row("Release date", releaseDate)

                        Divider()

                        row("Duration", duration)

                        Divider()

                        row("Price", price)
                    }
                    .padding(.horizontal, 16)
                    .background(
                        Color(.secondarySystemGroupedBackground)
                    )
                    .clipShape(
                        RoundedRectangle(cornerRadius: 16)
                    )
                }
            }
            .frame(maxWidth: .infinity)
            .padding(20)
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle("Video Details")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {

            if let previewUrl = video.previewUrl,
               let url = URL(string: previewUrl),
               !previewUrl.isEmpty {

                player = AVPlayer(url: url)
            }
        }
        .onDisappear {
            player?.pause()
            player = nil
        }
    }

    

    private var videoPreview: some View {

        ZStack {

            Color.black

            if let player {

                VideoPlayer(player: player)

            } else {

                VStack(spacing: 12) {

                    Image("VideoIconGrey")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .clipShape(
                            RoundedRectangle(cornerRadius: 12)
                        )

                    Text("Preview unavailable")
                        .font(.caption)
                        .foregroundStyle(.white.opacity(0.7))
                }
            }
        }
        .aspectRatio(16.0 / 9.0, contentMode: .fit)
        .clipShape(
            RoundedRectangle(cornerRadius: 16)
        )
    }

    

    private var duration: String {

        guard let trackTimeMillis = video.trackTimeMillis else {
            return "—"
        }

        let seconds = trackTimeMillis / 1000

        return String(
            format: "%d:%02d",
            seconds / 60,
            seconds % 60
        )
    }

    

    private var releaseDate: String {

        let formatter = ISO8601DateFormatter()

        if let date = formatter.date(from: video.releaseDate) {

            return date.formatted(
                .dateTime.day().month(.abbreviated).year()
                    .locale(Locale(identifier: "en_GB"))
            )
        }

        return video.releaseDate
    }

    

    private var price: String {

        guard let trackPrice = video.trackPrice else {
            return "—"
        }

        return "\(trackPrice.formatted(.number.precision(.fractionLength(2)))) \(video.currency)"
    }



    private func row(_ label: String, _ value: String) -> some View {

        HStack {

            Text(label)
                .foregroundStyle(.secondary)

            Spacer()

            Text(value)
                .fontWeight(.medium)
                .multilineTextAlignment(.trailing)
        }
        .font(.subheadline)
        .padding(.vertical, 14)
    }
}
