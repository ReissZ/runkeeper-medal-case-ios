import SwiftUI

struct MedalItemView: View {
    let medal: Medal

    var body: some View {
        NavigationLink {
            MedalDetailsView(medal: medal)
        } label: {
            VStack(spacing: 8) {
                Image(medal.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 88, height: 88)
                    .opacity(medal.isEarned ? 1 : 0.35)
                    .accessibilityHidden(true)

                Text(medal.title)
                    .font(.system(size: 12, weight: .semibold))
                    .foregroundColor(medal.isEarned ? .medalBlackText : .medalLightGrayText)
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                    .frame(minHeight: 30)

                Text(medal.result)
                    .font(.system(size: 12, weight: .regular))
                    .foregroundColor(medal.isEarned ? .medalBlackText : .medalLightGrayText)
            }
            .frame(maxWidth: .infinity)
            .contentShape(Rectangle())
            .accessibilityElement(children: .combine)
            .accessibilityLabel("\(medal.title), \(medal.result)")
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    NavigationStack {
        HStack {
            MedalItemView(medal: MedalSection.personalRecords.medals[0])
            MedalItemView(medal: MedalSection.personalRecords.medals[5])
        }
        .padding()
    }
}
