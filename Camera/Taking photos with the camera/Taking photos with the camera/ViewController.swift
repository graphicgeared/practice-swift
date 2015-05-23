//
//  ViewController.swift
//  Taking photos with the camera
//
//  Created by Domenico on 23/05/15.
//  License MIT
//

import UIKit
import MobileCoreServices

class ViewController: UIViewController,
       UINavigationControllerDelegate, UIImagePickerControllerDelegate{

    /* We use this variable to determine if the viewDidAppear:
    method of our view controller has been called or not. If not, we
    display the camera view */
    var beenHereBefore = false
    var controller: UIImagePickerController?
    
    //- MARK: Helper methods
    func isCameraAvailable() -> Bool{
        return UIImagePickerController.isSourceTypeAvailable(.Camera)
    }
    
    func cameraSupportsMedia(mediaType: String,
        sourceType: UIImagePickerControllerSourceType) -> Bool{
            
        let availableMediaTypes =
        UIImagePickerController.availableMediaTypesForSourceType(sourceType) as!
                [String]?
            
        if let types = availableMediaTypes{
            for type in types{
                if type == mediaType{
                    return true
                }
            }
        }
            
        return false
    }
    
    func doesCameraSupportTakingPhotos() -> Bool{
        return cameraSupportsMedia(kUTTypeImage as! String, sourceType: .Camera)
    }
}

