//
//  DownloadFile.swift
//  RestApi
//
//  Created by Vidzemes Augstkola on 03/04/2019.
//  Copyright © 2019 Vidzemes Augstkola. All rights reserved.
//

import UIKit

func downloadData(name: String, downURL: String){
    let timestamp = Date()
    let formatter = DateFormatter()
    formatter.dateFormat = "ddMMyyyyss"
    let dateString = formatter.string(from: timestamp)
    // Create destination URL
    let documentsUrl:URL =  FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first as URL!
    let destinationFileUrl = documentsUrl.appendingPathComponent("\(timestamp)_\(name)")
    
    //Create URL to the source file you want to download
    let url = URL(string: downURL)
    
    let sessionConfig = URLSessionConfiguration.default
    let session = URLSession(configuration: sessionConfig)
    
    let request = URLRequest(url:url!)
    
    let task = session.downloadTask(with: request) { (tempLocalUrl, response, error) in
        if let tempLocalUrl = tempLocalUrl, error == nil {
            // Success
            if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                print("Successfully downloaded file: \(dateString)_\(name)")
            }
            
            do {
                try FileManager.default.copyItem(at: tempLocalUrl, to: destinationFileUrl)
            } catch (let writeError) {
                print("Error creating a file \(destinationFileUrl) : \(writeError)")
            }
            
        } else {
            print("Error took place while downloading a file. Error description: %@", error?.localizedDescription);
        }
    }
    task.resume()
}
