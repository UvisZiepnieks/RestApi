//
//  jsonData.swift
//  RestApi
//
//  Created by Vidzemes Augstkola on 02/04/2019.
//  Copyright © 2019 Vidzemes Augstkola. All rights reserved.
//

import UIKit

class jsonData: Codable {
    let name: String
    let download_url: String
    
    init(name: String, download_url: String) {
        self.name = name
        self.download_url = download_url
    }
    
}
