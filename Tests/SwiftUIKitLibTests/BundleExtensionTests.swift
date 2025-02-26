//
//  BundleExtensionTests.swift
//  SwiftUIKitLib
//
//  Created by Saurabh Verma on 26/02/25.
//

import Foundation
import Testing
@testable import SwiftUIKitLib

@Suite("Bundle Extension Tests")
class BundleExtensionTests {
    
    @MainActor @Test func testPackageBundleSwiftUIKitLibReturnsModuleBundle() throws {
        // Given
        let expectedBundle = Bundle.packageBundleSwiftUIKitLib
        
        // Then
        #expect(expectedBundle != nil, "packageBundleSwiftUIKitLib should return the instance of Bundle.module")
    }
}

