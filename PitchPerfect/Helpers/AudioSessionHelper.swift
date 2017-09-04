//
//  AudioSessionHelper.swift
//  PitchPerfect
//
//  Created by Leonardo Vinicius Kaminski Ferreira on 04/09/17.
//  Copyright © 2017 Leonardo Ferreira. All rights reserved.
//

import AVFoundation
import UIKit

struct AudioSessionHelper {
    
    static var audioRecorder: AVAudioRecorder!
    
    static private func filePath() -> URL {
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true)[0] as String
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        
        return URL(string: pathArray.joined(separator: "/"))!
    }
    
    static func recordAudio(with delegate: AVAudioRecorderDelegate) {
        
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord, with:AVAudioSessionCategoryOptions.defaultToSpeaker)
        
        try! audioRecorder = AVAudioRecorder(url: filePath(), settings: [:])
        audioRecorder.delegate = delegate
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
    }
    
    static func stopRecordAudio() {
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
    }
    
}
