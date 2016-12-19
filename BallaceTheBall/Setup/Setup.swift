//
//  Setup.swift
//  BallaceTheBall
//
//  Created by Alpar on 11/12/2016.
//  Copyright © 2016 Alpar. All rights reserved.
//

import Foundation
import SpriteKit

//------- Enable Level System -------//

let useLevelSystem = true

//------- In-App Purchases -------//

// IMPORTANT: Remember to modify these in the MKStoreKitConfigs.plist file too!!!

let InAppPurchaseID = "com.Rebeloper.BallaceTheBall2.NoAds" // non-consumable with suggested price $0.99

//------- Log Fonts -------//

let logAllAvailableFonts = true

//------- Custom Font Name -------//
// To find out the actual name of your custom font:
// 1. Set 'logAllAvailableFonts' to 'true'
// 2. Run the app
// 3. Find the Font Name in the Log
// 4. Copy it here

let FontName = "KomikaDisplay"

// IMPORTANT: You will also need to add the font FILE NAME into your Info.plist file under 'Fonts provided by application'

//------- Custom Font Size -------//

let FontSize = 48

//------- Custom Font Color -------//

let FontColor = SKColor.white
let FontColorScore = SKColor.black

//------- Music & Sounds File Names -------//

let backgroundMusicName = "BackgroundMusic"
let backgroundMusicExtension = "mp3"
let hitSoundFile = "hit.wav"
let tapSoundFile = "tap.wav"

//------- AdMob Ad unit ID -------//

let adMobUnitID = "ca-app-pub-3940256099942544/2934735716"

//------- Chartboost IDs -------//

let chartboostAppID = "53a7ef5589b0bb6ae80f7e12"
let chartboostAppSignature = "449251e85cc254853b5097d6977d7b5cd47d7cd1"

let showMoreAppsButton = true

let showAdsOnMainMenu = true
let showAdsOnGameOver = true
