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
  
  var coin: RBButton!
  
  var score = 0
  
  var coinSprite = SKSpriteNode()
  var coinCountLabel = SKLabelNode()
  
  var timer = Timer()
  var counter = 69
  var totalTime = 59 // needs to be set exactly to the 'counter'
  var counterLabel = SKLabelNode()
  
  var currentTimeForLevel: Int!
  
  enum NodesZPositon: CGFloat{
    case background = 0, hand = 1, hero = 2, coin = 3, uI = 4
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
    
    coin = RBButton(buttonImage: "MiniCoin", title: "", withStars: false, starsCount: 0, buttonAction: { 
      print("Coin tapped")
      self.coinTapped()
    })
    coin.setScale(0.5)
    coin.zPosition = NodesZPositon.coin.rawValue
    coin.position = CGPoint.zero
    coin.alpha = 0.0
    self.addChild(coin)
    
    startShowingCoins()
    
    coinSprite = SKSpriteNode(imageNamed: "MiniCoin")
    coinSprite.anchorPoint = CGPoint(x: 0.0, y: 0.5)
    coinSprite.setScale(0.5)
    coinSprite.zPosition = NodesZPositon.uI.rawValue
    coinSprite.position = CGPoint(x: self.frame.width * 0.9, y: self.frame.height * 0.95)
    self.addChild(coinSprite)
    
    coinCountLabel = SKLabelNode(fontNamed: FontName)
    coinCountLabel.fontSize = CGFloat(FontSize)
    coinCountLabel.fontColor = FontColorScore
    coinCountLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.right
    coinCountLabel.verticalAlignmentMode = SKLabelVerticalAlignmentMode.center
    coinCountLabel.text = "\(score)"
    coinCountLabel.zPosition = NodesZPositon.uI.rawValue
    coinCountLabel.position = CGPoint(x: self.frame.width * 0.9 - 10, y: self.frame.height * 0.95)
    self.addChild(coinCountLabel)
    
    switch PlayerStats.shared.getCurrentValue(.CurrentLevel) {
    case 0:
      currentTimeForLevel = timeForGameWithoutTheLevelSystem
    case 1:
      currentTimeForLevel = timeForLevel0001
    case 2:
      currentTimeForLevel = timeForLevel0002
    case 3:
      currentTimeForLevel = timeForLevel0003
    case 4:
      currentTimeForLevel = timeForLevel0004
    case 5:
      currentTimeForLevel = timeForLevel0005
    case 6:
      currentTimeForLevel = timeForLevel0006
    case 7:
      currentTimeForLevel = timeForLevel0007
    case 8:
      currentTimeForLevel = timeForLevel0008
    case 9:
      currentTimeForLevel = timeForLevel0009
    case 10:
      currentTimeForLevel = timeForLevel0010
    case 11:
      currentTimeForLevel = timeForLevel0011
    case 12:
      currentTimeForLevel = timeForLevel0012
    case 13:
      currentTimeForLevel = timeForLevel0013
    case 14:
      currentTimeForLevel = timeForLevel0014
    case 15:
      currentTimeForLevel = timeForLevel0015
    case 16:
      currentTimeForLevel = timeForLevel0016
    case 17:
      currentTimeForLevel = timeForLevel0017
    case 18:
      currentTimeForLevel = timeForLevel0018
    case 19:
      currentTimeForLevel = timeForLevel0019
    case 20:
      currentTimeForLevel = timeForLevel0020
    case 21:
      currentTimeForLevel = timeForLevel0021
    case 22:
      currentTimeForLevel = timeForLevel0022
    case 23:
      currentTimeForLevel = timeForLevel0023
    case 24:
      currentTimeForLevel = timeForLevel0024
    case 25:
      currentTimeForLevel = timeForLevel0025
    case 26:
      currentTimeForLevel = timeForLevel0026
    case 27:
      currentTimeForLevel = timeForLevel0027
    case 28:
      currentTimeForLevel = timeForLevel0028
    case 29:
      currentTimeForLevel = timeForLevel0029
    case 30:
      currentTimeForLevel = timeForLevel0030
    case 31:
      currentTimeForLevel = timeForLevel0031
    case 32:
      currentTimeForLevel = timeForLevel0032
    case 33:
      currentTimeForLevel = timeForLevel0033
    default:
      break
    }
    
    counter = currentTimeForLevel
    totalTime = counter
    
    counterLabel = SKLabelNode(fontNamed: FontName)
    counterLabel.fontSize = CGFloat(FontSize)
    counterLabel.fontColor = FontColorScore
    counterLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
    counterLabel.verticalAlignmentMode = SKLabelVerticalAlignmentMode.center
    updateCounter()
    counterLabel.zPosition = NodesZPositon.uI.rawValue
    counterLabel.position = CGPoint(x: self.frame.width * 0.1, y: self.frame.height * 0.95)
    self.addChild(counterLabel)
    
    timer = Timer.scheduledTimer(timeInterval: 1, target:self, selector: #selector(Gameplay.updateCounter), userInfo: nil, repeats: true)
    
  }
  
  func updateCounter() {
    
    counter -= 1
    
    let minutes = counter / 60
    var minutesText = "\(minutes)"
    let seconds = counter % 60
    var secondsText = "\(seconds)"
    
    if counter / 60 < 10 {
      minutesText = "0\(minutes)"
    }
    if counter % 60 < 10 {
      secondsText = "0\(seconds)"
    }
    
    counterLabel.text = "\(minutesText):\(secondsText)"
  }
  
  func startShowingCoins() {
    var wait = SKAction()
    let wait1 = SKAction.wait(forDuration: TimeInterval(CGFloat.random(1.0, max: 2.0)))
    let wait2 = SKAction.wait(forDuration: TimeInterval(CGFloat.random(1.0, max: 2.0)))
    let wait3 = SKAction.wait(forDuration: TimeInterval(CGFloat.random(1.0, max: 2.0)))
    let randomNumber = Int(CGFloat.random(1.0, max: 3.99))
    switch randomNumber {
    case 1:
      wait = wait1
    case 2:
      wait = wait2
    case 3:
      wait = wait3
    default:
      print("Ooops, no such wait time.")
    }
    let showCoin = SKAction.run { 
      self.coin.alpha = 1.0
    }
    let hideCoin = SKAction.run { 
      self.coin.alpha = 0.0
    }
    let moveCoin = SKAction.run { 
      self.coin.position = CGPoint(x: CGFloat.random(self.coin.frame.size.width, max: self.frame.width - self.coin.frame.size.width), y: CGFloat.random(self.coin.frame.size.height + 150, max: self.frame.height - self.coin.frame.size.height - 150))
    }
    
    let coinSequence = SKAction.sequence([wait, moveCoin, showCoin, wait1, wait, hideCoin])
    let foreverCoinSequence = SKAction.repeatForever(coinSequence)
    coin.run(foreverCoinSequence)
  }
  
  func coinTapped() {
    coin.alpha = 0.0
    score += 1
    updateUI()
  }
  
  func updateUI() {
    coinCountLabel.text = "\(score)"
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
  
  func gameOver() {
    timer.invalidate()
  }

}
