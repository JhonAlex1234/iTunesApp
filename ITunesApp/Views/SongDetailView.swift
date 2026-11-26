import SwiftUI

struct SongDetailView: View {

    let song: Song

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Image("MusicalIconGrey")
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                    .frame(maxWidth: 280)
                    .frame(maxWidth: .infinity)
                    .accessibilityHidden(true)

                VStack(alignment: .leading) {
                    Text(song.trackName)
                        .font(.largeTitle)
                        .bold()
                    Text(song.artistName)
                        .font(.title3)
                        .foregroundStyle(.secondary)
                }

                Grid(alignment: .leading) {
                    row("Género", song.primaryGenreName)
                    Divider()
                    row("Lanzamiento", song.releaseDate)
                    Divider()
                    row("Álbum", song.collectionName)
                    Divider()
                    row("Duración", duration)
                    Divider()
                    row("Precio", "\(song.trackPrice) \(song.currency)")
                }
            }
            .scenePadding()
        }
        .navigationBarTitleDisplayMode(.inline)
    }

    private var duration: String {
        let seconds = song.trackTimeMillis / 1000
        return String(format: "%d:%02d", seconds / 60, seconds % 60)
    }

    private func row(_ label: String, _ value: String) -> some View {
        GridRow {
            Text(label)
                .foregroundStyle(.secondary)
            Text(value)
                .fontWeight(.semibold)
        }
        .font(.subheadline)
        .accessibilityElement(children: .combine)
    }
}

#Preview {
    SongDetailView(
        song: Song(
            id: 1676343411,
            trackName: "BESO",
            artistName: "ROSALÍA & Rauw Alejandro",
            artworkUrl100: "",
            primaryGenreName: "Pop Latino",
            releaseDate: "2023-03-24T12:00:00Z",
            collectionName: "RR - Single",
            trackTimeMillis: 194543,
            trackPrice: 1.29,
            currency: "USD"
        )
    )
}
