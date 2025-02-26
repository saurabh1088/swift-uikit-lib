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
    
    @MainActor @Test func testSetSelected() throws {
        // Given
        try setup()
        
        // When
        // We can't directly test the visual changes here, but we can test if the method is called without crashing.
        sut.setSelected(true, animated: true)
        
        // Then
        #expect(sut.isSelected == true, "Cell should be selected after setSelected(true)")
    }
    
    @MainActor @Test func testDefaultReuseIdentifier() throws {
        // Given
        try setup()
        var expectedIdentifier = String(describing: DismissableTitleMessageTableViewCell.self)
        expectedIdentifier = "SwiftUIKitLib.\(expectedIdentifier)"
        
        // When
        let identifier = DismissableTitleMessageTableViewCell.defaultReuseIdentifier
        
        // Then
        #expect(identifier == expectedIdentifier, "Reuse identifier should match the class name")
    }
    
    @MainActor @Test func testConfigureSetsTitle() throws {
        // Given
        try setup()
        let title = "Test Title"
        
        // When
        sut.configure(with: title, message: "", icon: nil)
        
        // Then
        #expect(sut.titleLabel.text == title, "Title label should be set to the provided title")
    }
    
    @MainActor @Test func testConfigureSetsMessage() throws {
        // Given
        try setup()
        let message = "Test Message"
        
        // When
        sut.configure(with: "", message: message, icon: nil)
        
        // Then
        #expect(sut.messageLabel.text == message, "Message label should be set to the provided message")
    }
    
    @MainActor @Test func testConfigureSetsIcon() throws {
        // Given
        try setup()
        let icon = UIImage(systemName: "star")
        
        // When
        sut.configure(with: "", message: "", icon: icon)
        
        // Then
        #expect(sut.leadingIconImageView.image == icon, "Icon image view should be set to the provided image")
    }
    
    @MainActor @Test func testConfigureSetsDismissAction() throws {
        // Given
        try setup()
        var dismissCalled = false
        let dismissAction: () -> Void = { dismissCalled = true }
        
        // When
        sut.configure(with: "", message: "", icon: nil, dismissAction: dismissAction)
        sut.dismissButtonTapped(UIButton())
        
        // Then
        #expect(dismissCalled == true, "Dismiss action should be executed when dismiss button is tapped")
    }
        
    @MainActor @Test func testConfigureSetsActionButtonAction() throws {
        // Given
        try setup()
        var actionCalled = false
        let actionButtonAction: () -> Void = { actionCalled = true }
        
        // When
        sut.configure(with: "", message: "", icon: nil, actionButtonAction: actionButtonAction)
        sut.actionButtonTapped(UIButton())
        
        // Then
        #expect(actionCalled == true, "Action button action should be executed when action button is tapped")
    }
        
    @MainActor @Test func testDismissButtonControlReturnsDismissButton() throws {
        // Given
        try setup()
        let dismissButton = sut.dismissButton
        
        // When
        let control = sut.dismissButtonControl
        
        // Then
        #expect(control === dismissButton, "dismissButtonControl should return the same instance as dismissButton")
    }
        
    @MainActor @Test func testActionButtonControlReturnsActionButton() throws {
        // Given
        try setup()
        let actionButton = sut.actionButton
        
        // When
        let control = sut.actionButtonControl
        
        // Then
        #expect(control === actionButton, "actionButtonControl should return the same instance as actionButton")
    }
        
    @MainActor @Test func testDismissButtonTappedDoesNothingWhenNoActionSet() throws {
        // Given
        try setup()
        sut.dismissAction = nil
        
        // When
        sut.dismissButtonTapped(UIButton()) // Should not crash
        
        // Then
        #expect(sut.dismissAction == nil, "No action should be triggered when dismissAction is nil")
    }
        
    @MainActor @Test func testActionButtonTappedDoesNothingWhenNoActionSet() throws {
        // Given
        try setup()
        sut.actionButtonAction = nil
        
        // When
        sut.actionButtonTapped(UIButton()) // Should not crash
        
        // Then
        #expect(sut.actionButtonAction == nil, "No action should be triggered when actionButtonAction is nil")
    }
}

