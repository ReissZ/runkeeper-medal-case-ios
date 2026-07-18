import SwiftUI

struct SearchBarView: View {
    @Binding var text: String

    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: "magnifyingglass")
                .foregroundColor(Color.medalLightGrayText)
                .accessibilityHidden(true)

            TextField("Search medals", text: $text)
                .disableAutocorrection(true)
                .textInputAutocapitalization(.never)

            if !text.isEmpty {
                Button {
                    text = ""
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(Color.medalLightGrayText)
                }
                .accessibilityLabel("Clear search")
            }
        }
        .font(.system(size: 16))
        .padding(.horizontal, 14)
        .padding(.vertical, 10)
        .background(Color.medalBackgroundGray)
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .padding(.horizontal, 16)
        .padding(.vertical, 10)
        .background(Color.medalWhiteText)
    }
}

#Preview {
    SearchBarView(text: .constant("5K"))
}
