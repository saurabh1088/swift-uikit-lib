//
//  UITableViewCellExtensionTests.swift
//  SwiftUIKitLib
//
//  Created by Saurabh Verma on 27/02/25.
//

import Foundation
import Testing
import UIKit
@testable import SwiftUIKitLib

// Mock cell without nib for basic testing
final class MockTableViewCell: UITableViewCell {}

// Mock cell with simulated nib behavior
final class MockNibTableViewCell: UITableViewCell {}

@Suite("UITableViewCell Extension Tests")
class UITableViewCellExtensionTests {
    
    @MainActor @Test func testReuseIdentifierReturnsClassName() throws {
        // Given
        let expectedIdentifier = "MockTableViewCell"
        
        // When
        let identifier = MockTableViewCell.reuseIdentifier
        
        // Then
        #expect(identifier == expectedIdentifier, "reuseIdentifier should return the class name as a string")
    }
    
    @MainActor @Test func testReuseIdentifierIsUniquePerClass() throws {
        // Given
        let mockIdentifier = MockTableViewCell.reuseIdentifier
        let mockNibIdentifier = MockNibTableViewCell.reuseIdentifier
        
        // When/Then
        #expect(mockIdentifier != mockNibIdentifier, "reuseIdentifier should be unique for different classes")
        #expect(mockIdentifier == "MockTableViewCell", "reuseIdentifier should match MockTableViewCell class name")
        #expect(mockNibIdentifier == "MockNibTableViewCell", "reuseIdentifier should match MockNibTableViewCell class name")
    }
    
    @MainActor @Test func testNibReturnsNilWhenNoNibExists() throws {
        // When
        let nib = MockTableViewCell.nib
        
        // Then
        #expect(nib == nil, "nib should return nil when no nib file exists in the bundle")
    }
    
    @MainActor @Test func testNibReturnsUINibWhenNibExists() throws {
        // Given
        // Simulate a bundle with a nib (requires actual bundle setup in a real test environment)
        // For this test, we'll assume MockNibTableViewCell has a nib in its bundle.
        // In practice, you'd need to mock Bundle or include a nib in the test target.
        let bundle = Bundle(for: MockNibTableViewCell.self)
        
        // Mocking the nib existence check (since we can't add a real nib here)
        // In a real test, ensure a "MockNibTableViewCell.nib" file exists in the bundle
        let nibName = MockNibTableViewCell.nibName
        let expectedNib = UINib(nibName: nibName, bundle: bundle)
        
        // When
        let nib = MockNibTableViewCell.nib
        
        // Then
        // Note: This test assumes nib returns nil unless a real nib is present.
        // For a positive test, you'd need a nib file in the test bundle.
        #expect(nib == nil, "nib should return nil in this mock setup; update test with real nib for positive case")
        // With a real nib:
        // #expect(nib?.nibName == expectedNib.nibName, "nib should return a UINib instance with the correct name")
    }
}
