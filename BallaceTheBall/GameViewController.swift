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
import GoogleMobileAds

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

  @IBOutlet weak var bannerView: GADBannerView!
  
    override func viewDidLoad() {
      
      NotificationCenter.default.addObserver(forName: NSNotification.Name.mkStoreKitProductPurchased,
                                             object: nil, queue: OperationQueue.main) { (note) -> Void in
                                              print ("Purchased product: \(note.object)")
                                              
                                              switch note.object as! String {
                                              
                                              case InAppPurchaseID:
                                                self.hideAdMobBanner()
                                                
                                              default:
                                                print("Ooops, no such collectable candy!")
                                              }
                                              
                                              
                                              
      }
      
      NotificationCenter.default.addObserver(forName: NSNotification.Name.mkStoreKitDownloadCompleted,
                                             object: nil, queue: OperationQueue.main) { (note) -> Void in
                                              print ("Downloaded product: \((note as NSNotification).userInfo)")
      }
      
      NotificationCenter.default.addObserver(forName: NSNotification.Name.mkStoreKitDownloadProgress,
                                             object: nil, queue: OperationQueue.main) { (note) -> Void in
                                              print ("Downloading product: \((note as NSNotification).userInfo)")
      }
      
      NotificationCenter.default.addObserver(forName: NSNotification.Name.mkStoreKitRestoredPurchases,
                                             object: nil, queue: OperationQueue.main) { (note) -> Void in
                                              print ("Restored Purchases.")
                                              self.showRestoredPurchasesAlert()
                                              
      }
      
      NotificationCenter.default.addObserver(forName: NSNotification.Name.mkStoreKitRestoringPurchasesFailed,
                                             object: nil, queue: OperationQueue.main) { (note) -> Void in
                                              print ("Failed restoring purchases with error: \((note as NSNotification).userInfo)")
                                              self.showRestorePurchasesFailedAlert()
      }
      
      
      
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
          var mainMenuName = "MainMenu"
          if useLevelSystem {
            mainMenuName = "MainMenuLevels"
          }
            if let scene = SKScene(fileNamed: mainMenuName) {
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
        //backgroundMusic?.play()
    }
      
      if !MKStoreKit.shared().isProductPurchased(InAppPurchaseID) {
        print("Google Mobile Ads SDK version: " + GADRequest.sdkVersion())
        bannerView.alpha = 1.0
        bannerView.adUnitID = adMobUnitID
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
      } else {
        print("Not showing ads because the 'No Ads' IAP has been purchased.")
      }
      
      
  }
  
  func showRestoredPurchasesAlert() {
    let alertController = UIAlertController(title: "Success", message: "Your purchases have been restored.", preferredStyle: .alert)
    
    
    let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
      
    }
    alertController.addAction(OKAction)
    
    self.present(alertController, animated: true) {
    }
    
  }
  
  func showRestorePurchasesFailedAlert() {
    let alertController = UIAlertController(title: "Sorry", message: "Your purchases could not be restored. Try again later.", preferredStyle: .alert)
    
    
    let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
      
    }
    alertController.addAction(OKAction)
    
    self.present(alertController, animated: true) {
    }
  }
  
  func hideAdMobBanner() {
    if MKStoreKit.shared().isProductPurchased(InAppPurchaseID) {
      print("Hiding AdMob banner . . .")
      bannerView.isHidden = true
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
