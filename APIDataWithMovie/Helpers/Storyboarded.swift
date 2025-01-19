//
//  Storyboarded.swift
//  APIDataWithMovie
//
//  Created by Aung Kyaw Phyo on 20/01/2025.
//

import Foundation
import UIKit

enum Storyboard: String {
    case base = "Base"
    
    var name: String {
        self.rawValue
    }
}

protocol Storyboarded {
    static func instantiate(storyboard: Storyboard) -> Self
}

extension Storyboarded where Self: UIViewController {
    
    static func instantiate(storyboard: Storyboard) -> Self {
        let storyboard = UIStoryboard(name: storyboard.name, bundle: Bundle.main)
        return storyboard.instantiateViewController(ofType: Self.self)
    }
    
}

extension UIStoryboard {
    
    func instantiateViewController<T: UIViewController>(ofType _: T.Type, withIdentifier identifier: String? = nil) -> T {
        let identifier = identifier ?? String(describing: T.self)
        return instantiateViewController(withIdentifier: identifier) as! T
    }
    
}

