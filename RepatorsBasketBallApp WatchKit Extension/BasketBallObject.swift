//
//  BasketBallObject.swift
//  RepatorsBasketBallApp WatchKit Extension
//
//  Created by Hiten Patel on 2019-02-27.
//  Copyright © 2019 MAD. All rights reserved.
//

import WatchKit

class BasketBallObject: NSObject {
    
    // MARK: class properties
    var teamAName:String?
    var teamBName:String?
    var gameLocation:String?
    var startTime:Date?
    
    // MARK: contructor
    convenience override init() {
        let d = Date()
        self.init(teamAName:"", teamBName:"", gameLocation:"", startTime:d)
    }
    
    init(teamAName:String, teamBName:String, gameLocation:String, startTime:Date) {
        self.teamAName = teamAName
        self.teamBName = teamBName
        self.gameLocation = gameLocation
        self.startTime = startTime
    }
}
