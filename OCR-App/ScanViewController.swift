//
//  ScanViewController.swift
//  OCR-App
//
//  Created by MacOS on 11/4/17.
//  Copyright © 2017 MacOS. All rights reserved.
//

import UIKit

class ScanViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
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
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func onBtnImageAction(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            
            imagePicker.sourceType = .photoLibrary;
            imagePicker.allowsEditing = true
            
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    @IBAction func onBtnConvertAction(_ sender: Any) {
    }
    @IBAction func onBtnSaveAction(_ sender: Any) {
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        imgViewPicked.image = image
        dismiss(animated:true, completion: nil)
    }
    


}
