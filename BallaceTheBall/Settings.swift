//
//  Settings.swift
//  BallaceTheBall
//
//  Created by Alpar on 03/12/2016.
//  Copyright © 2016 Alpar. All rights reserved.
//

import SpriteKit

class Settings: SKScene {
  
  var background = SKSpriteNode(imageNamed: "MiniBackground")
  var miniButtonRate: RBButton!
  var settingsButton: RBButton!
  var appTitle = SKSpriteNode()
  var soundOnButton: RBButton!
  var gameCenterButton: RBButton!
  var moreGamesButton: RBButton!
  var replayLevelButton: RBButton!
  var noAdsButton: RBButton!
  
  enum NodesZPosition: CGFloat {
    case background = 0, appTitle = 1, button = 2
  }
  
  enum RBButtonType: String {
    case MiniButtonRate
    case Settings
    case SoundOn
    case GameCenter
    case MoreGames
    case ReplayLevel
    case NoAds
    
  }
  
  func logAvailableFonts() {
    for family: String in UIFont.familyNames
    {
      print("\(family)")
      for names: String in UIFont.fontNames(forFamilyName: family)
      {
        print("== \(names)")
      }
    }
  }
  
  override func didMove(to view: SKView) {
    
    if logAllAvailableFonts {
      logAvailableFonts()
    }
    
    self.anchorPoint = CGPoint(x: 0.0, y: 0.0)
    
    background.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    //background.setScale(0.5)
    background.position = CGPoint(x: self.frame.width * 0.5, y: self.frame.height * 0.5)
    background.zPosition = NodesZPosition.background.rawValue
    background.size = CGSize(width: self.frame.width, height: self.frame.height)
    self.addChild(background)
    
    appTitle = SKSpriteNode(imageNamed: "MiniTitle")
    appTitle.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    appTitle.position = CGPoint(x: self.frame.width * 0.5, y: self.frame.height * 0.8)
    appTitle.setScale(0.5)
    appTitle.zPosition = NodesZPosition.appTitle.rawValue
    self.addChild(appTitle)
    
    miniButtonRate = RBButton(buttonImage: "MiniButtonRate", title: "", buttonAction: {
      self.didTap(button: .MiniButtonRate)
    })
    miniButtonRate.setScale(0.5)
    miniButtonRate.position = CGPoint(x: self.frame.width * 0.2, y: self.frame.height * 0.6)
    miniButtonRate.zPosition = NodesZPosition.button.rawValue
    self.addChild(miniButtonRate)
    
    settingsButton = RBButton(buttonImage: "MiniButtonSettings", title: "", buttonAction: {
      self.didTap(button: .Settings)
    })
    settingsButton.setScale(0.5)
    settingsButton.position = CGPoint(x: self.frame.width * 0.5, y: self.frame.height * 0.2)
    settingsButton.zPosition = NodesZPosition.button.rawValue
      self.addChild(settingsButton)
    
    soundOnButton = RBButton(buttonImage: "MiniButtonSoundOn", title: "", buttonAction: {
      self.didTap(button: .SoundOn)
    })
    soundOnButton.setScale(0.5)
    soundOnButton.position = CGPoint(x: self.frame.width * 0.5, y: self.frame.height * 0.6)
    soundOnButton.zPosition = NodesZPosition.button.rawValue
    self.addChild(soundOnButton)
    
    gameCenterButton = RBButton(buttonImage: "MiniButtonGameCenter", title: "", buttonAction: {
      self.didTap(button: .GameCenter)
    })
    gameCenterButton.setScale(0.5)
    gameCenterButton.position = CGPoint(x: self.frame.width * 0.8, y: self.frame.height * 0.6)
    gameCenterButton.zPosition = NodesZPosition.button.rawValue
    self.addChild(gameCenterButton)
    
    moreGamesButton = RBButton(buttonImage: "MiniButtonGameCenter", title: "", buttonAction: {
      self.didTap(button: .MoreGames)
    })
    moreGamesButton.setScale(0.5)
    moreGamesButton.position = CGPoint(x: self.frame.width * 0.2, y: self.frame.height * 0.4)
    moreGamesButton.zPosition = NodesZPosition.button.rawValue
    self.addChild(moreGamesButton)
    
    replayLevelButton = RBButton(buttonImage: "MiniButtonReplay", title: "", buttonAction: {
      self.didTap(button: .ReplayLevel)
    })
    replayLevelButton.setScale(0.5)
    replayLevelButton.position = CGPoint(x: self.frame.width * 0.5, y: self.frame.height * 0.4)
    replayLevelButton.zPosition = NodesZPosition.button.rawValue
    self.addChild(replayLevelButton)
    
    noAdsButton = RBButton(buttonImage: "MiniButtonNoAds", title: "", buttonAction: {
      self.didTap(button: .NoAds)
    })
    noAdsButton.setScale(0.5)
    noAdsButton.position = CGPoint(x: self.frame.width * 0.8, y: self.frame.height * 0.4)
    noAdsButton.zPosition = NodesZPosition.button.rawValue
    self.addChild(noAdsButton)
  }
  
  func didTap(button: RBButtonType) {
    switch button {
    case .MiniButtonRate:
      miniButtonRateTapped()
    case .Settings:
      settingsButtonTapped()
    case .SoundOn:
      soundOnButtonTapped()
    case .GameCenter:
      gameCenterButtonTapped()
    case .MoreGames:
      moreGamesButtonTapped()
    case .ReplayLevel:
      replayLevelButtonTapped()
    case .NoAds:
      noAdsButtonTapped()
      
      
      
    default:
      print("Ooops, no such button type.")
    }
   
  }
  
  func miniButtonRateTapped() {
    
  }
  
  func settingsButtonTapped() {
    
  }
  
  func soundOnButtonTapped() {
    
  }
  
  func gameCenterButtonTapped() {
    
  }
  
  func moreGamesButtonTapped() {
    
  }
  
  func replayLevelButtonTapped() {
    
  }
  
  func noAdsButtonTapped() {
    
  }
  
  func touchDown(atPoint pos : CGPoint) {
    
  }
  
  func touchMoved(toPoint pos : CGPoint) {
    
  }
  
  func touchUp(atPoint pos : CGPoint) {
    
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    for t in touches { self.touchDown(atPoint: t.location(in: self)) }
  }
  
  override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
  }
  
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    for t in touches { self.touchUp(atPoint: t.location(in: self)) }
  }
  
  override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    for t in touches { self.touchUp(atPoint: t.location(in: self)) }
  }
  
  
  override func update(_ currentTime: TimeInterval) {
    // Called before each frame is rendered
    
  }
}
