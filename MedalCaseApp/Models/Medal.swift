import Foundation

struct Medal: Identifiable, Equatable {
    let id: String
    let imageName: String
    let title: String
    let result: String
    let isEarned: Bool

    init(imageName: String, title: String, result: String, isEarned: Bool = true) {
        self.id = imageName
        self.imageName = imageName
        self.title = title
        self.result = result
        self.isEarned = isEarned
    }
}

struct MedalSection: Identifiable, Equatable {
    let id: String
    let title: String
    let medals: [Medal]

    var earnedCount: Int {
        medals.filter(\.isEarned).count
    }

    var totalCount: Int {
        medals.count
    }

    init(title: String, medals: [Medal]) {
        self.id = title
        self.title = title
        self.medals = medals
    }
}

extension MedalSection {
    static let personalRecords = MedalSection(
        title: "Personal Records",
        medals: [
            Medal(imageName: "fastest_5k", title: "Fastest 5K", result: "22:14"),
            Medal(imageName: "fastest_10k", title: "Fastest 10K", result: "47:58"),
            Medal(imageName: "longest_run", title: "Longest Run", result: "13.1 mi"),
            Medal(imageName: "highest_elevation", title: "Highest Elevation", result: "2,095 ft"),
            Medal(imageName: "fastest_half_marathon", title: "Half Marathon", result: "1:49:32"),
            Medal(imageName: "fastest_marathon", title: "Marathon", result: "Not Yet", isEarned: false)
        ]
    )

    static let virtualRaces = MedalSection(
        title: "Virtual Races",
        medals: [
            Medal(imageName: "virtual_10k_race", title: "Virtual 10K Race", result: "58:41"),
            Medal(imageName: "virtual_5k_race", title: "Virtual 5K Race", result: "23:07"),
            Medal(imageName: "tokyo_hakone_ekiden_2020", title: "Tokyo-Hakone Ekiden", result: "1:04:18"),
            Medal(imageName: "hakone_ekiden", title: "Hakone Ekiden", result: "1:02:44"),
            Medal(imageName: "mizuno_singapore_ekiden", title: "Mizuno Singapore Ekiden 2015", result: "52:36"),
            Medal(imageName: "virtual_half_marathon_race", title: "Virtual Half Marathon", result: "1:56:09"),
            Medal(imageName: "virtual_marathon_race", title: "Virtual Marathon", result: "4:18:27")
        ]
    )

    static let all: [MedalSection] = [.personalRecords, .virtualRaces]
}
