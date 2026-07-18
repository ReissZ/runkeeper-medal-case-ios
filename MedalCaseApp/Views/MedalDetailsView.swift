import SwiftUI

struct MedalDetailsView: View {
    let medal: Medal
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ZStack(alignment: .top) {
            Color.medalPrimaryBlue
                .ignoresSafeArea(edges: .top)

            VStack(spacing: 0) {
                AppNavigationBar(title: "Medal Details") {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(.medalWhiteText)
                    }
                    .accessibilityLabel("Back")
                } trailing: {
                    EmptyNavigationBarItem()
                }

                VStack(spacing: 20) {
                    Image(medal.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 160, height: 160)
                        .opacity(medal.isEarned ? 1 : 0.35)
                        .padding(.top, 32)
                        .accessibilityHidden(true)

                    VStack(spacing: 8) {
                        Text(medal.title)
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(.medalBlackText)
                            .multilineTextAlignment(.center)

                        Text(medal.result)
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(medal.isEarned ? .medalPrimaryBlue : .medalLightGrayText)

                        Text(medal.isEarned ? "Earned achievement" : "Achievement not earned yet")
                            .font(.system(size: 14, weight: .regular))
                            .foregroundColor(.medalDarkGrayText)
                    }
                    .padding(.horizontal, 24)

                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .background(Color.medalWhiteText)
            }
        }
        .toolbar(.hidden, for: .navigationBar)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    NavigationStack {
        MedalDetailsView(medal: MedalSection.personalRecords.medals[0])
    }
}
