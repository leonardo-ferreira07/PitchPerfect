//
//  RecordViewController.swift
//  PitchPerfect
//
//  Created by Leonardo Vinicius Kaminski Ferreira on 02/09/17.
//  Copyright © 2017 Leonardo Ferreira. All rights reserved.
//

import UIKit
import AVFoundation

class RecordViewController: UIViewController, AVAudioRecorderDelegate {

    @IBOutlet weak var recordingLabel: UILabel!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configUI(isRecording: false)
    }
    
    // MARK: - Segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? PlaySoundsViewController {
            if let audioURL = sender as? URL {
                destination.recordedAudioURL = audioURL
            }
        }
    }

    // MARK: - Actions
    
    @IBAction func recordButtonPressed(_ sender: UIButton) {
        configUI(isRecording: true)
        
        AudioSessionHelper.recordAudio(with: self)
    }
    
    @IBAction func stopButtonPressed(_ sender: UIButton) {
        configUI(isRecording: false)
        
        AudioSessionHelper.stopRecordAudio()
    }

}

// MARK: - Audio recorder delegate

extension RecordViewController {
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if flag {
            performSegue(withIdentifier: "stopRecording", sender: recorder.url)
        } else {
            let alert = UIAlertController(title: "Error when saving your audio file", message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
    
}

// MARK: - UI methods

extension RecordViewController {
    func configUI(isRecording: Bool) {
        recordingLabel.text = isRecording ? "Recording in progress" : "Tap to record"
        recordButton.isEnabled = !isRecording
        stopButton.isEnabled = isRecording
    }
}

