//
//  HelpViewController.swift
//  EPICS_GDAT
//
//  Created by Sruthi Pillai on 12/1/17.
//  Copyright © 2017 Siraj Zaneer. All rights reserved.
//

import UIKit


class HelpViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var placeholderLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    //let textField = UITextView();
    
    @IBOutlet weak var sendButton: UIButton!
    
    @IBAction func backButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
            dismiss(animated: true, completion: nil)
        
    }
    
    func textViewDidChange(_ textView: UITextView) {
        UIView.animate(withDuration: 0.3) {
            self.placeholderLabel.alpha = textView.text.isEmpty ? 1 : 0
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.layer.cornerRadius=27.0
        textView.clipsToBounds = true
        sendButton.layer.cornerRadius=9.0
        sendButton.clipsToBounds = true
        textView.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
