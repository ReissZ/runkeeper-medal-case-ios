import XCTest

final class MedalCaseAppUITests: XCTestCase {
    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    @MainActor
    func testAchievementsScreenLoads() throws {
        let app = XCUIApplication()
        app.launch()

        XCTAssertTrue(app.staticTexts["Achievements"].waitForExistence(timeout: 2))
        XCTAssertTrue(app.staticTexts["Personal Records"].exists)
        XCTAssertTrue(app.staticTexts["Virtual Races"].exists)
        XCTAssertTrue(app.staticTexts["Fastest 5K"].exists)
    }

    @MainActor
    func testSearchFiltersMedals() throws {
        let app = XCUIApplication()
        app.launch()

        app.buttons["Show search"].tap()

        let searchField = app.textFields["Search medals"]
        XCTAssertTrue(searchField.waitForExistence(timeout: 2))
        searchField.tap()
        searchField.typeText("Marathon")

        XCTAssertTrue(app.staticTexts["Marathon"].exists)
        XCTAssertTrue(app.staticTexts["Virtual Marathon"].exists)
        XCTAssertFalse(app.staticTexts["Fastest 5K"].exists)
    }
}
