//
//  ScanViewController.swift
//  OCR-App
//
//  Created by MacOS on 11/4/17.
//  Copyright © 2017 MacOS. All rights reserved.
//

import UIKit
import TesseractOCR

class ScanViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, G8TesseractDelegate {
    @IBOutlet weak var txtViewResult: UITextView!
    @IBOutlet weak var imgViewPicked: UIImageView!
    var imagePicker: UIImagePickerController!

    @IBOutlet weak var btnConvert: UIBarButtonItem!
    @IBOutlet weak var btnImage: UIButton!
    @IBOutlet weak var btnCamera: UIButton!
    @IBOutlet weak var btnSetting: UIButton!
    @IBOutlet weak var btnSave: UIButton!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtViewResult.isEditable = false
        txtViewResult.layer.cornerRadius = 5;
        imgViewPicked.layer.cornerRadius = 5;
        imgViewPicked.layer.borderWidth = 1;
        txtViewResult.layer.borderWidth = 1;
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ScanViewController.dismissKeyboard))
        view.addGestureRecognizer(tapGesture)


        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
    override func viewWillDisappear(_ animated: Bool) {
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func onButtonConvertAction(_ sender: Any) {
        txtViewResult.isEditable = true
        if let tesseract = G8Tesseract(language: "eng") {
            tesseract.delegate = self
            tesseract.image = imgViewPicked.image?.g8_blackAndWhite()
            tesseract.recognize()
            
            txtViewResult.text = tesseract.recognizedText
        }
    }
    
    @IBAction func onBtnImageAction(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            
            imagePicker.sourceType = .photoLibrary;
            imagePicker.allowsEditing = true
            
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    

    @IBAction func onBtnHistoryAction(_ sender: Any) {
        self.performSegue(withIdentifier: "navihistoryController", sender: nil)
    }
    @IBAction func onBtnSaveAction(_ sender: Any) {
    }
    @IBAction func onBtnShareAction(_ sender: Any) {
        let activityVC = UIActivityViewController(activityItems: [txtViewResult.text], applicationActivities: [])
        
        activityVC.popoverPresentationController?.sourceView = self.view
        self.present(activityVC, animated: true, completion: nil)
    }
    
    @IBAction func onBtnCameraAction(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            imagePicker.sourceType = .camera;
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        imgViewPicked.image = image
        dismiss(animated:true, completion: nil)
    }
    
    func progressImageRecognition(for tesseract: G8Tesseract!) {
        print("Recognition Progress \(tesseract.progress) %")
    }
    
    func dismissKeyboard() {
        txtViewResult.resignFirstResponder()
    }


}


