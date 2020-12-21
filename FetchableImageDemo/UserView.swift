//
//  UserView.swift
//  FetchableImageDemo
//
//Created by Vajja, Vijaya Lakshmi on 12/20/20.
//  Copyright © 2020 Vajja, Vijaya Lakshmi. All rights reserved.
//

import SwiftUI

struct UserView: View {
    var contact: Contact
    
    var body: some View {
        VStack {
            getImage()
                .frame(minHeight: 300, maxHeight: 300)
                .background(Color.yellow)
                .clipShape(Circle())
            
            Text(contact.author ?? "Contact Name")
                .font(.title)
        }
    }
    
    
    func getImage() -> Image {
        if let avatar = contact.avatar {
            return Image(avatar, scale: 1.0, label: Text(""))
        } else {
            return Image("unknown")
        }
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView(contact: Contact())
    }
}
