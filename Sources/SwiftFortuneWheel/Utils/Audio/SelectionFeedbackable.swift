//
//  Untitled.swift
//  SwiftFortuneWheel
//
//  Created by werfe on 2/9/25.
//  Copyright © 2025 SwiftFortuneWheel. All rights reserved.
//

import Foundation

#if os(macOS)
import AppKit
#else
import UIKit
#endif

#if os(iOS)
/// The protocol that adds support for the impact feedback
protocol SelectionFeedbackable {
    @available(iOS 10.0, iOSApplicationExtension 10.0, *)
    /// Use impact feedback to indicate that an impact has occurred
    var selectionFeedbackgenerator: UISelectionFeedbackGenerator { get }
    /// Impact feedback on or off
    var selectionFeedbackOn: Bool { get set }
}

extension SelectionFeedbackable {
    /// Prepare impact feedback if needed
    func prepareSelectionFeedbackIfNeeded() {
        if #available(iOS 10.0, iOSApplicationExtension 10.0, *) {
            guard selectionFeedbackOn == true else { return }
            selectionFeedbackgenerator.prepare()
        } else {
            // Fallback on earlier versions
        }
    }
    
    /// Generates impact feedback
    func selectionFeedback() {
        if #available(iOS 10.0, iOSApplicationExtension 10.0, *) {
            if selectionFeedbackOn {
                selectionFeedbackgenerator.selectionChanged()
            }
        } else {
            // Fallback on earlier versions
        }
    }
}
#endif
