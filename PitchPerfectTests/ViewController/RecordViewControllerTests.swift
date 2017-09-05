//
//  RecordViewControllerTests.swift
//  PitchPerfect
//
//  Created by Leonardo Vinicius Kaminski Ferreira on 05/09/17.
//  Copyright © 2017 Leonardo Ferreira. All rights reserved.
//

import XCTest
@testable import PitchPerfect

class RecordViewControllerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_ViewDidLoad_ShouldCall_ConfigUI() {
        let vc = MockRecordViewController()
        vc.viewDidLoad()
        
        XCTAssertTrue(vc.configUICalled)
    }
    
}

// MARK: - Mock classes

extension RecordViewControllerTests {
    class MockRecordViewController: RecordViewController {
        
        var configUICalled = false
        
        override func configUI(isRecording: Bool) {
            configUICalled = true
        }
    }
}
