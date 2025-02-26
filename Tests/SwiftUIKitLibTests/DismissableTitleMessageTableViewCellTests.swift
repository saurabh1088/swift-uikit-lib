//
//  DismissableTitleMessageTableViewCellTests.swift
//  SwiftUIKitLib
//
//  Created by Saurabh Verma on 26/02/25.
//

import Testing
import UIKit
@testable import SwiftUIKitLib

@Suite("Dismissable Title Message Table View Cell Tests")
class DismissableTitleMessageTableViewCellTests {
    
    var sut: DismissableTitleMessageTableViewCell!
    
    @MainActor func setup() throws {
        let nib = UINib(nibName: "DismissableTitleMessageTableViewCell", bundle: Bundle.module)
        sut = nib.instantiate(withOwner: nil, options: nil)[0] as? DismissableTitleMessageTableViewCell
        if sut == nil {
            throw NSError(domain: "TestSetup", code: 1, userInfo: [NSLocalizedDescriptionKey: "Failed to instantiate DismissableTitleMessageTableViewCell"])
        }
    }
    
    @MainActor @Test func testAwakeFromNib() throws {
        // Given
        try setup()
        
        // Then
        #expect(sut.detailTextLabel == nil, "detailTextLabel should not be instantiated in awakeFromNib")
    }
}

