//
//  UITableViewExtensionTests.swift
//  SwiftUIKitLib
//
//  Created by Saurabh Verma on 27/02/25.
//

import Foundation
import Testing
import UIKit
@testable import SwiftUIKitLib

@Suite("UITableView Extension Tests")
class UITableViewExtensionTests {
    
    var sut: UITableView!
        
    @MainActor func setup() throws {
        sut = UITableView()
    }
    
    @MainActor @Test func testDequeueReusableCellReturnsCorrectType() throws {
        // Given
        try setup()
        sut.register(MockUITableViewCell.self) // Register the cell type
        let indexPath = IndexPath(row: 0, section: 0)
        
        // When
        let cell = sut.dequeueReusableCell(MockUITableViewCell.self, for: indexPath)
        
        // Then
        #expect(cell != nil, "Nib-based cell should be registered and dequeued successfully")
        #expect(cell.reuseIdentifier == MockUITableViewCell.reuseIdentifier, "Dequeued cell should have the correct reuse identifier")
    }
    
    @MainActor @Test func testRegisterNibBasedCell() throws {
        // Given
        try setup()
        
        // Mock a nib-based cell
        final class MockNibTableViewCell: UITableViewCell, ReusableView {
            override var reuseIdentifier: String { String(describing: self) }
            var nib: UINib? { UINib(nibName: "MockNibTableViewCell", bundle: nil) }
        }
        
        // Mock the nib loading (since we can't rely on an actual nib file in tests)
        let mockNib = UINib(nibName: "MockNibTableViewCell", bundle: nil)
        sut.register(mockNib, forCellReuseIdentifier: MockNibTableViewCell.reuseIdentifier)
        
        // When
        sut.register(MockNibTableViewCell.self)
        
        // Then
        let indexPath = IndexPath(row: 0, section: 0)
        let cell = sut.dequeueReusableCell(MockNibTableViewCell.self, for: indexPath)
        #expect(cell != nil, "Nib-based cell should be registered and dequeued successfully")
    }
    
}

final class MockUITableViewCell : UITableViewCell, ReusableView {}
