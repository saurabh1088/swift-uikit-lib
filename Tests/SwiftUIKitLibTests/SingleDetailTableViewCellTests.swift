//
//  File.swift
//  SwiftUIKitLib
//
//  Created by Saurabh Verma on 26/02/25.
//

import Testing
import UIKit
@testable import SwiftUIKitLib

@Suite("Single Detail Table View Cell Tests")
class SingleDetailTableViewCellTests {
    
    var sut: SingleDetailTableViewCell!
    
    @MainActor func setup() throws {
        let nib = UINib(nibName: "SingleDetailTableViewCell", bundle: Bundle.module)
        sut = nib.instantiate(withOwner: nil, options: nil)[0] as? SingleDetailTableViewCell
        if sut == nil {
            throw NSError(domain: "TestSetup", code: 1, userInfo: [NSLocalizedDescriptionKey: "Failed to instantiate SingleDetailTableViewCell"])
        }
    }
    
    @MainActor @Test func testAwakeFromNib() throws {
        // Given
        try setup()
        
        // Then
        #expect(sut.detailTextLabel == nil, "detailTextLabel should not be instantiated in awakeFromNib")
    }

    @MainActor @Test func testSetSelected() throws {
        // Given
        try setup()
        
        // When
        // We can't directly test the visual changes here, but we can test if the method is called without crashing.
        sut.setSelected(true, animated: true)
        
        // Then
        #expect(sut.isSelected == true, "Cell should be selected after setSelected(true)")
    }
    
    @MainActor @Test func testDetailLabelSetText() throws {
        // Given
        let testText = "Test Text"
        try setup()
                
        // When
        sut.setDetailText(testText)
        
        // Then
        #expect(sut.detailLabel.text == testText, "Expected detailLabel.text to be '\(testText)', but got '\(String(describing: sut.detailLabel.text))'")
    }
    
    @MainActor @Test func testDetailLabelSetTextNil() throws {
        // Given
        try setup()
        
        // Then
        #expect(sut.detailTextLabel?.text == nil, "Expected detailTextLabel?.text to be nil, but got '\(String(describing: sut.detailTextLabel?.text))'")
    }
    
    @MainActor @Test func testConfigureTableViewCell() throws {
        // Given
        try setup()
        let testText = "Test Text"
        let testFont = UIFont.systemFont(ofSize: 15)
        let testTextColor = UIColor.red
        let testBackgroundColor = UIColor.blue

        // When
        sut.configureDetailLabel(text: testText,
                                 font: testFont,
                                 textColor: testTextColor,
                                 backgroundColor: testBackgroundColor)

        // Then
        #expect(sut.detailLabel.text == testText,
            "Expected detailLabel.text to be '\(testText)', but got '\(String(describing: sut.detailLabel.text))'")
        #expect(sut.detailLabel.font == testFont,
            "Expected detailLabel.font to be '\(testFont)', but got '\(String(describing: sut.detailLabel.font))'")
        #expect(sut.detailLabel.textColor == testTextColor,
            "Expected detailLabel.textColor to be \(testTextColor), but got \(String(describing: sut.detailLabel.textColor))")
        #expect(sut.backgroundColor == testBackgroundColor,
            "Expected detailLabel.backgroundColor to be \(testBackgroundColor), but got \(String(describing: sut.backgroundColor))")
    }
}
