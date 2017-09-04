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
        
        stopButton.isEnabled = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        recordingLabel.text = "Recording in progress"
        recordButton.isEnabled = false
        stopButton.isEnabled = true
        
        AudioSessionHelper.recordAudio(with: self)
    }
    
    @IBAction func stopButtonPressed(_ sender: UIButton) {
        recordingLabel.text = "Tap to record"
        recordButton.isEnabled = true
        stopButton.isEnabled = false
        
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

