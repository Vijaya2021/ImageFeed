//
//  ContactDetailsView.swift
//  FetchableImageDemo
//
//Created by Vajja, Vijaya Lakshmi on 12/20/20.
//  Copyright © 2020 Vajja, Vijaya Lakshmi. All rights reserved.
//

import SwiftUI

struct ContactDetailsView: View {
    @State var contact: Contact
    
    @EnvironmentObject var contactList: ContactListModel
    
    var body: some View {
        VStack {
UserView(contact: contact)
            
            Spacer()
                .frame(height: 60)
            .frame(maxHeight: 40)
            .padding([.leading, .trailing], 20)
            .foregroundColor(.white)
            .background(contact.avatar != nil ? Color.red : Color.blue)
            .font(.headline)
            .cornerRadius(20)
        }
        .navigationBarTitle(Text("Contact Details"), displayMode: .inline)
    }
}

struct ContactDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ContactDetailsView(contact: Contact())
    }
}
