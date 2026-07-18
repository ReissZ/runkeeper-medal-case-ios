import SwiftUI

extension Color {
    static let medalPrimaryBlue = Color(hex: "63C6D4")
    static let medalBackgroundGray = Color(hex: "F7F7F7")
    static let medalDarkGrayText = Color(hex: "333333")
    static let medalLightGrayText = Color(hex: "666666")
    static let medalBlackText = Color(hex: "000000")
    static let medalWhiteText = Color(hex: "FFFFFF")

    init(hex: String) {
        let scanner = Scanner(string: hex)
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)

        let red = Double((rgbValue & 0xFF0000) >> 16) / 255
        let green = Double((rgbValue & 0x00FF00) >> 8) / 255
        let blue = Double(rgbValue & 0x0000FF) / 255

        self.init(red: red, green: green, blue: blue)
    }
}

extension UIColor {
    static let medalPrimaryBlue = UIColor(
        red: CGFloat(0x63) / 255,
        green: CGFloat(0xC6) / 255,
        blue: CGFloat(0xD4) / 255,
        alpha: 1
    )
}
