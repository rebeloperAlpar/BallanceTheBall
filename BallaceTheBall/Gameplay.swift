//
//  Gameplay.swift
//  BallaceTheBall
//
//  Created by Alpar on 20/12/2016.
//  Copyright © 2016 Alpar. All rights reserved.
//

import Foundation
import SpriteKit

class Gameplay: SKScene, SKPhysicsContactDelegate {
  
  var background = SKSpriteNode (imageNamed: "MiniBackground")
  var hero = SKSpriteNode (imageNamed: "MiniHero")
  var hand = SKSpriteNode (imageNamed: "MiniHand")
  
  let motionKit = MotionKit()
  
  var isGameOver = false
  
  enum NodesZPositon: CGFloat{
    case background = 0, hand = 1, hero = 2, coin = 3
  }
  
  struct PhysicsCategory {
    static let Hero : UInt32 = 0x1 << 1
    static let Hand : UInt32 = 0x1 << 2
    static let None : UInt32 = 0x1 << 3
  }
  
  override func didMove(to view: SKView) {
    
    self.physicsWorld.contactDelegate = self
    self.physicsWorld.gravity = CGVector(dx: 0.0, dy: -0.85)
    
    startAccelerometer()
    
    self.anchorPoint = CGPoint.zero
    
    background.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    background.position = CGPoint(x: self.frame.width * 0.5, y: self.frame.height * 0.5)
    background.zPosition = NodesZPositon.background.rawValue
    background.size = CGSize(width: self.frame.width, height: self.frame.height)
    self.addChild(background)
    
    hero.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    hero.setScale(0.5)
    hero.position = CGPoint(x: self.frame.width * 0.5, y: self.frame.height * 0.8)
    hero.zPosition = NodesZPositon.hero.rawValue
    
    hero.physicsBody = SKPhysicsBody(circleOfRadius: hero.frame.height * 0.5)
    
    hero.physicsBody?.categoryBitMask = PhysicsCategory.Hero
    hero.physicsBody?.collisionBitMask = PhysicsCategory.Hand
    hero.physicsBody?.contactTestBitMask = PhysicsCategory.Hand
    
    hero.physicsBody?.affectedByGravity = true
    hero.physicsBody?.isDynamic = true
    
    self.addChild(hero)
    
    hand.anchorPoint = CGPoint(x: 0.5, y: 0.0)
    hand.setScale(0.5)
    hand.position = CGPoint(x: self.frame.width * 0.5, y: self.frame.height * 0.0)
    hand.zPosition = NodesZPositon.hand.rawValue
    
    hand.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: hand.frame.width * 0.05, height: hand.frame.height * 2))
    
    hand.physicsBody?.categoryBitMask = PhysicsCategory.Hand
    hand.physicsBody?.collisionBitMask = PhysicsCategory.Hero
    hand.physicsBody?.contactTestBitMask = PhysicsCategory.Hero
    
    hand.physicsBody?.affectedByGravity = false
    hand.physicsBody?.isDynamic = true
    
    hand.physicsBody?.mass = 1000
    
    self.addChild(hand)
    
    
  }
  
  func startAccelerometer() {
    motionKit.getAccelerometerValues(0.2){
      (x, y, z) in
      //Interval is in seconds. And now you have got the x, y and z values here
      
      let xValue: Double? = x
      
      if xValue != nil {
        //let impulse: CGPoint = ccp(CGFloat(xValue! * 100), CGFloat(0.0))
        //let move = CCActionMoveBy.action(withDuration: 0.2, position: impulse) as! CCActionMoveBy
        
        let move = SKAction.moveBy(x: CGFloat(xValue!) * 100.0, y: 0.0, duration: 1.0)
        
        //if !self.isPaused {
          self.hand.run(move)
        //}
      }
      
    }
  }
  
  override func update(_ currentTime: TimeInterval) {
    // Called before each frame is rendered
    
    if hand.position.y < 0 {
      hand.position.y = 0
    }
    
    if hand.position.x < 0 {
      hand.position.x = 0
    }
    
    if hand.position.x > self.frame.width {
      hand.position.x = self.frame.width
    }
    
    if hero.position.y < -hero.frame.height {
      if !isGameOver {
        print("Game Over")
        isGameOver = true
      }
      
    }
    
    if hero.position.y < -hero.frame.width {
      if !isGameOver {
        print("Game Over")
        isGameOver = true
      }
    }
    
    if hero.position.y < self.frame.width + hero.frame.width {
      if !isGameOver {
        print("Game Over")
        isGameOver = true
      }
    }
    
  }

}
