//
//  RecordViewControllerTests.swift
//  PitchPerfect
//
//  Created by Leonardo Vinicius Kaminski Ferreira on 05/09/17.
//  Copyright © 2017 Leonardo Ferreira. All rights reserved.
//

import XCTest
@testable import PitchPerfect
import AVFoundation

class RecordViewControllerTests: XCTestCase {
    
    var sut: RecordViewController!
    
    override func setUp() {
        super.setUp()
        
        let storyboard = UIStoryboard(name: "Audio", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "RecordViewController") as! RecordViewController
        _ = sut.view
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
    
    func test_UIElements_AreCorrectlyInstantiated_AfterInit() {
        XCTAssertNotNil(sut.recordingLabel)
        XCTAssertNotNil(sut.recordButton)
        XCTAssertNotNil(sut.stopButton)
    }
    
    func test_PlayButtonPressed_ShouldCallConfigureUI() {
        let vc = MockRecordViewController()
        vc.recordButtonPressed(UIButton.init())
        
        XCTAssertTrue(vc.configUICalled)
    }
    
    func test_StopButtonPressed_ShouldCallConfigureUI() {
        let vc = MockRecordViewController()
        vc.recordButtonPressed(UIButton.init())
        
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
