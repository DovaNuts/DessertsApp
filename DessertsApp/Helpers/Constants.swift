import SwiftUI

public struct CornerRadius {
    private init() {}
}
public struct EGDuration {
    private init() {}
}
public struct EGEasing {
    private init() {}
}
public struct Sizing {
    private init() {}
}
public struct Spacing {
    private init() {}
}

public extension Color {
    static var isDarkMode: Bool {
        @AppStorage("isDarkMode") var isDarkMode = false
        return isDarkMode
    }

    static var background: Color {
        return isDarkMode ? backgroundDark : backgroundLight
    }

    static var button: Color {
        return isDarkMode ? buttonDark : buttonLight
    }

    static var highlight: Color {
        return isDarkMode ? highlightDark : highlightLight
    }

    static var text: Color {
        return isDarkMode ? textDark : textLight
    }

    static var subtext: Color {
        return isDarkMode ? subtextDark : subtextLight
    }

    static var secondary: Color {
        return isDarkMode ? secondaryDark: secondaryLight
    }

    // MARK: - Light
    private static var backgroundLight: Color {
        return Color(hex: "#FFF5E1")
    }

    private static var buttonLight: Color {
        return Color(hex: "#C72257")
    }

    private static var highlightLight: Color {
        return Color(hex: "EB5081")
    }

    private static var textLight: Color {
        return Color(hex: "#4A2A20")
    }

    private static var subtextLight: Color {
        return Color(hex: "#C72257")
    }

    private static var secondaryLight: Color {
        return Color(hex: "#FFB389")
    }

    // MARK: - Dark
    private static var backgroundDark: Color {
        return Color(hex: "#1E1E1E")
    }

    private static var buttonDark: Color {
        return Color(hex: "#FF6A8D")
    }

    private static var highlightDark: Color {
        return Color(hex: "#EB5081")
    }

    private static var textDark: Color {
        return Color(hex: "#EDEDED")
    }

    private static var subtextDark: Color {
        return Color(hex: "#FF8BA0")
    }

    private static var secondaryDark: Color {
        return Color(hex: "#8A5B57")
    }
}

public extension Spacing {
    static var listItemSpacingBetween: CGFloat {
        return 5
    }
}
