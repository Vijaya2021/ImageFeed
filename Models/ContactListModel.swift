//
//  ContactListModel.swift
//  FetchableImageDemo
//
//Created by Vajja, Vijaya Lakshmi on 12/20/20.
//  Copyright © 2020 Vajja, Vijaya Lakshmi. All rights reserved.
//

import SwiftUI

class ContactListModel: ObservableObject, FetchableImage {
    
    @Published var contacts = [Contact]()
    
    @Published var progress: Double = 0.0
    
    @Published var isFetching = false
    
    
    init() {
        loadContacts()
    }
    
    
    private func loadContacts() {
        self .loadImages()
       
    }
    
    func loadImages()
    {
        
       let pageUrl = "https://picsum.photos/list"

        let myUrl = NSURL(string: pageUrl)
       let request = URLRequest(url:myUrl! as URL)

      let configuration = URLSessionConfiguration.default
      let session = URLSession(configuration:configuration)
      let task = session.dataTask(with: request, completionHandler:{[weak self](data, response, error) in
        let decoder = JSONDecoder()
        guard let loadedContacts = try? decoder.decode([Contact].self, from: data!) else { return }
        
        self!.contacts = loadedContacts
            
       })
        
        task.resume()
   }
    func fetchAvatars() {
        guard !isFetching else { return }
        isFetching = true
        progress = 0.0
        let allAvatarURLs = contacts.map {$0.post_url!+"/download"}
        fetchBatchImages(using: allAvatarURLs, options: nil, partialFetchHandler: { (imageData, index) in

            DispatchQueue.main.async {
                guard let data = imageData else { return }
                self.contacts[index].avatar = UIImage(data: data)?.cgImage

                self.progress = Double(((index + 1) * 100) / self.contacts.count)
            }

        }) {
            print("Finished fetching avatars!")

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4, execute: {
                self.isFetching = false
            })
        }
    }
    
    func fetchAvatar(for contact: Contact, completion: @escaping (_ avatar: CGImage?) -> Void) {
        guard let index = contacts.firstIndex(where: { $0.id == contact.id }) else { return }

        fetchImage(from: contacts[index].post_url!+"/download") { (imageData) in
            DispatchQueue.main.async {
                guard let data = imageData else { return }
                self.contacts[index].avatar = UIImage(data: data)?.cgImage
                completion(self.contacts[index].avatar)
            }
        }
    }
    
}
