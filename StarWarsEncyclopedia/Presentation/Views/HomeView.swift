import SwiftUI

struct HomeView: View {
    init() {
        NavigationBarConfiguration.configureTitle()
    }
    
    var body: some View {
        CharactersView(characters: MockCharacterGenerator().generateTroopers())
    }
}

#Preview {
    HomeView()
}
