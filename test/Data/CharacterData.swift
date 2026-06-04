//
//  CharacterData.swift
//  test
//
//  Created by Benedict Kenjiro Lehot on 04/06/26.
//

enum CharacterData: String, CaseIterable {
    case female = "female"
    case male = "male"
    
    var imageName: String {
        switch self {
        case .female: return "char " + rawValue
        case .male: return "char " + rawValue
        }
    }
    
    var colorName: String {
        switch self {
        case .female: return "accentPink"
        case .male: return "accentBlue"
        }
    }
}
