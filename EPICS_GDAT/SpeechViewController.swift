//
//  SpeechViewController.swift
//  EPICS_GDAT
//
//  Created by Harjas Monga on 10/26/17.
//  Copyright © 2017 Siraj Zaneer. All rights reserved.
//

import UIKit
import Speech

class SpeechViewController: UIViewController, SFSpeechRecognizerDelegate, SpeechViewControllerDelegate {
    
    let speechSynthesizer = AVSpeechSynthesizer()
    let audioEngine = AVAudioEngine()
    let speechRecognizer = SFSpeechRecognizer()
    let request = SFSpeechAudioBufferRecognitionRequest()
    var recognitionTask: SFSpeechRecognitionTask?
    var isActive = false
    var currSpeech = ""
    var routes: [Int] = []
    var isPrompt = false
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var microphoneView: UIImageView!
    
    
    override func viewDidLoad() {
        if !UserDefaults.standard.bool(forKey: "launchedBefore") {
            if let arriveMenuController = storyboard?.instantiateViewController(withIdentifier: ArriveMenuController.className) as? ArriveMenuController {
                self.present(arriveMenuController, animated: true, completion: {
                    UserDefaults.standard.set(true, forKey: "launchedBefore")
                    UserDefaults.standard.synchronize()
                })
            }
        }

        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        speechSynthesizer.delegate = self
        
        microphoneView.layer.cornerRadius = 30
    }
    
    @IBAction func startSpeechReg(_ sender: UITapGestureRecognizer) {
        if !isActive {
            let speechUtterance = AVSpeechUtterance(string: "What would you like to do? You can say things like, add bus route 12, or remove bus route 12")
            isPrompt = true
            speechSynthesizer.speak(speechUtterance)
        } else {
            controlSpeech()
        }
    }
    
    func reload(routes: [Int]) {
        self.routes = routes
        collectionView.reloadData()
    }
    
    
    func controlSpeech(){
        if !isActive {
            isActive = true
            microphoneView.backgroundColor = .red
            print("Starting speech recognition")
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
                    self.currSpeech = result.bestTranscription.formattedString
                } else if let error = error {
                    print(error)
                }
            })
        } else {
            
            microphoneView.backgroundColor = .blue
            isActive = false
            print("Stopping speech recoginition")
            recognitionTask?.finish()
            audioEngine.inputNode.removeTap(onBus: 0)
            audioEngine.stop()
            process()
        }
    }
    
    func process() {
        print(currSpeech)
        let speechParts = currSpeech.lowercased().split(separator: " ")
        
        switch speechParts[0] {
        case "add":
            var foundNum = false
            for part in speechParts {
                if let num = Int(part) {
                    foundNum = true
                    if !routes.contains(num) {
                        routes.append(num)
                        let speechUtterance = AVSpeechUtterance(string: "Bus route \(num) added to saved routes.")
                        
                        speechSynthesizer.speak(speechUtterance)
                        
                    } else {
                        let speechUtterance = AVSpeechUtterance(string: "Bus route \(num) is already added.")
                        
                        speechSynthesizer.speak(speechUtterance)
                    }
                    collectionView.reloadData()
                }
            }
            
            if !foundNum {
                understadingFail()
            }
        case "remove":
            var foundNum = false
            for part in speechParts {
                if let num = Int(part) {
                    foundNum = true
                    if !routes.contains(num) {
                        
                        let speechUtterance = AVSpeechUtterance(string: "Bus route \(num) was not in your saved routes.")
                        
                        speechSynthesizer.speak(speechUtterance)
                    } else {
                        
                        routes.remove(at: routes.index(of: num)!)
                        let speechUtterance = AVSpeechUtterance(string: "Bus route \(num) removed")
                        
                        speechSynthesizer.speak(speechUtterance)
                    }
                    collectionView.reloadData()
                }
            }
            
            if !foundNum {
                understadingFail()
            }
        case "select":
            var foundNum = false
            for part in speechParts {
                if let num = Int(part) {
                    foundNum = true
                    let speechUtterance = AVSpeechUtterance(string: "Bus route \(num) selected.")
                    
                    speechSynthesizer.speak(speechUtterance)
                    
                }
            }
            
            if !foundNum {
                understadingFail()
            }
        default:
            understadingFail()
        }
    }
    
    func understadingFail() {
        let speechUtterance = AVSpeechUtterance(string: "I didn't understand what you said, could you say that again?")
        isPrompt = true
        speechSynthesizer.speak(speechUtterance)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let id = segue.identifier else {
            return
        }
        
        switch id {
        case "editSegue":
            let destination = segue.destination as! EditViewController
            destination.routes = routes
            destination.delegate = self
        default:
            return
        }
    }
}

extension SpeechViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return routes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "routeCell", for: indexPath) as! RouteCell
        cell.routeLabel.text = String(routes[indexPath.row])
        return cell
    }
}

extension SpeechViewController: AVSpeechSynthesizerDelegate {
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
        if isPrompt {
            controlSpeech()
            isPrompt = false
        }
    }
}

protocol SpeechViewControllerDelegate {
    func reload(routes: [Int])
}
