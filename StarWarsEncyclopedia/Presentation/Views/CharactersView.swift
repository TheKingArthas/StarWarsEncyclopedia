//
//  CharactersView.swift
//  StarWarsEncyclopedia
//
//  Created by Federico De Luca on 31/12/23.
//

import SwiftUI

struct CharactersView: View {
    private static var navigationTitle = "Characters"
    @State private var viewModel: CharactersViewModel
    @State private var searchTerm: String
    @State private var error: Error?
    @State private var shouldShowAlert: Bool = false
    
    private var filteredCharacters: [Character] {
        guard !searchTerm.isEmpty else { return viewModel.characters }
        return viewModel.characters.filter { $0.name.localizedStandardContains(searchTerm) }
    }
    
    init(viewModel: CharactersViewModel) {
        NavigationBarConfiguration.configureTitle()
        self.searchTerm = ""
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationStack {
            mainView
                .navigationTitle(Self.navigationTitle)
                .background {
                    SpaceBackgroundView()
                }
        }
        .task {
            do {
                try await viewModel.getCharactersFromCurrentPage()
            } catch {
                self.error = error
                shouldShowAlert = true
            }
            
        }
        .alert(isPresented: $shouldShowAlert,
               content: {
            if let error = error {
                CustomSystemAlert().alertFromError(error, shouldShowAlert: $shouldShowAlert)
            } else {
                Alert(title: Text(""))
            }
        })
    }
    
    @ViewBuilder
    private var mainView: some View {
        characterList()
            .frame(maxHeight: .infinity)
        numberedPageControls()
            .frame(maxHeight: 64)
    }
    
    private func characterList() -> some View {
        List(filteredCharacters, id: \.name) { character in
            NavigationLink {
                CharacterDetailedView(character: character,
                                      charactersViewModel: viewModel)
            } label: {
                CustomCellView(character: character,
                               charactersViewModel: viewModel)
            }
            .listRowSeparator(.hidden)
            .listRowBackground(CustomColor.clear)
            .listRowInsets(EdgeInsets())
        }
        .scrollContentBackground(.hidden)
        .listRowSpacing(8)
        .searchable(text: $searchTerm, prompt: "Search Character")
        .font(CustomTypography.body)
        .foregroundColor(CustomColor.white)
    }
    
    private func numberedPageControls() -> some View {
        HStack {
            ChangePageButtonView(pointingDirection: .left) {
                Task {
                    await getCharactersFromPreviousPage()
                }
            }
            .padding(.leading, 16)
            Text("\(viewModel.currentPage)")
                .bodyStyle()
                .padding(.horizontal, 64)
            ChangePageButtonView(pointingDirection: .right) {
                Task {
                    await getCharactersFromNextPage()
                }
                
            }
            .padding(.trailing, 16)
        }
    }
    
    private func getCharactersFromPreviousPage() async {
        do {
            try await viewModel.getCharactersFromPreviousPage()
        } catch {
            print(error)
        }
    }
    
    private func getCharactersFromNextPage() async {
        do {
            try await viewModel.getCharactersFromNextPage()
        } catch {
            print(error)
        }
    }
}
