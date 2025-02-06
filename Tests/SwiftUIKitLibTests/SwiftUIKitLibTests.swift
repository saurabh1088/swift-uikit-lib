import Testing
import UIKit
@testable import SwiftUIKitLib

@Suite("Single Detail Table View Cell Tests")
class SingleDetailTableViewCellTests {
    
    var tableView: UITableView!
    var cell: SingleDetailTableViewCell!
    
    func setup() async throws {
        tableView = await UITableView()
        // TODO: Fix issue Terminating app due to uncaught exception 'NSInternalInconsistencyException', reason: 'Could not load NIB in bundle: 'NSBundle
        await tableView.register(UINib(nibName: "SingleDetailTableViewCell", bundle: nil), forCellReuseIdentifier: "SingleDetailTableViewCell")
        cell = await tableView.dequeueReusableCell(withIdentifier: "SingleDetailTableViewCell") as? SingleDetailTableViewCell
    }
    
    
    @Test func testDetailLabelSetText() async throws {
        // Given
        let testText = "Test Text"
        try await setup()
                
        // When
        await cell.setDetailText(testText)
        
        // Then
        await #expect(cell.detailLabel.text == testText, "The text set should match the test text")
    }
}
