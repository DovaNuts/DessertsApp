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
    static var background: Color {
        return Color(hex: "#FFF5E1")
    }
    
    static var button: Color {
        return Color(hex: "#C72257")
    }
    
    static var highlight: Color {
        return Color(hex: "#C72257")
    }
    
    static var text: Color {
        return Color(hex: "#4A2A20")
    }
    
    static var subtext: Color {
        return Color(hex: "#EB5081")
    }
    
    static var secondary: Color {
        return Color(hex: "#FFB389")
    }
    
    static var backgroundDark: Color {
        return Color(hex: "#1E1E1E")
    }
    
    static var buttonDark: Color {
        return Color(hex: "#FF6A8D")
    }
    
    static var highlightDark: Color {
        return Color(hex: "#FF8BA0")
    }
    
    static var textDark: Color {
        return Color(hex: "#EDEDED")
    }
    
    static var subtextDark: Color {
        return Color(hex: "#EB5081")
    }
    
    static var secondaryDark: Color {
        return Color(hex: "#8A5B57")
    }
}

public extension Spacing {
    static var listItemSpacingBetween: CGFloat {
        return 5
    }
}
