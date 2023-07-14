//
//  FileManager.swift
//  DemoApp
//
//  Created by arun-pt6232 on 11/04/23.
//

import UIKit

class FileHandler {
    
    
    func saveImageToFile(imageURL: String, image: UIImage) {
        let fileManager = FileManager.default
        let documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        let fileName = "\(getImageName(from: imageURL)).jpg"

        if let imageData = image.jpegData(compressionQuality: 0.8) {
            let fileURL = documentsDirectory.appendingPathComponent(fileName)

            do {
                try imageData.write(to: fileURL)
                print("Imagelocation :\(fileURL)")
            } catch {
                print("Error saving image \(fileName): \(error.localizedDescription)")
            }
        }
    }
    
    func getImageFromFile(imageURL: String) -> UIImage? {
        
        if let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileName = "\(getImageName(from: imageURL)).jpg"
            let fileURL = documentsDirectory.appendingPathComponent(fileName)
            
            // Check if the file exists at the file URL
            if FileManager.default.fileExists(atPath: fileURL.path) {
                // Load the image from the file URL
                if let image = UIImage(contentsOfFile: fileURL.path) {
                    // Use the loaded image
                    
                    print("Image loaded successfully from: \(fileURL.path)")
                    return image
                } else {
                    
                    print("Error loading image from: \(fileURL.path)")
                }
            } else {
                print("Image file does not exist at: \(fileURL.path)")
            }
        } else {
            print("Documents directory not found.")
        }
        return nil
    }
    
    
    private func getImageName(from imageURL: String) -> String {
        let splitArray = imageURL.split(separator: "/")
        
        if let fileName = splitArray.last {
            return String(fileName)
        }
        else {
            let fileName = splitArray[splitArray.count - 1]
            return String(fileName)
        }
    }
    
    
}
