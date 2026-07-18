import SwiftUI

struct SectionView: View {
    let section: MedalSection

    private let columns = [
        GridItem(.flexible(), spacing: 20),
        GridItem(.flexible(), spacing: 20)
    ]

    var body: some View {
        Section {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(section.medals) { medal in
                    MedalItemView(medal: medal)
                }
            }
            .padding(.horizontal, 24)
            .padding(.vertical, 20)
        } header: {
            HStack {
                Text(section.title)
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.medalDarkGrayText)

                Spacer()

                Text("\(section.earnedCount) of \(section.totalCount)")
                    .font(.system(size: 14, weight: .regular))
                    .foregroundColor(.medalLightGrayText)
            }
            .padding(.horizontal, 24)
            .padding(.vertical, 10)
            .background(Color.medalBackgroundGray)
        }
    }
}

#Preview {
    NavigationStack {
        SectionView(section: .personalRecords)
    }
}
