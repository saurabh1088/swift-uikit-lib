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
}
