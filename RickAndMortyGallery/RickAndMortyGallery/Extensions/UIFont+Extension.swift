//
//  UIFont+Extension.swift
//  RickAndMortyGallery
//
//  Created by Felipe Carrasco on 18-12-22.
//

import UIKit

enum TypeFont: String {
    case arialBold = "Arial Rounded MT Bold"
}

extension UIFont {
    static func configFont(name fontType: TypeFont, size fontSize: CGFloat) -> UIFont {
        return UIFont(name: fontType.rawValue, size: fontSize) ?? UIFont()
    }
}
