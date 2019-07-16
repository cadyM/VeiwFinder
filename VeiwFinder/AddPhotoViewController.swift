//
//  AddPhotoViewController.swift
//  VeiwFinder
//
//  Created by Apple on 7/15/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class AddPhotoViewController: UIViewController ,UIImagePickerControllerDelegate , UINavigationControllerDelegate {
    
    @IBOutlet weak var newImage: UIImageView!
    
    
    var imagePicker = UIImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
    }
    @IBOutlet weak var captionText: UITextField!
    
    @IBAction func takePictureTapped(_ sender: Any) {
        
        imagePicker.sourceType = .camera
    }
    @IBOutlet weak var newImageView: UIImageView!
    
    @IBAction func pictureFromLibraryTapped(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated:true , completion : nil)
    }
    
        
        
    
    
    @IBAction func submitTapped(_ sender: Any) {
        if let context = (UIApplication.shared.delegate as?
            AppDelegate)?.persistentContainer.viewContext {
            
            let photoToSave = Photos(entity: Photos.entity(), insertInto: context)
            
            photoToSave.caption = captionText.text
            if let userImage = newImageView.image {
                if let userImageData = userImage.pngData() {
                    photoToSave.photo = userImageData
                }
                (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
                navigationController?.popViewController(animated: true)        }
            
        }
    }
    
    
    
    
    
    
    
    
    internal func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage =
            info [UIImagePickerController.InfoKey.originalImage]
                as? UIImage {newImage.image = selectedImage}
        
        imagePicker.dismiss(animated:true , completion: nil)
        
        
        }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */




}

