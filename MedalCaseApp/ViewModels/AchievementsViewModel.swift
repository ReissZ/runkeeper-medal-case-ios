import Observation
import SwiftUI

@MainActor
@Observable
final class AchievementsViewModel {
    private(set) var sections: [MedalSection]
    var searchText = ""
    var isShowingSearch = false

    init(sections: [MedalSection] = MedalSection.all) {
        self.sections = sections
    }

    var filteredSections: [MedalSection] {
        let query = searchText.trimmingCharacters(in: .whitespacesAndNewlines)

        guard !query.isEmpty else {
            return sections
        }

        return sections.compactMap { section in
            let medals = section.medals.filter { medal in
                medal.title.localizedCaseInsensitiveContains(query)
            }

            guard !medals.isEmpty else {
                return nil
            }

            return MedalSection(title: section.title, medals: medals)
        }
    }

    func toggleSearch() {
        isShowingSearch.toggle()

        if !isShowingSearch {
            searchText = ""
        }
    }
}
