//
//  ExtensionSegue.swift
//  Aphrodite
//
//  Created by AnneBlair on 2017/9/9.
//  Copyright © 2017年 blog.aiyinyu.com. All rights reserved.
//

import Foundation

public protocol SegueHandelr {
    associatedtype SegueIdentifier: RawRepresentable
}

extension SegueHandelr where Self: UIViewController, SegueIdentifier.RawValue == String {
    public func segueIdentifier(for segue: UIStoryboardSegue) -> SegueIdentifier {
        guard let identifier = segue.identifier, let segueIdentifier = SegueIdentifier(rawValue: identifier) else { fatalError("UnKnown segue: \(segue)") }
        return segueIdentifier
    }
    
    public func performSegue(withIdentifier segueIdentifier: SegueIdentifier) {
        performSegue(withIdentifier: segueIdentifier.rawValue, sender: nil)
    }
}
