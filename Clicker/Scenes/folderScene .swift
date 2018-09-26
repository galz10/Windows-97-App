//
//  folderSce.swift
//  Clicker
//
//  Created by Gal Zahavi on 5/20/18.
//  Copyright © 2018 com.Galz10. All rights reserved.
//ne

import SpriteKit
import GameplayKit


class folderScene: SKScene {
    
    var player = SKSpriteNode()
    
    
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
            
            if(((player.position.x >= -54) && (player.position.x <= 61))&&((player.position.y >= -149) && (player.position.y <= -90)))
            {
                if let view = self.view {
                    // Load the SKScene from 'GameScene.sks'
                    if let scene = SKScene(fileNamed: "GameScene") {
                        // Set the scale mode to scale to fit the window
                        scene.scaleMode = .aspectFill
                        
                        // Present the scene
                        view.presentScene(scene)
                    }
                    
                    view.ignoresSiblingOrder = true
                    
                    view.showsFPS = true
                    view.showsNodeCount = true
                
            }
        }
    }
    
        func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
    }
}
}
