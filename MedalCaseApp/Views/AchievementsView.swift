import SwiftUI

struct AchievementsView: View {
    @State private var viewModel = AchievementsViewModel()

    var body: some View {
        NavigationStack {
            ZStack(alignment: .topTrailing) {
                Color.medalPrimaryBlue
                    .ignoresSafeArea(edges: .top)

                VStack(spacing: 0) {
                    AppNavigationBar(title: "Achievements") {
                        EmptyNavigationBarItem()
                    } trailing: {
                        Button {
                            viewModel.toggleSearch()
                        } label: {
                            Image(systemName: viewModel.isShowingSearch ? "xmark" : "magnifyingglass")
                                .font(.system(size: 18, weight: .semibold))
                                .foregroundColor(.medalWhiteText)
                                .frame(width: 44, height: 44)
                                .contentShape(Rectangle())
                        }
                        .accessibilityLabel(viewModel.isShowingSearch ? "Hide search" : "Show search")
                    }

                    if viewModel.isShowingSearch {
                        SearchBarView(text: $viewModel.searchText)
                            .transition(.move(edge: .top).combined(with: .opacity))
                    }

                    ScrollView {
                        LazyVStack(spacing: 0, pinnedViews: [.sectionHeaders]) {
                            ForEach(viewModel.filteredSections) { section in
                                SectionView(section: section)
                            }
                        }
                    }
                    .background(Color.medalWhiteText)
                }
                .background(Color.medalWhiteText)
            }
            .animation(.easeInOut(duration: 0.2), value: viewModel.isShowingSearch)
            .toolbar(.hidden, for: .navigationBar)
        }
    }
}

#Preview {
    AchievementsView()
}
