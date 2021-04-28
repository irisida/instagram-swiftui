//
//  SearchView.swift
//  instaclone
//
//  Created by ed on 20/04/2021.
//

import SwiftUI

struct SearchView: View {
    
    @State var searchText = ""
    @State var inSearchMode = false
    
    @ObservedObject var viewModel = SearchViewModel()
    
    var body: some View {
        
        ScrollView {
            
            // search bar
            SearchBar(text: $searchText, isEditing: $inSearchMode)
                .padding()
            
            ZStack {
                if inSearchMode {
                    UserListView(viewModel: viewModel, searchText: $searchText)
                } else {
                    PostGridView(viewModel: viewModel)
                }
            }
        
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
