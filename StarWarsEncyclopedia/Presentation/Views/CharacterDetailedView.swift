//
//  CharacterDetailedView.swift
//  StarWarsEncyclopedia
//
//  Created by Federico De Luca on 29/12/23.
//

import SwiftUI

struct CharacterDetailedView: View {
    @State private var bouncing = false
    @State private var characterImage: Image?
    private var character: Character
    private let charactersViewModel: CharactersViewModel
    
    init(character: Character,
         charactersViewModel: CharactersViewModel) {
        self.character = character
        self.charactersViewModel = charactersViewModel
    }
    
    var body: some View {
        mainView
            .background {
                SpaceBackgroundView()
            }
            .onAppear {
                Task {
                    do {
                        if let imageUrl = await charactersViewModel.getCharacterImageUrl(character) {
                            let imageData = try Data(contentsOf: imageUrl)
                            characterImage = Image(uiImage: UIImage(data: imageData)!)
                        }
                    } catch {
                        print("Error fetching character image: \(error)")
                    }
                }
            }
    }
    
    private var mainView: some View {
        VStack {
            characterAvatarView()
                .padding([.top, .bottom], 32)
            characterNameView()
                .padding(.bottom, 8)
            characterInfoView()
                .padding(.bottom, 32)
        }
        .padding(.horizontal, 32)
    }
    
    private func characterNameView() -> some View {
        Text(character.name)
            .h1Style()
    }
    
    private func characterInfoView() -> some View {
        VStack(alignment: .leading, spacing: 8) {
            if character.gender != .other {
                HStack {
                    Text("Gender: ")
                        .bodyStyle()
                    genderImageView(character.gender)
                }
            }
            Text("Birth year: \(character.birthYear)")
                .bodyStyle()
            Text("Height: \(character.height)")
                .bodyStyle()
            Text("Weight: \(character.weight)")
                .bodyStyle()
            Text("Hair color: \(character.hairColor)")
                .bodyStyle()
            Text("Skin color: \(character.skinColor)")
                .bodyStyle()
            Text("Eyes color: \(character.eyesColor)")
                .bodyStyle()
        }
    }
    
    @ViewBuilder
    private func characterAvatarView() -> some View {
        var avatarImage = characterImage ?? CustomImaging.questionMark
        avatarImage
            .resizable()
            .background(Color.white)
            .aspectRatio(contentMode: .fill)
            .frame(width: 256, height: 256)
            .clipShape(Circle())
            .frame(maxHeight: 280, alignment: bouncing ? .bottom : .top)
            .animation(Animation.easeInOut(duration: 5.0).repeatForever(autoreverses: true),
                       value: bouncing)
            .onAppear {
                self.bouncing = false
                self.bouncing.toggle()
            }
    }
    
    @ViewBuilder
    private func genderImageView(_ gender: Gender) -> some View {
        let frameSize: CGFloat = 24
        
        switch gender {
        case .male:
            CustomImaging.genderMale
                .resizable()
                .renderingMode(.template)
                .foregroundStyle(CustomColor.white)
                .frame(width: frameSize, height: frameSize)
        case .female:
            CustomImaging.genderFemale
                .resizable()
                .renderingMode(.template)
                .foregroundStyle(CustomColor.white)
                .frame(width: frameSize, height: frameSize)
        default:
            EmptyView()
        }
    }
}
