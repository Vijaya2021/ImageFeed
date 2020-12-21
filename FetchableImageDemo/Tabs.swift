//
//  Tabs.swift
//  FetchableImageDemo
//Created by Vajja, Vijaya Lakshmi on 12/20/20.
//  Copyright © 2020 Vajja, Vijaya Lakshmi. All rights reserved.
//

import SwiftUI

struct Tabs: View {
    var body: some View {
        TabView {
            ContactListView()
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("Contact List")
            }
        }
    }
}

struct Tabs_Previews: PreviewProvider {
    static var previews: some View {
        Tabs()
    }
}
