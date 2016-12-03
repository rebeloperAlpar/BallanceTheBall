//
//  MainMenu.swift
//  BallaceTheBall
//
//  Created by Alpar on 03/12/2016.
//  Copyright © 2016 Alpar. All rights reserved.
//

import SpriteKit

class MainMenu: SKScene {
  
  var background = SKSpriteNode(imageNamed: "MiniBackground")
  var playButton: RBButton!
  var settingsButton: RBButton!
  
  enum NodesZPosition: CGFloat {
    case background = 0, button = 1
  }
  
  enum RBButtonType: String {
    case Play
    case settings
  }
  
  override func didMove(to view: SKView) {
    self.anchorPoint = CGPoint(x: 0.0, y: 0.0)
    
    background.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    //background.setScale(0.5)
    background.position = CGPoint(x: self.frame.width * 0.5, y: self.frame.height * 0.5)
    background.zPosition = NodesZPosition.background.rawValue
    background.size = CGSize(width: self.frame.width, height: self.frame.height)
    self.addChild(background)
    
    playButton = RBButton(buttonImage: "MiniButtonPlay", buttonAction: { 
      self.didTap(button: .Play)
    })
    playButton.setScale(0.5)
    playButton.position = CGPoint(x: self.frame.width * 0.5, y: self.frame.height * 0.5)
    playButton.zPosition = NodesZPosition.button.rawValue
    self.addChild(playButton)
    
    settingsButton = RBButton(buttonImage: "MiniButtonSettings", buttonAction: {
      self.didTap(button: .settings)
    })
    settingsButton.setScale(0.5)
    settingsButton.position = CGPoint(x: self.frame.width * 0.5, y: self.frame.height * 0.3)
    settingsButton.zPosition = NodesZPosition.button.rawValue
      self.addChild(settingsButton)
  }
  
  func didTap(button: RBButtonType) {
    switch button {
    case .Play:
      playButtonTapped()
    default:
      print("Ooops, no such button type.")
    }
  }
  
  func playButtonTapped() {
    
  }
  
  func settingsButtonTapped() {
    
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
