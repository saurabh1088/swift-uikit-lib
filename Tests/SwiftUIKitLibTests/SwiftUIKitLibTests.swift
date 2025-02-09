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
    
    @MainActor @Test func testDetailLabelSetText() throws {
        // Given
        let testText = "Test Text"
        try setup()
                
        // When
        sut.setDetailText(testText)
        
        // Then
        #expect(sut.detailLabel.text == testText, "The text set should match the test text")
    }
    
    @MainActor @Test func testDetailLabelSetTextNil() throws {
        // Given
        try setup()
        
        // Then
        #expect(sut.detailTextLabel?.text == nil, "The text set should match the test text")
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
        #expect(sut.detailLabel.text == testText, "The text set should match the test text.")
        #expect(sut.detailLabel.font == testFont, "The font set should match the test font.")
        #expect(sut.detailLabel.textColor == testTextColor, "The text color set should match the test color.")
        #expect(sut.detailLabel.backgroundColor == testBackgroundColor, "The background color set should match the test background color.")
    }
}
