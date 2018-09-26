//
//  GameScene.swift
//  Clicker
//
//  Created by Gal Zahavi on 5/20/18.
//  Copyright © 2018 com.Galz10. All rights reserved.
//

import SpriteKit
import GameplayKit


class GameScene: SKScene {
    
    var player = SKSpriteNode()
     private var timeLabel : SKLabelNode?
    
    override func didMove(to view: SKView)
    {
        
        
        self.player = childNode(withName: "player") as! SKSpriteNode
        player.anchorPoint = CGPoint(x: 0.5,y:0.5)
        player.position = CGPoint(x:0,y:0)
        
        
        
    }
    
    /* override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) { */
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        for touch in touches
        {
            let location = touch.location(in: self)
            print("x:",player.position.x,"y:",player.position.y)
            player.position.x = location.x
            player.position.y = location.y
            
            
            
        
        
         
            
            if(((player.position.x >= -300) && (player.position.x <= -178))&&((player.position.y >= 366) && (player.position.y <= 477)))
            {
                if let view = self.view
                {
                    // Load the SKScene from 'GameScene.sks'
                    if let scene = folderScene(fileNamed: "folderScene")
                    {
                        // Set the scale mode to scale to fit the window
                        scene.scaleMode = .aspectFill
                        
                        // Present the scene
                        view.presentScene(scene)
                    }
                    view.ignoresSiblingOrder = true
                    view.showsFPS = true
                    view.showsNodeCount = true
                    view.showsDrawCount = true
                }
            }
            
            if(((player.position.x >= -304) && (player.position.x <= -180))&&((player.position.y >= 124) && (player.position.y <= 256)))
            {
                if let view = self.view
                {
                    // Load the SKScene from 'GameScene.sks'
                    if let scene = PongScene(fileNamed: "PongScene")
                    {
                        // Set the scale mode to scale to fit the window
                        scene.scaleMode = .aspectFill
                        
                        // Present the scene
                        view.presentScene(scene)
                    }
                    view.ignoresSiblingOrder = true
                    view.showsFPS = true
                    view.showsNodeCount = true
                    view.showsDrawCount = true
                }
            }
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        let curDate = Date()
        let formater = DateFormatter()
        formater.dateFormat = "h:mm"
        let formateddate = formater.string(from: curDate)
        self.timeLabel = self.childNode(withName: "TimeLabel") as? SKLabelNode
        self.timeLabel?.text = formateddate
        
    }
}
