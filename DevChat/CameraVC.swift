//
//  ViewController.swift
//  DevChat
//
//  Created by Evgeny Vlasov on 11/22/16.
//  Copyright © 2016 Evgeny Vlasov. All rights reserved.
//

import UIKit
import FirebaseAuth

class CameraVC: AAPLCameraViewController, AAPLCameraVCDelegate {

    
    @IBOutlet weak var previewView: AAPLPreviewView!
    @IBOutlet weak var cameraBtn: UIButton!
    
    @IBOutlet weak var recordBtn: UIButton!
    
    override func viewDidLoad() {
        
        delegate = self
        _previewView = previewView
        
        super.viewDidLoad()

        
    }

    override func viewDidAppear(_ animated: Bool) {

//     performSegue(withIdentifier: "LoginVC", sender: nil)
        
        guard FIRAuth.auth()?.currentUser != nil else {
            performSegue(withIdentifier: "LoginVC", sender: nil)
            
            return
        }
    
    }
    
    @IBAction func recordBtnPressed(_ sender: Any) {
        toggleMovieRecording()
    }

    @IBAction func changeCameraBtnPressed(_ sender: Any) {
        changeCamera()
    }
    
    func shouldEnableCameraUI(_ enable: Bool) {
        cameraBtn.isEnabled = enable
        print("Should enable camera UI: \(enable)")
    }
    
    func shouldEnableRecordUI(_ enable: Bool) {
        recordBtn.isEnabled = enable
        print("Should enable record UI: \(enable)")
    }
    
    func recordingHasStarted() {
        print("Recording has started")
        
    }
    
    func canStartRecording() {
        print("Can start recording")
        
    }
}

