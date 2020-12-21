//
//  Contact.swift
//  FetchableImageDemo
//
//Created by Vajja, Vijaya Lakshmi on 12/20/20.
//  Copyright © 2020 Vajja, Vijaya Lakshmi. All rights reserved.
//

import SwiftUI

struct Contact: Decodable, Identifiable {
    var id: Int?
    var author: String?
    var post_url: String?
    
    var avatar: CGImage?
        
    enum CodingKeys: String, CodingKey {
        case id, author, post_url
    }
}
