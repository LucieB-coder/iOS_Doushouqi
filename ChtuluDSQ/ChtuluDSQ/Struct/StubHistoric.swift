//
//  StubHistoric.swift
//  ChtuluDSQ
//
//  Created by Thomas Chazot on 28/05/2024.
//

import Foundation

public struct StubHistoric{
    
    public static func getHistoric() -> [FinishedGame]{
        var finishedGames: [FinishedGame] = [
            FinishedGame(player1Id: 1, player2Id: 4, winner: 1),
            FinishedGame(player1Id: 1, player2Id: 4, winner: 1),
            FinishedGame(player1Id: 2, player2Id: 4, winner: 1),
            FinishedGame(player1Id: 2, player2Id: 4, winner: 1),
            FinishedGame(player1Id: 2, player2Id: 4, winner: 1),
            FinishedGame(player1Id: 3, player2Id: 4, winner: 1),
            FinishedGame(player1Id: 3, player2Id: 4),
        ]
        
        return finishedGames
    }
}
