//
//  PlaySoundsViewControllerTests.swift
//  PitchPerfect
//
//  Created by Leonardo Vinicius Kaminski Ferreira on 05/09/17.
//  Copyright © 2017 Leonardo Ferreira. All rights reserved.
//

import XCTest
@testable import PitchPerfect

class PlaySoundsViewControllerTests: XCTestCase {
    
    var sut: PlaySoundsViewController!
    
    override func setUp() {
        super.setUp()
        
        let storyboard = UIStoryboard(name: "Audio", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "PlaySoundsViewController") as! PlaySoundsViewController
        sut.recordedAudioURL = URL(string: "mockURL")!
        _ = sut.view
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_ViewDidLoad_ShouldCall_SetupAudio() {
        let vc = MockPlaySoundsViewController()
        vc.viewDidLoad()
        
        XCTAssertTrue(vc.setupAudioCalled)
    }
    
    func test_UIElements_AreCorrectlyInstantiated_AfterInit() {
        XCTAssertNotNil(sut.chipmunkButton)
        XCTAssertNotNil(sut.echoButton)
        XCTAssertNotNil(sut.stopButton)
        XCTAssertNotNil(sut.vaderButton)
        XCTAssertNotNil(sut.reverbButton)
        XCTAssertNotNil(sut.snailButton)
        XCTAssertNotNil(sut.rabbitButton)
    }
    
}

// MARK: - Mock classes

extension PlaySoundsViewControllerTests {
    class MockPlaySoundsViewController: PlaySoundsViewController {
        
        var setupAudioCalled = false
        
        override func setupAudio() {
            setupAudioCalled = true
        }
        
    }
}
