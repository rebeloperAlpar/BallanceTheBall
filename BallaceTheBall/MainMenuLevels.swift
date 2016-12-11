//
//  MainMenuLevels.swift
//  BallaceTheBall
//
//  Created by Alpar on 11/12/2016.
//  Copyright © 2016 Alpar. All rights reserved.
//

import SpriteKit

class MainMenuLevels: SKScene {
  
  var background = SKSpriteNode(imageNamed: "BackgroundWorld")
  var appTitle = SKSpriteNode()
  var settingsButton: RBButton!
  var moreGamesButton: RBButton!
  
  var levelButtonsArray = [RBButton!]()
  var levelButtonsPositionArray = [CGPoint]()
  
  enum NodesZPosition: CGFloat {
    case background = 0, appTitle = 1, button = 2
  }
  
  enum RBButtonType: String {
    case Settings
    case MoreGames
    case Level
  }
  
  override func didMove(to view: SKView) {
    self.anchorPoint = CGPoint.zero
    
    background.anchorPoint = CGPoint(x: 0.0, y: 0.0)
    background.position = CGPoint(x: self.frame.width * 0.0, y: self.frame.height * 0.0)
    //background.setScale(0.5)
    background.zPosition = NodesZPosition.background.rawValue
    background.size = CGSize(width: self.frame.width * 3, height: self.frame.height)
    //background.size.height = self.frame.height
    self.addChild(background)
    
    appTitle = SKSpriteNode(imageNamed: "MiniTitle")
    appTitle.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    appTitle.position = CGPoint(x: self.frame.width * 0.5, y: self.frame.height * 0.8)
    appTitle.setScale(0.5)
    appTitle.zPosition = NodesZPosition.appTitle.rawValue
    self.addChild(appTitle)
    
    settingsButton = RBButton(buttonImage: "ButtonOptions", title: "", buttonAction: {
      self.didTap(button: .Settings)
    })
    settingsButton.setScale(0.5)
    settingsButton.position = CGPoint(x: self.frame.width * 0.1, y: self.frame.height * 0.8)
    settingsButton.zPosition = NodesZPosition.button.rawValue
    self.addChild(settingsButton)
    
    moreGamesButton = RBButton(buttonImage: "ButtonMoreGames", title: "", buttonAction: {
      self.didTap(button: .MoreGames)
    })
    moreGamesButton.setScale(0.5)
    moreGamesButton.position = CGPoint(x: self.frame.width * 0.9, y: self.frame.height * 0.8)
    moreGamesButton.zPosition = NodesZPosition.button.rawValue
    self.addChild(moreGamesButton)
    
    let level1Position = CGPoint(x: self.frame.width * 0.1, y: self.frame.height * 0.1)
    let level2Position = CGPoint(x: self.frame.width * 0.2, y: self.frame.height * 0.2)
    let level3Position = CGPoint(x: self.frame.width * 0.1, y: self.frame.height * 0.1)
    let level4Position = CGPoint(x: self.frame.width * 0.1, y: self.frame.height * 0.1)
    let level5Position = CGPoint(x: self.frame.width * 0.1, y: self.frame.height * 0.1)
    let level6Position = CGPoint(x: self.frame.width * 0.1, y: self.frame.height * 0.1)
    let level7Position = CGPoint(x: self.frame.width * 0.1, y: self.frame.height * 0.1)
    let level8Position = CGPoint(x: self.frame.width * 0.1, y: self.frame.height * 0.1)
    let level9Position = CGPoint(x: self.frame.width * 0.1, y: self.frame.height * 0.1)
    let level10Position = CGPoint(x: self.frame.width * 0.1, y: self.frame.height * 0.1)
    
    
    for i in 0 ... 32 {
      let levelButton = RBButton(buttonImage: "ButtonLevel", title: "\(i + 1)" , buttonAction: { 
        PlayerStats.shared.changeTo(i + 1, forStat: .CurrentLevel)
        self.didTap(button: .Level)
      })
      
      if i > PlayerStats.shared.getCurrentValue(.HighestUnlockedLevel) {
        levelButton.disableButton()
        levelButton.button.texture = SKTexture(imageNamed: "ButtonLevelLocked")
      }
      
      var currentLevelButtonPosition = CGPoint.zero
      
      switch i {
      case 0:
        currentLevelButtonPosition = level1Position
      case 1:
        currentLevelButtonPosition = level2Position
      case 2:
        currentLevelButtonPosition = level3Position
      case 3:
        currentLevelButtonPosition = level4Position
      case 4:
        currentLevelButtonPosition = level5Position
      case 5:
        currentLevelButtonPosition = level6Position
      case 6:
        currentLevelButtonPosition = level7Position
      case 7:
        currentLevelButtonPosition = level8Position
      case 8:
        currentLevelButtonPosition = level9Position
      case 9:
        currentLevelButtonPosition = level10Position
        
      default:
        print("Ooops, no such button position.")
      }
      
      levelButton.setScale(0.5)
      levelButton.position = currentLevelButtonPosition
      
      levelButton.zPosition = NodesZPosition.button.rawValue
      
      self.addChild(levelButton)
      
      levelButtonsArray.append(levelButton)
      
    }
    
    
    
  }
  
  func didTap(button: RBButtonType) {
    switch button {
    case .Settings:
      settingsButtonTapped()
    case .MoreGames:
      moreGamesButtonTapped()
    case .Level:
      levelTapped()
      
    default:
      print("Ooops, no such button type.")
    }
  }
  
  func settingsButtonTapped() {
    
  }
  
  func moreGamesButtonTapped() {
    
  }
  
  func levelTapped() {
    
    // go to GameScene
  }
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
}
