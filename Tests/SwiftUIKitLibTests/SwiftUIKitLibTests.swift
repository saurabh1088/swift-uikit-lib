import Testing
import UIKit
@testable import SwiftUIKitLib

@Suite("Single Detail Table View Cell Tests")
class SingleDetailTableViewCellTests {
    
    var sut: SingleDetailTableViewCell!
    
    @MainActor func setup() throws {
        let bundle = Bundle(for:SingleDetailTableViewCell.self)
        let nib = UINib(nibName: "SingleDetailTableViewCell", bundle: bundle)
        //nibName should be the same as your file name
        sut = nib.instantiate(withOwner: nil, options: nil).first as? SingleDetailTableViewCell
        
        
        
//        let bundle = Bundle.module
//        let nib = UINib(nibName: "SingleDetailTableViewCell", bundle: bundle)
//        sut = nib.instantiate(withOwner: nil, options: nil)[0] as? SingleDetailTableViewCell
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
