import SwiftUI

struct SongDetailView: View {

    let song: Song

    var body: some View {

        ScrollView {

            VStack(spacing: 24) {

                Image("MusicalIconGrey")
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
                    .frame(maxWidth: 250)
                    .clipShape(RoundedRectangle(cornerRadius: 16))

                VStack(spacing: 6) {

                    Text(song.trackName)
                        .font(.largeTitle)
                        .bold()

                    Text(song.artistName)
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

                        row("Genre", song.primaryGenreName)

                        Divider()

                        row("Release date", releaseDate)

                        Divider()

                        row("Album", song.collectionName)

                        Divider()

                        row("Duration", duration)

                        Divider()

                        row(
                            "Price",
                            "\(song.trackPrice.formatted(.number.precision(.fractionLength(2)))) \(song.currency)"
                        )
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
        .navigationTitle("Song Details")
        .navigationBarTitleDisplayMode(.inline)
    }

    private var duration: String {

        let seconds = song.trackTimeMillis / 1000

        return String(
            format: "%d:%02d",
            seconds / 60,
            seconds % 60
        )
    }

    private var releaseDate: String {

        let formatter = ISO8601DateFormatter()

        if let date = formatter.date(from: song.releaseDate) {

            return date.formatted(
                .dateTime.day().month(.abbreviated).year()
                    .locale(Locale(identifier: "en_GB"))
            )
        }

        return song.releaseDate
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
