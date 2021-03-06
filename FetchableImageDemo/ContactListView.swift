//
//  ContactListView.swift
//  FetchableImageDemo
//
//Created by Vajja, Vijaya Lakshmi on 12/20/20.
//  Copyright © 2020 Vajja, Vijaya Lakshmi. All rights reserved.
//

import SwiftUI

struct ContactListView: View {
    @EnvironmentObject var contactList: ContactListModel
    
    var body: some View {
        ZStack(alignment: .bottom) {
            NavigationView {
                List {
                    ForEach(contactList.contacts) { contact in
                        NavigationLink(destination: ContactDetailsView(contact: contact)) {

                            HStack {
                                self.getImage(for: contact)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 80, height: 80, alignment: .center)
                                    .background(Color.yellow)
                                    .clipShape(Circle())

                                    Text(contact.author ?? "")
                                        .font(.headline)
                                        .padding(.leading, 20)
                            }

                        }
                    }
                }
                .navigationBarTitle("Contacts")
                .navigationBarItems(
                    leading:
                    Button(action: {
                        self.contactList.fetchAvatars()
                    }) {
                        Image(systemName: "arrow.clockwise")
                        Text("Load Contacts")
                    }
                )
            }
            
            
            if self.contactList.isFetching {
                ProgressView(progress: contactList.progress)
                    .frame(width: nil, height: 15, alignment: .bottom)
                    .padding(.all, 15)
                    .background(Color.black.opacity(0.75))
            }
            
        }
    }
    
    
    func getImage(for contact: Contact) -> Image {
        if let avatar = contact.avatar {
            return Image(avatar, scale: 1.0, label: Text(""))
        } else {
            return Image("unknown")
        }
    }
}

struct ContactListView_Previews: PreviewProvider {
    static var previews: some View {
        ContactListView().environmentObject(ContactListModel())
    }
}
