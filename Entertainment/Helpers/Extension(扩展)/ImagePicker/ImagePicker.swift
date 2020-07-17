//
//  ImagePicker.swift
//  Entertainment
//
//  Created by 吕君 on 2020/7/2.
//  Copyright © 2020 That's Mandarin Video Editor . All rights reserved.
//

import Foundation

public extension UIImagePickerController {
    
    static var camera: UIImagePickerController? { return picker(with: .camera) }
    static var photoLibrary: UIImagePickerController? { return picker(with: .photoLibrary) }
    static var savedPhotosAlbum: UIImagePickerController? { return picker(with: .savedPhotosAlbum) }
    
}

// MARK: private
extension UIImagePickerController {
    
    private class func picker(with sourceType: UIImagePickerController.SourceType) -> UIImagePickerController? {
        
        var picker: UIImagePickerController?
        if isSourceTypeAvailable(sourceType) {
            picker = UIImagePickerController()
            picker?.sourceType = sourceType
            picker?.allowsEditing = true
        }
        
        return picker
    }
}
