//
//  PongScene.swift
//  Clicker
//
//  Created by Gal Zahavi on 5/20/18.
//  Copyright © 2018 com.Galz10. All rights reserved.
//ne

import SpriteKit
import GameplayKit


class PongScene: SKScene {
    
    var ball = SKSpriteNode()
    var PlayerPadle = SKSpriteNode()
    var ComputerPadle = SKSpriteNode()
    
    override func didMove(to view: SKView)
    {
        ball = self.childNode(withName: "ball1") as! SKSpriteNode
        PlayerPadle = self.childNode(withName: "PlayerPadel") as! SKSpriteNode
        ComputerPadle = self.childNode(withName: "ComputerPadel") as! SKSpriteNode
        
        ball.physicsBody?.applyImpulse(CGVector(dx: 20, dy: 20))
        
        let border = SKPhysicsBody(edgeLoopFrom: self.frame)
        
        border.friction = 0
        border.restitution = 1
        
        self.physicsBody = border
    
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        
        for touch in touches
        {
            let location = touch.location(in: self)
        
            PlayerPadle.run(SKAction.moveTo(x:location.x, duration: 0.2))
            
            
        }
    
    }
    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        for touch in touches
        {
            let location = touch.location(in: self)
            
            PlayerPadle.run(SKAction.moveTo(x:location.x, duration: 0.2))
            
        }
    
    }
        
    override func update(_ currentTime: TimeInterval) {
            // Called before each frame is rendered
        ComputerPadle.run(SKAction.moveTo(x: ball.position.x, duration: 1.0))
        
        if (ball.position.y < -519)
        {
            sleep(1)
            ball.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
            ball.position = CGPoint(x: 0, y: 0)
            ball.physicsBody?.applyImpulse(CGVector(dx: 20, dy: 20))
        }
        if (ball.position.y > 480)
        {
            sleep(1)
            ball.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
            ball.position = CGPoint(x: 0, y: 0)
            ball.physicsBody?.applyImpulse(CGVector(dx: -20, dy: -20))
        }
        }
    }

