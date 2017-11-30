//
//  SpeechViewController.swift
//  EPICS_GDAT
//
//  Created by Harjas Monga on 10/26/17.
//  Copyright © 2017 Siraj Zaneer. All rights reserved.
//

import UIKit
import Speech

class SpeechViewController: UIViewController, SFSpeechRecognizerDelegate {
    
    let audioEngine = AVAudioEngine()
    let speechRecognizer = SFSpeechRecognizer()
    let request = SFSpeechAudioBufferRecognitionRequest()
    var recognitionTask: SFSpeechRecognitionTask?
    var isActive = false
    @IBOutlet weak var speechRegOutput: UILabel!
    @IBOutlet weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func startSpeechReg(_ sender: UIButton) {
       controlSpeech()
    }
    
    func controlSpeech(){
        if !isActive {
            isActive = true
            startButton.setTitle("Stop", for: .normal)
            
            print("Starting speech recognition")
            speechRegOutput.text = "started"
            let node = audioEngine.inputNode
            let recordingFormat = node.outputFormat(forBus: 0)
            node.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { buffer, _ in
                self.request.append(buffer)
            }
            audioEngine.prepare()
            do {
                try audioEngine.start()
            } catch {
                return print(error)
            }
            guard let myRecognizer = SFSpeechRecognizer() else {
                print("can't get speech recognizer object")
                return
            }
            if !myRecognizer.isAvailable {
                print("speech recognizer is unavaliable")
                return
            }
            recognitionTask = speechRecognizer?.recognitionTask(with: request, resultHandler: { result, error in
                if let result = result {
                    self.speechRegOutput.text = result.bestTranscription.formattedString
                } else if let error = error {
                    print(error)
                }
            })
        }else{
            isActive = false
            print("Stopping speech recoginition")
            recognitionTask?.finish()
            audioEngine.inputNode.removeTap(onBus: 0)
            audioEngine.stop()
            startButton.setTitle("Start", for: .normal)
        }
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
