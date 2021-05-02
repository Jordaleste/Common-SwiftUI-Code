//
//  ViewModifiers.swift
//  CommonCode
//
//  Created by Charles Eison on 4/30/21.
//

import SwiftUI

struct ButtonViewModifier: ViewModifier {
    var buttonWidth: CGFloat
    var borderColor: Color
    var topGradient: Color
    var bottomGradient: Color
    var textColor: Color = .black

    func body(content: Content) -> some View {
        content
            .font(.system(size: 20, weight: .semibold))
            .frame(maxWidth: buttonWidth, maxHeight: 40)
            .foregroundColor(textColor)
            .background(LinearGradient(gradient: Gradient(colors: [topGradient, bottomGradient]), startPoint: .top, endPoint: .bottom))
            .cornerRadius(20)
            .overlay(RoundedRectangle(cornerRadius: 20.0)
                        .stroke(borderColor, lineWidth: 5))
    }
}

struct FreeChipsButtonViewModifier: ViewModifier {
    var backgroundColor: Color
    var borderColor: Color
    var textColor: Color

    func body(content: Content) -> some View {
        content
            .padding(40)
            .font(.system(size: 20, weight: .semibold))
            .foregroundColor(textColor)
            .background(backgroundColor)
            .clipShape(Circle())
            .overlay(Circle()
                        .strokeBorder(borderColor, lineWidth: 10))
    }
}

struct PayTableColumnModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .overlay(Rectangle()
                        .frame(width: 1, height: nil, alignment: .trailing)
                        .foregroundColor(Color.yellow), alignment: .trailing)
            .foregroundColor(Color.yellow)
            .font(.system(size: 16, weight: .semibold))
    }
}

extension View {
    
    /// Converts button to rounded rectangle with background gradient and border.
    /// - parameter buttonWidth: Width of button
    /// - parameter borderColor: Color of button border
    /// - parameter topGradientColor: Color of top portion of background gradient
    /// - parameter bottomGradientColor: Color of bottom portion of background gradient
    /// - parameter textColor: Optional parameter, .black is default.
    ///
    /// This adds the following modifiers:
    /// - font size 20, semi-bold
    /// - foreground color black
    /// - background gradient
    /// - rectangle overlay with yellow border with a 8pt radius
    func buttonOptionStyle(buttonWidth: CGFloat, borderColor: Color, topGradientColor: Color, bottomGradientColor: Color, textColor: Color = .black) -> some View {
        self.modifier(ButtonViewModifier(buttonWidth: buttonWidth, borderColor: borderColor, topGradient: topGradientColor, bottomGradient: bottomGradientColor, textColor: textColor))
    }
    
    func freeChipButtonStyle(borderColor: Color, backgroundColor: Color, textColor: Color) -> some View {
        self.modifier(FreeChipsButtonViewModifier(backgroundColor: backgroundColor, borderColor: borderColor, textColor: textColor))
    }
    
    /// Pay table column design modifier:
    ///
    /// This adds the following modifiers to the pay table column:
    /// - Horizontal padding, 5 points
    /// - Rectangle overlay to show vertical divider lines between columns
    /// - Text color yellow
    /// - Font 16, semibold
    func payTableColumnModifier() -> some View {
        self.modifier(PayTableColumnModifier())
    }
}



