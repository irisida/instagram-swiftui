//
//  SearchView.swift
//  instaclone
//
//  Created by ed on 20/04/2021.
//

import SwiftUI

struct SearchView: View {
    
    @State var searchText = ""
    
    var body: some View {
        
        ScrollView {
            
            // search bar
            SearchBar(text: $searchText)
                .padding()
            
            // grid view / user list view Toggled
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
