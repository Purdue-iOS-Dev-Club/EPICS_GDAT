//
//  SpeechViewController.swift
//  EPICS_GDAT
//
//  Created by Harjas Monga on 10/26/17.
//  Copyright © 2017 Siraj Zaneer. All rights reserved.
//

import UIKit
import Speech

class SpeechViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    let audioEnginer = AVAudioEngine()
    let speechRecognizerUS = SFSpeechRecognizer(locale: Locale.init(identifier: "en-US"))
    let speechRecognizerIreland = SFSpeechRecognizer(locale: Locale.init(identifier: "en-IE"))
    @IBOutlet weak var speechRegOutput: UILabel!
    @IBAction func startSpeechReg(_ sender: UIButton) {
        print("starting speech recognition")
        speechRegOutput.text = "started"
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
