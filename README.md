# Runkeeper Medal Case

A focused SwiftUI implementation of the Runkeeper medal case coding exercise. The app presents achievement medals in grouped grid sections for Personal Records and Virtual Races, using the supplied iOS vector PDF assets.

## Features

- Medal case grid grouped by Personal Records and Virtual Races
- Earned and unearned medal states
- Section completion counts
- Medal detail screen
- Search toggle in the header
- Mock colors represented as searchable source constants

## Architecture

The project is intentionally small and reviewable:

- `Medal` and `MedalSection` model static achievement data and computed counts.
- `AchievementsViewModel` owns search state and filtering.
- SwiftUI views are split by responsibility: screen, navigation bar, section, grid item, details, and search bar.
- Asset names are used as stable medal identifiers, which keeps SwiftUI diffing deterministic.

## Requirements

- Xcode 16 or newer
- iOS 18.1 simulator or device

## Running

1. Open `MedalCaseApp.xcodeproj` in Xcode.
2. Select the `MedalCaseApp` scheme.
3. Build and run on an iPhone simulator or device.

## Testing

The project includes unit coverage for medal counts, search filtering, and search state clearing, plus UI smoke coverage for the Achievements screen and search flow.

Run tests with `Command-U` in Xcode.

## AI Usage

I built and reviewed the implementation with assistance from Codex in Xcode. Codex was used for code cleanup, refactoring support, README updates, and final review passes.

## Tradeoffs

The exercise data is static, so the app does not add persistence or networking. With more time, the next useful steps would be snapshot-style UI coverage, dynamic medal progress, and a small repository layer if achievement data came from an API.
