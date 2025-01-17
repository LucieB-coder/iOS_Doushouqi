//
//  StartGamePage.swift
//  DouShouQi
//
//  Created by Thomas Chazot on 27/05/2024.
//

import SwiftUI
import DouShouQiModel

struct StartGamePage: View {
    
    @StateObject public var viewModel = StartGameViewModel()
    @State public var isShowingGameView = false
    @State public var playAR = false

    var body: some View {
        VStack(alignment: .center){
            Text("Choose your players")
                .font(.title)
                .bold()
            Image("two-players")
                .resizable()
                .frame(width: 100, height: 100)
            HStack(alignment: .center){
                Text("Player \(1)")
                    .bold()
                ChoosePlayerComponent(viewModel: viewModel.player1ViewModel)
            }
            HStack(alignment: .top){
                Text("Player \(2)")
                    .bold()
                    .padding(.top, 20)
                
                ChooseOpponentComponent(viewModel: viewModel.player2ViewModel)
            }
            Toggle(isOn: $playAR) {
                Text("Play in AR")
            }
            Spacer()
            Button(action: {
                isShowingGameView = true
            }) {
                PlayButton()
            }
            .fullScreenCover(isPresented: $isShowingGameView, content: {
               playAR ?
               AnyView(ARKitGamePage(arGameViewModel: ARGameViewModel(game: try! Game(withRules: ClassicRules(), andPlayer1: HumanPlayer(withName: viewModel.player1ViewModel.playerName, andId: .player1)!, andPlayer2: viewModel.player2ViewModel.isBot ? RandomPlayer(withName: "IYAAAAAAAA", andId: .player2)! : HumanPlayer(withName: viewModel.player2ViewModel.playerName, andId: .player2)!), boardArView: BoardARView()), isShowingGameView: $isShowingGameView))
               :
               AnyView(GamePage(gameViewModel: try! GameViewModel(game: Game(withRules: ClassicRules(), andPlayer1: HumanPlayer(withName: viewModel.player1ViewModel.playerName, andId: .player1)!, andPlayer2: viewModel.player2ViewModel.isBot ? RandomPlayer(withName: "IYAAAAAAAA", andId: .player2)! : HumanPlayer(withName: viewModel.player2ViewModel.playerName, andId: .player2)!), gameScene: GameScene(size: CGSize(width: 940, height: 740))), isShowingGameView: $isShowingGameView))

            })
            .padding()
        }
    }
}

struct StartGamePage_Previews: PreviewProvider {
    static var previews: some View {
        StartGamePage()
    }
}
