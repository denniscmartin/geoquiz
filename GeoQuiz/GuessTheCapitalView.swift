//
//  GuessTheCapitalView.swift
//  GeoQuiz
//
//  Created by Dennis Concepción Martín on 14/9/22.
//

import SwiftUI

struct GuessTheCapitalView: View {
    @StateObject var game = CountryGameController()
    
    @Environment(\.managedObjectContext) var moc
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: .secondary, startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            GeometryReader { geo in
                VStack {
                    GameToolbar(game: game, color: .atomicTangerine)
                    
                    Spacer()
                    
                    FlagImage(flagSymbol: game.correctAnswer.value.flag, cornerRadius: 20)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .shadow(radius: 10)
                        .frame(height: geo.size.height * 0.15)
                    
                    Spacer()
                    
                    VStack(alignment: .leading) {
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Question \(game.questionCounter) of \(game.data.count)")
                                .font(.title3)
                                .foregroundColor(.white.opacity(0.7))
                            
                            Text("What is the capital of \(game.correctAnswer.key)?")
                                .font(.title)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                        }
                        
                        VStack(spacing: 15) {
                            ForEach(Array(game.userChoices.keys), id: \.self) { countryName in
                                Button {
                                    game.answer((key: countryName, value: game.data[countryName]!)) {
                                        game.selector()
                                    }
                                } label: {
                                    AnswerButton(
                                        name: game.data[countryName]!.capital,
                                        color: .chinaPink
                                    )
                                    .frame(height: geo.size.height * 0.08)
                                }
                            }
                        }
                    }
                    .frame(maxWidth: 500)
                }
                .padding()
            }
        }
        .navigationBarHidden(true)
        .modifier(GameAlertsModifier(game: game, gameType: .guessTheCapital, moc: moc))
    }
}

struct GuessTheCapitalView_Previews: PreviewProvider {
    static var previews: some View {
        GuessTheCapitalView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro Max"))
            .previewDisplayName("iPhone 14 Pro Max")
        
        GuessTheCapitalView()
            .previewDevice(PreviewDevice(rawValue: "iPad Pro (12.9-inch) (5th generation)"))
            .previewDisplayName("iPad Pro (12.9-inch) (5th generation)")
    }
}
