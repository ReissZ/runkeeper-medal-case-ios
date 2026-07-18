import Testing
@testable import MedalCaseApp

@MainActor
struct MedalCaseAppTests {
    @Test
    func medalSectionsReportEarnedCounts() {
        #expect(MedalSection.personalRecords.earnedCount == 5)
        #expect(MedalSection.personalRecords.totalCount == 6)
        #expect(MedalSection.virtualRaces.earnedCount == 7)
        #expect(MedalSection.virtualRaces.totalCount == 7)
    }

    @Test
    func filteringKeepsMatchingMedalsInTheirSections() {
        let viewModel = AchievementsViewModel()
        viewModel.searchText = "5K"

        let filteredSections = viewModel.filteredSections

        #expect(filteredSections.count == 2)
        #expect(filteredSections[0].medals.map(\.title) == ["Fastest 5K"])
        #expect(filteredSections[1].medals.map(\.title) == ["Virtual 5K Race"])
    }

    @Test
    func hidingSearchClearsQuery() {
        let viewModel = AchievementsViewModel()
        viewModel.toggleSearch()
        viewModel.searchText = "Marathon"

        viewModel.toggleSearch()

        #expect(!viewModel.isShowingSearch)
        #expect(viewModel.searchText.isEmpty)
    }
}
