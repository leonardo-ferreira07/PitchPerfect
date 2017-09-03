//
//  RecordViewController.swift
//  PitchPerfect
//
//  Created by Leonardo Vinicius Kaminski Ferreira on 02/09/17.
//  Copyright © 2017 Leonardo Ferreira. All rights reserved.
//

import UIKit

class RecordViewController: UIViewController {

    @IBOutlet weak var recordingLabel: UILabel!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Actions
    
    @IBAction func recordButtonPressed(_ sender: UIButton) {
        recordingLabel.text = "Recording in progress"
    }
    
    @IBAction func stopButtonPressed(_ sender: UIButton) {
        recordingLabel.text = "Tap to record"
    }
    
    

}

