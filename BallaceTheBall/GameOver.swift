//
//  GameOver.swift
//  BallaceTheBall
//
//  Created by Alpar on 04/12/2016.
//  Copyright © 2016 Alpar. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameOver: SKScene {
  
  var background = SKSpriteNode(imageNamed: "MiniBackground")
  var mainMenuButton: RBButton!
  var replayButton: RBButton!
  var shareButton: RBButton!
  
  var bestScoreTextLabel = SKLabelNode()
  var bestScore = 0
  var bestScoreLabel = SKLabelNode()
  var scoreTextLabel = SKLabelNode()
  var score = 0
  var scoreLabel = SKLabelNode()
  
  enum NodesZPosition: CGFloat {
    case background = 0, label = 1, button = 2
  }
  
  enum RBButtonType: String {
    case MainMenu
    case Replay
    case Share
  }
  
  override func didMove(to view: SKView) {
    self.anchorPoint = CGPoint.zero

    background.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    background.position = CGPoint(x: self.frame.width * 0.5, y: self.frame.height * 0.5)
    //background.setScale(0.5)
    background.zPosition = NodesZPosition.background.rawValue
    background.size = CGSize(width: self.frame.width, height: self.frame.height)
    self.addChild(background)
  
    mainMenuButton = RBButton(buttonImage: "MiniButtonHome", title: "", buttonAction: {
      self.didTap(button: .MainMenu)
    })
    mainMenuButton.setScale(0.5)
    mainMenuButton.position = CGPoint(x: self.frame.width * 0.5, y: self.frame.height * 0.15)
    mainMenuButton.zPosition = NodesZPosition.button.rawValue
    self.addChild(mainMenuButton)
    
    replayButton = RBButton(buttonImage: "MiniButtonReplay", title: "", buttonAction: {
      self.didTap(button: .Replay)
    })
    replayButton.setScale(0.5)
    replayButton.position = CGPoint(x: self.frame.width * 0.3, y: self.frame.height * 0.3)
    replayButton.zPosition = NodesZPosition.button.rawValue
    self.addChild(replayButton)
    
    shareButton = RBButton(buttonImage: "MiniButtonShare", title: "", buttonAction: {
      self.didTap(button: .Share)
    })
    shareButton.setScale(0.5)
    shareButton.position = CGPoint(x: self.frame.width * 0.7, y: self.frame.height * 0.3)
    shareButton.zPosition = NodesZPosition.button.rawValue
    self.addChild(shareButton)
    
    bestScoreTextLabel.position = CGPoint(x: self.frame.width * 0.6, y: self.frame.height * 0.8)
    bestScoreTextLabel.fontName = FontName
    bestScoreTextLabel.fontSize = CGFloat(FontSize)
    bestScoreTextLabel.fontColor = FontColorScore
    bestScoreTextLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.right
    bestScoreTextLabel.verticalAlignmentMode = SKLabelVerticalAlignmentMode.center
    bestScoreTextLabel.text = "Best Score :"
    bestScoreTextLabel.zPosition = NodesZPosition.label.rawValue
    self.addChild(bestScoreTextLabel)
    
    bestScore = PlayerStats.shared.getCurrentValue(.BestScore)
    
    bestScoreLabel.position = CGPoint(x: self.frame.width * 0.6 + 10, y: self.frame.height * 0.8)
    bestScoreLabel.fontName = FontName
    bestScoreLabel.fontSize = CGFloat(FontSize)
    bestScoreLabel.fontColor = FontColorScore
    bestScoreLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
    bestScoreLabel.verticalAlignmentMode = SKLabelVerticalAlignmentMode.center
    bestScoreLabel.text = "\(bestScore)"
    bestScoreLabel.zPosition = NodesZPosition.label.rawValue
    self.addChild(bestScoreLabel)
    
    scoreTextLabel.position = CGPoint(x: self.frame.width * 0.5, y: self.frame.height * 0.65)
    scoreTextLabel.fontName = FontName
    scoreTextLabel.fontSize = CGFloat(FontSize) * 3
    scoreTextLabel.fontColor = FontColorScore
    scoreTextLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
    scoreTextLabel.verticalAlignmentMode = SKLabelVerticalAlignmentMode.center
    scoreTextLabel.text = "Score"
    scoreTextLabel.zPosition = NodesZPosition.label.rawValue
    self.addChild(scoreTextLabel)
    
    score = PlayerStats.shared.getCurrentValue(.CurrentScore)
    
    scoreLabel.position = CGPoint(x: self.frame.width * 0.5, y: self.frame.height * 0.5)
    scoreLabel.fontName = FontName
    scoreLabel.fontSize = CGFloat(FontSize) * 6
    scoreLabel.fontColor = FontColorScore
    scoreLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
    scoreLabel.verticalAlignmentMode = SKLabelVerticalAlignmentMode.center
    scoreLabel.text = "\(score)"
    scoreLabel.zPosition = NodesZPosition.label.rawValue
    self.addChild(scoreLabel)
    
  }
  
  func didTap(button: RBButtonType) {
    switch button {
    case .MainMenu:
      mainMenuButtonTapped()
    case .Replay:
      replayButtonTapped()
    case .Share:
      shareButtonTapped()
    default:
      print("Ooops, no such button type.")
    }
  }

  
  func mainMenuButtonTapped() {
    
    let scene = MainMenu(fileNamed: "MainMenu")
    let transition = SKTransition.moveIn(with: SKTransitionDirection.up, duration: 0.5)
    //let skView = self.view as SKView!
    scene?.scaleMode = .fill
    self.view?.presentScene(scene!, transition: transition)
    
  }
  
  func replayButtonTapped() {
    
  }
  
  func shareButtonTapped() {
    
  }
  
}
