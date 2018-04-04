//
//  ThemeFactory.swift
//  CS193P_Homework
//
//  Created by Phoenix Wu on H30/04/04.
//  Copyright © 平成30年 Phoenix Wu. All rights reserved.
//

import Foundation

class ThemeFactory {
    
    static func getTheme(themeEnum: ConcentrationThemeEnum) -> ConcentrationTheme {
        switch themeEnum {
        case .Halloween:
            return HalloweenTheme()
            
        case .Japanese:
            return JapaneseTheme()
            
        default:
            return HalloweenTheme()
        }
    }
    
}
