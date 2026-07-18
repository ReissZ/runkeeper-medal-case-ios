import SwiftUI

struct AppNavigationBar<Leading: View, Trailing: View>: View {
    let title: String
    let leading: Leading
    let trailing: Trailing

    init(
        title: String,
        @ViewBuilder leading: () -> Leading,
        @ViewBuilder trailing: () -> Trailing
    ) {
        self.title = title
        self.leading = leading()
        self.trailing = trailing()
    }

    var body: some View {
        ZStack {
            Text(title)
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(.medalWhiteText)

            HStack {
                leading
                    .frame(width: 44, height: 44)

                Spacer()

                trailing
                    .frame(width: 44, height: 44)
            }
            .padding(.horizontal, 4)
        }
        .frame(height: 44)
        .frame(maxWidth: .infinity)
        .background(Color.medalPrimaryBlue)
        .zIndex(10)
    }
}

struct EmptyNavigationBarItem: View {
    var body: some View {
        Color.clear
            .frame(width: 44, height: 44)
    }
}

#Preview {
    AppNavigationBar(title: "Achievements") {
        EmptyNavigationBarItem()
    } trailing: {
        Image(systemName: "ellipsis")
            .rotationEffect(.degrees(90))
            .foregroundColor(.white)
    }
}
