//
//  MainMenu.swift
//  BallaceTheBall
//
//  Created by Alpar on 11/12/2016.
//  Copyright © 2016 Alpar. All rights reserved.
//

import Foundation
import SpriteKit

class MainMenu: SKScene {
  
  var background = SKSpriteNode (imageNamed: "MiniBackground")
  var appTitle = SKSpriteNode ()
  var playButton: RBButton!
  var settingsButton: RBButton!
  var moregamesButton: RBButton!
  
  enum NodesZPositon: CGFloat{
    case background = 0, appTitle = 1, button = 2
  }
  
  enum RBButtonType: String {
    case Play
    case Settings
    case MoreGames
  }
  
  override func didMove(to view: SKView) {
    
    if showAdsOnMainMenu {
      showAds()
    }
    
    self.anchorPoint = CGPoint.zero
  
  background.anchorPoint = CGPoint(x: 0.5, y: 0.5)
  background.position = CGPoint(x: self.frame.width * 0.5, y: self.frame.height * 0.5)
  background.zPosition = NodesZPositon.background.rawValue
  background.size = CGSize(width: self.frame.width, height: self.frame.height)
  self.addChild(background)
    
  appTitle = SKSpriteNode (imageNamed: "MiniTitle" )
  appTitle.anchorPoint = CGPoint(x: 0.5, y: 0.5)
  appTitle.position = CGPoint(x: self.frame.width * 0.5, y: self.frame.height * 0.8)
  appTitle.setScale(0.5)
  appTitle.zPosition = NodesZPositon.appTitle.rawValue
  self.addChild(appTitle)
    
  playButton = RBButton(buttonImage: "MiniButtonPlay", title: "", withStars: false, starsCount: 0, buttonAction: {
    self.didTap(button: .Play)
  })
  playButton.setScale(0.5)
  playButton.position = CGPoint(x: self.frame.width * 0.5, y: self.frame.height * 0.5)
  playButton.zPosition = NodesZPositon.button.rawValue
    self.addChild(playButton)
    
  settingsButton = RBButton(buttonImage: "MiniButtonSettings", title: "", withStars: false, starsCount: 0, buttonAction: {
    self.didTap(button: .Settings)
  })
  settingsButton.setScale(0.5)
  settingsButton.position = CGPoint(x: self.frame.width * 0.3, y: self.frame.height * 0.25)
  settingsButton.zPosition = NodesZPositon.button.rawValue
  self.addChild(settingsButton)
    
  moregamesButton = RBButton(buttonImage: "MiniButtonMoreGames", title: "", withStars: false, starsCount: 0, buttonAction: {
    self.didTap(button: .MoreGames)
  })
  moregamesButton.setScale(0.5)
  moregamesButton.position = CGPoint(x: self.frame.width * 0.7, y: self.frame.height * 0.25)
  moregamesButton.zPosition = NodesZPositon.button.rawValue
  self.addChild(moregamesButton)
    
    if !showMoreAppsButton {
      moregamesButton.alpha = 0.0
      
      settingsButton.position = CGPoint(x: self.frame.width * 0.5, y: self.frame.height * 0.25)
    }
  
  }
  
  func didTap(button: RBButtonType) {
    switch button {
    case .Play:
      playButtonTapped()
    case .Settings:
      settingsButtonTapped()
    case .MoreGames:
     moregamesButtonTapped()
    default:
      print("Ooops, no such button type.")
    }
  }
  
  func playButtonTapped() {
    PlayerStats.shared.changeTo(0, forStat: .CurrentLevel)
    let scene = Gameplay(fileNamed: "Gameplay")
    let transition = SKTransition.moveIn(with: SKTransitionDirection.up, duration: 0.5)
    scene?.scaleMode = .fill
    self.view?.presentScene(scene!, transition: transition)
    
  }
  
  func settingsButtonTapped() {
    
    let scene = Settings(fileNamed: "Settings")
    let transition = SKTransition.moveIn(with: SKTransitionDirection.up, duration: 0.5)
    scene?.scaleMode = .fill
    self.view?.presentScene(scene!, transition: transition)
    
  }
  
  func moregamesButtonTapped() {
    if !Chartboost.hasMoreApps(CBLocationSettings) {
      Chartboost.cacheMoreApps(CBLocationSettings)
    }
    Chartboost.showMoreApps(CBLocationSettings)
    Chartboost.cacheMoreApps(CBLocationSettings)
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


