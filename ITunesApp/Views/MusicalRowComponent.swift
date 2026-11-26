import SwiftUI

struct MusicRowComponent: View {

    private let imageName = "MusicalIconGrey"

    let trackName: String
    let artistName: String
    let secondaryText: String

    var body: some View {

        HStack {

            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 64, height: 64)
                .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                .padding(.all, 8)

            VStack(alignment: .leading) {

                Text(trackName)
                    .font(.headline)

                Text(artistName)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)

                Text(secondaryText)
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    List {
        MusicRowComponent(
            trackName: "BESO",
            artistName: "ROSALÍA & Rauw Alejandro",
            secondaryText: "RR - Single"
        )
    }
}
