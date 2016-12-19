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
    
    if showAdsOnMainMenu {
      showAds()
    }
    
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
    
    settingsButton = RBButton(buttonImage: "ButtonOptions", title: "", withStars: false, starsCount: 0, buttonAction: {
      self.didTap(button: .Settings)
    })
    settingsButton.setScale(0.5)
    settingsButton.position = CGPoint(x: self.frame.width * 0.1, y: self.frame.height * 0.8)
    settingsButton.zPosition = NodesZPosition.button.rawValue
    self.addChild(settingsButton)
    
    moreGamesButton = RBButton(buttonImage: "ButtonMoreGames", title: "", withStars: false, starsCount: 0, buttonAction: {
      self.didTap(button: .MoreGames)
    })
    moreGamesButton.setScale(0.5)
    moreGamesButton.position = CGPoint(x: self.frame.width * 0.9, y: self.frame.height * 0.8)
    moreGamesButton.zPosition = NodesZPosition.button.rawValue
    self.addChild(moreGamesButton)
    
    if !showMoreAppsButton {
      moreGamesButton.alpha = 0.0
    }
    
    let level1Position = CGPoint(x: self.frame.width * 0.1, y: self.frame.height * 0.2)
    let level2Position = CGPoint(x: self.frame.width * 0.3, y: self.frame.height * 0.27)
    let level3Position = CGPoint(x: self.frame.width * 0.3, y: self.frame.height * 0.4)
    let level4Position = CGPoint(x: self.frame.width * 0.15, y: self.frame.height * 0.52)
    let level5Position = CGPoint(x: self.frame.width * 0.25, y: self.frame.height * 0.65)
    let level6Position = CGPoint(x: self.frame.width * 0.45, y: self.frame.height * 0.67)
    let level7Position = CGPoint(x: self.frame.width * 0.65, y: self.frame.height * 0.65)
    let level8Position = CGPoint(x: self.frame.width * 0.75, y: self.frame.height * 0.52)
    let level9Position = CGPoint(x: self.frame.width * 0.7, y: self.frame.height * 0.42)
    let level10Position = CGPoint(x: self.frame.width * 0.63, y: self.frame.height * 0.33)
    let level11Position = CGPoint(x: self.frame.width * 0.75, y: self.frame.height * 0.25)
    let level12Position = CGPoint(x: self.frame.width * 0.9, y: self.frame.height * 0.24)
    let level13Position = CGPoint(x: self.frame.width * 1.1, y: self.frame.height * 0.27)
    let level14Position = CGPoint(x: self.frame.width * 1.25, y: self.frame.height * 0.35)
    let level15Position = CGPoint(x: self.frame.width * 1.12, y: self.frame.height * 0.45)
    let level16Position = CGPoint(x: self.frame.width * 1.07, y: self.frame.height * 0.55)
    let level17Position = CGPoint(x: self.frame.width * 1.25, y: self.frame.height * 0.63)
    let level18Position = CGPoint(x: self.frame.width * 1.45, y: self.frame.height * 0.64)
    let level19Position = CGPoint(x: self.frame.width * 1.65, y: self.frame.height * 0.63)
    let level20Position = CGPoint(x: self.frame.width * 1.79, y: self.frame.height * 0.55)
    let level21Position = CGPoint(x: self.frame.width * 1.77, y: self.frame.height * 0.45)
    let level22Position = CGPoint(x: self.frame.width * 1.78, y: self.frame.height * 0.35)
    let level23Position = CGPoint(x: self.frame.width * 1.90, y: self.frame.height * 0.26)
    let level24Position = CGPoint(x: self.frame.width * 2.15, y: self.frame.height * 0.27)
    let level25Position = CGPoint(x: self.frame.width * 2.32, y: self.frame.height * 0.35)
    let level26Position = CGPoint(x: self.frame.width * 2.25, y: self.frame.height * 0.45)
    let level27Position = CGPoint(x: self.frame.width * 2.2, y: self.frame.height * 0.55)
    let level28Position = CGPoint(x: self.frame.width * 2.35, y: self.frame.height * 0.63)
    let level29Position = CGPoint(x: self.frame.width * 2.55, y: self.frame.height * 0.67)
    let level30Position = CGPoint(x: self.frame.width * 2.75, y: self.frame.height * 0.55)
    let level31Position = CGPoint(x: self.frame.width * 2.63, y: self.frame.height * 0.45)
    let level32Position = CGPoint(x: self.frame.width * 2.76, y: self.frame.height * 0.36)
    let level33Position = CGPoint(x: self.frame.width * 2.86, y: self.frame.height * 0.25)
    
    
    
    
    
    for i in 0 ... 32 {
      
      let starsCount = PlayerStats.shared.getStars("Level\(i + 1)")
      
      print("The stars are: \(starsCount)")
      
      let levelButton = RBButton(buttonImage: "ButtonLevel", title: "\(i + 1)" , withStars: true, starsCount: starsCount, buttonAction: {
        PlayerStats.shared.changeTo(i + 1, forStat: .CurrentLevel)
        self.didTap(button: .Level)
      })
      
      if i >= PlayerStats.shared.getCurrentValue(.HighestUnlockedLevel) {
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
      case 10:
        currentLevelButtonPosition = level11Position
      case 11:
        currentLevelButtonPosition = level12Position
      case 12:
        currentLevelButtonPosition = level13Position
      case 13:
        currentLevelButtonPosition = level14Position
      case 14:
        currentLevelButtonPosition = level15Position
      case 15:
        currentLevelButtonPosition = level16Position
      case 16:
        currentLevelButtonPosition = level17Position
      case 17:
        currentLevelButtonPosition = level18Position
      case 18:
        currentLevelButtonPosition = level19Position
      case 19:
        currentLevelButtonPosition = level20Position
      case 20:
        currentLevelButtonPosition = level21Position
      case 21:
        currentLevelButtonPosition = level22Position
      case 22:
        currentLevelButtonPosition = level23Position
      case 23:
        currentLevelButtonPosition = level24Position
      case 24:
        currentLevelButtonPosition = level25Position
      case 25:
        currentLevelButtonPosition = level26Position
      case 26:
        currentLevelButtonPosition = level27Position
      case 27:
        currentLevelButtonPosition = level28Position
      case 28:
        currentLevelButtonPosition = level29Position
      case 29:
        currentLevelButtonPosition = level30Position
      case 30:
        currentLevelButtonPosition = level31Position
      case 31:
        currentLevelButtonPosition = level32Position
      case 32:
        currentLevelButtonPosition = level33Position
        
      default:
        print("Ooops, no such button position.")
      }
      
      levelButton.setScale(0.5)
      levelButton.position = currentLevelButtonPosition
      
      levelButton.zPosition = NodesZPosition.button.rawValue
      
      self.addChild(levelButton)
      
      levelButtonsArray.append(levelButton)
      
      

      
      
    }
    
    for i in 0 ... levelButtonsArray.count - 1 {
      //levelButtonsArray[i].position = CGPoint(x: levelButtonsArray[i].position.x - self.frame.width * 0.0, y: levelButtonsArray[i].position.y)
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
    let scene = Settings(fileNamed: "Settings")
    let transition = SKTransition.moveIn(with: SKTransitionDirection.up, duration: 0.5)
    scene?.scaleMode = .fill
    self.view?.presentScene(scene!, transition: transition)
    
  }
  
  func moreGamesButtonTapped() {
    if !Chartboost.hasMoreApps(CBLocationSettings) {
      Chartboost.cacheMoreApps(CBLocationSettings)
    }
    Chartboost.showMoreApps(CBLocationSettings)
    Chartboost.cacheMoreApps(CBLocationSettings)
  }
  
  func levelTapped() {
    
    // go to GameScene
  }
  
  func showAds() {
    if !MKStoreKit.shared().isProductPurchased(InAppPurchaseID) {
      if !Chartboost.hasInterstitial(CBLocationMainMenu) {
        Chartboost.cacheInterstitial(CBLocationMainMenu)
      }
      Chartboost.showInterstitial(CBLocationMainMenu)
      Chartboost.cacheInterstitial(CBLocationMainMenu)
    }
  }
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
}
