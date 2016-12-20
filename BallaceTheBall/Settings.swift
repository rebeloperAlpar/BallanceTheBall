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
  var mainMenuButton: RBButton!
  var appTitle = SKSpriteNode()
  var soundOnButton: RBButton!
  var gameCenterButton: RBButton!
  var moreGamesButton: RBButton!
  var restorePurchasesButton: RBButton!
  var noAdsButton: RBButton!
  
  enum NodesZPosition: CGFloat {
    case background = 0, appTitle = 1, button = 2
  }
  enum RBButtonType: String {
    case MiniButtonRate
    case MainMenu
    case SoundOn
    case GameCenter
    case MoreGames
    case RestorePurchases
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
    
    miniButtonRate = RBButton(buttonImage: "MiniButtonRate", title: "", withStars: false, starsCount: 0, buttonAction: {
      self.didTap(button: .MiniButtonRate)
    })
    miniButtonRate.setScale(0.5)
    miniButtonRate.position = CGPoint(x: self.frame.width * 0.2, y: self.frame.height * 0.6)
    miniButtonRate.zPosition = NodesZPosition.button.rawValue
    self.addChild(miniButtonRate)
    
    mainMenuButton = RBButton(buttonImage: "MiniButtonSettings", title: "", withStars: false, starsCount: 0, buttonAction: {
      self.didTap(button: .MainMenu)
    })
    mainMenuButton.setScale(0.5)
    mainMenuButton.position = CGPoint(x: self.frame.width * 0.5, y: self.frame.height * 0.2)
    mainMenuButton.zPosition = NodesZPosition.button.rawValue
      self.addChild(mainMenuButton)
    
    soundOnButton = RBButton(buttonImage: "MiniButtonSoundOn", title: "", withStars: false, starsCount: 0, buttonAction: {
      self.didTap(button: .SoundOn)
    })
    soundOnButton.setScale(0.5)
    soundOnButton.position = CGPoint(x: self.frame.width * 0.5, y: self.frame.height * 0.6)
    soundOnButton.zPosition = NodesZPosition.button.rawValue
    self.addChild(soundOnButton)
    
    gameCenterButton = RBButton(buttonImage: "MiniButtonGameCenter", title: "", withStars: false, starsCount: 0, buttonAction: {
      self.didTap(button: .GameCenter)
    })
    gameCenterButton.setScale(0.5)
    gameCenterButton.position = CGPoint(x: self.frame.width * 0.8, y: self.frame.height * 0.6)
    gameCenterButton.zPosition = NodesZPosition.button.rawValue
    self.addChild(gameCenterButton)
    
    moreGamesButton = RBButton(buttonImage: "MiniButtonMoreGames", title: "", withStars: false, starsCount: 0, buttonAction: {
      self.didTap(button: .MoreGames)
    })
    moreGamesButton.setScale(0.5)
    moreGamesButton.position = CGPoint(x: self.frame.width * 0.2, y: self.frame.height * 0.4)
    moreGamesButton.zPosition = NodesZPosition.button.rawValue
    self.addChild(moreGamesButton)
    
    restorePurchasesButton = RBButton(buttonImage: "MiniButtonRestorePurchases", title: "", withStars: false, starsCount: 0, buttonAction: {
      self.didTap(button: .RestorePurchases)
    })
    restorePurchasesButton.setScale(0.5)
    restorePurchasesButton.position = CGPoint(x: self.frame.width * 0.5, y: self.frame.height * 0.4)
    restorePurchasesButton.zPosition = NodesZPosition.button.rawValue
    self.addChild(restorePurchasesButton)
    
    noAdsButton = RBButton(buttonImage: "MiniButtonNoAds", title: "", withStars: false, starsCount: 0, buttonAction: {
      self.didTap(button: .NoAds)
    })
    noAdsButton.setScale(0.5)
    noAdsButton.position = CGPoint(x: self.frame.width * 0.8, y: self.frame.height * 0.4)
    noAdsButton.zPosition = NodesZPosition.button.rawValue
    self.addChild(noAdsButton)
    
    if !showMoreAppsButton {
      moreGamesButton.alpha = 0.0
      
      restorePurchasesButton.position = CGPoint(x: self.frame.width * 0.33, y: self.frame.height * 0.4)
      noAdsButton.position = CGPoint(x: self.frame.width * 0.66, y: self.frame.height * 0.4)
    }
  }
  
  func didTap(button: RBButtonType) {
    switch button {
    case .MiniButtonRate:
      miniButtonRateTapped()
    case .MainMenu:
      mainMenuButtonTapped()
    case .SoundOn:
      soundOnButtonTapped()
    case .GameCenter:
      gameCenterButtonTapped()
    case .MoreGames:
      moreGamesButtonTapped()
    case .RestorePurchases:
      restorePurchasesButtonTapped()
    case .NoAds:
      noAdsButtonTapped()
      
      
      
    default:
      print("Ooops, no such button type.")
    }
   
  }
  
  func miniButtonRateTapped() {
    RateMyApp.sharedInstance.okButtonPressed()
    print("Rate button tapped. Going to the App Store. If your app is not yet on the App Store nothing will happen, but this is perfectly fine. The app will go to the app's page once it is live on the App Store.")
  }
  
  func mainMenuButtonTapped() {
    
    var mainMenuName = "MainMenu"
    
    if useLevelSystem {
      mainMenuName = "MainMenuLevels"
    }
    
    let scene = MainMenu(fileNamed: mainMenuName)
    let transition = SKTransition.moveIn(with: SKTransitionDirection.up, duration: 0.5)
    //let skView = self.view as SKView!
    scene?.scaleMode = .fill
    self.view?.presentScene(scene!, transition: transition)
  }
  
  func soundOnButtonTapped() {
    if PlayerStats.shared.getCurrentBoolValue(.Sound) {
      PlayerStats.shared.changeTo(false, forStat: .Sound)
      soundOnButton.button.texture = SKTexture(imageNamed: "MiniButtonSoundOff")
      let gameViewController = self.view?.window?.rootViewController as! GameViewController
      gameViewController.backgroundMusic?.stop()
    } else {
      PlayerStats.shared.changeTo(true, forStat: .Sound)
      soundOnButton.button.texture = SKTexture(imageNamed: "MiniButtonSoundOn")
      let gameViewController = self.view?.window?.rootViewController as! GameViewController
      gameViewController.backgroundMusic?.play()
    }
  }
  
  func gameCenterButtonTapped() {
    GCHelper.sharedInstance.showGameCenter((self.view?.window?.rootViewController)!, viewState: .leaderboards)
  }
  
  func moreGamesButtonTapped() {
    if !Chartboost.hasMoreApps(CBLocationSettings) {
      Chartboost.cacheMoreApps(CBLocationSettings)
    }
    Chartboost.showMoreApps(CBLocationSettings)
    Chartboost.cacheMoreApps(CBLocationSettings)
  }
  
  func restorePurchasesButtonTapped() {
    print("Started restoring purchases")
    MKStoreKit.shared().restorePurchases()
  }
  
  func noAdsButtonTapped() {
    print("Started buying No Ads IAP")
    MKStoreKit.shared().initiatePaymentRequestForProduct(withIdentifier: InAppPurchaseID)
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
