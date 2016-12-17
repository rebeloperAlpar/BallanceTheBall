//
//  GameViewController.swift
//  BallaceTheBall
//
//  Created by Alpar on 03/12/2016.
//  Copyright © 2016 Alpar. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit
import AVFoundation

class GameViewController: UIViewController {
  
  lazy var backgroundMusic: AVAudioPlayer? = {
    guard let url = Bundle.main.url(forResource: backgroundMusicName, withExtension: backgroundMusicExtension) else {
      return nil
  }
  do {
    let player = try AVAudioPlayer(contentsOf: url)
    player.numberOfLoops = -1
    return player
  } catch {
    return nil
  }
}()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameOver") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                // Present the scene
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
        }
    if PlayerStats.shared.getCurrentBoolValue(.Sound) {
        backgroundMusic?.play()
      }
    }


    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
  
}
