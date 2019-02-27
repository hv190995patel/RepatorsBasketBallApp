//
//  InterfaceController.swift
//  RepatorsBasketBallApp WatchKit Extension
//
//  Created by Hiten Patel on 2019-02-27.
//  Copyright © 2019 MAD. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    
    //MARK: Data source
    var gameList:[BasketBallObject] = []
    
    @IBOutlet weak var basketTable: WKInterfaceTable!
    
    func createGame() {
        let d = Date()
        let g1 = BasketBallObject(teamAName: "Raptors", teamBName: "Rockets", gameLocation: "NorthYork", startTime: d)
        
        let g2 = BasketBallObject(teamAName: "Toronto", teamBName: "NewYork", gameLocation: "NewYork", startTime: d)
        
        let g3 = BasketBallObject(teamAName: "Raptors", teamBName: "Toronto", gameLocation: "Toronto", startTime: d)
        
        let g4 = BasketBallObject(teamAName: "Toronto", teamBName: "Rockets", gameLocation: "NewYork", startTime: d)
        
        gameList.append(g1)
        gameList.append(g2)
        gameList.append(g3)
        gameList.append(g4)

        self.basketTable.setNumberOfRows(self.gameList.count, withRowType: "myRow")
        
        for(i,g) in self.gameList.enumerated(){
            let row = self.basketTable.rowController(at: i) as! BasketBallController
            
            row.team1Label.setText(g.teamAName)
            row.team2Label.setText(g.teamBName)
            row.locationLabel.setText(g.gameLocation)
            
            // converting Date() objects to strings
            // so we can put the start time into the label
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "hh:mm"
            let dateString = dateFormatter.string(from:g.startTime!)
            
            
            row.startTimeLabel.setText(dateString)
        }
    }
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        self.createGame()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
