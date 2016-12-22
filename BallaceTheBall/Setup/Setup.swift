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

//------- App ID -------//

let appID = "1180198006"

//------- Rate Popup -------//

let rateAlertTitle = "Rate the app"
let rateAlertMessagePart1 = "If you found"

// IMPORTANT: Next comes the name of the App that will be fetched by code from the Info.plist file; please go and set it up at the 'Bundle Display Name' now!!!

let rateAlertMessagePart2 = "useful, please take a moment to rate it"
let rateAlertOKTitle = "Rate it now"
let rateAlertCancelTitle = "Don't bother me again"
let rateAlertRemindLaterTitle = "Remind me later"
let rateAlertPromptAfterDays = 1.0 // Ex. '1.5' means one and a half days
let rateAlertPromptAfterUses = 3
let rateAlertDaysBeforeReminding = 1.0


// set up time for when the level system is disabled
let timeForGameWithoutTheLevelSystem = 59

//////////////////
// LEVEL SYSTEM //
//////////////////

// Make sure you have 'enableLevelSystem' set to 'YES' in the 'EnableDisableLevelSystem.h' file to be able to use the level system
// If you do not wish to use the level system than set 'enableLevelSystem' to 'NO' and you may safely disregard the following (you don't have to set it up)

// Set up the goals
let goalForLevel0001 = 5
let goalForLevel0002 = 7
let goalForLevel0003 = 10
let goalForLevel0004 = 13
let goalForLevel0005 = 15
let goalForLevel0006 = 17
let goalForLevel0007 = 20
let goalForLevel0008 = 25
let goalForLevel0009 = 30
let goalForLevel0010 = 35
let goalForLevel0011 = 40
let goalForLevel0012 = 45
let goalForLevel0013 = 50
let goalForLevel0014 = 55
let goalForLevel0015 = 60
let goalForLevel0016 = 65
let goalForLevel0017 = 70
let goalForLevel0018 = 75
let goalForLevel0019 = 80
let goalForLevel0020 = 85
let goalForLevel0021 = 90
let goalForLevel0022 = 95
let goalForLevel0023 = 100
let goalForLevel0024 = 105
let goalForLevel0025 = 110
let goalForLevel0026 = 115
let goalForLevel0027 = 120
let goalForLevel0028 = 125
let goalForLevel0029 = 130
let goalForLevel0030 = 135
let goalForLevel0031 = 140
let goalForLevel0032 = 145
let goalForLevel0033 = 150

// Set up times
//
// - needs to be set in seconds
// - needs to be higher than 45
let timeForLevel0001 = 45
let timeForLevel0002 = 55
let timeForLevel0003 = 65
let timeForLevel0004 = 75
let timeForLevel0005 = 85
let timeForLevel0006 = 95
let timeForLevel0007 = 105
let timeForLevel0008 = 125
let timeForLevel0009 = 145
let timeForLevel0010 = 170
let timeForLevel0011 = 200
let timeForLevel0012 = 240
let timeForLevel0013 = 250
let timeForLevel0014 = 260
let timeForLevel0015 = 275
let timeForLevel0016 = 310
let timeForLevel0017 = 350
let timeForLevel0018 = 370
let timeForLevel0019 = 400
let timeForLevel0020 = 420
let timeForLevel0021 = 460
let timeForLevel0022 = 480
let timeForLevel0023 = 500
let timeForLevel0024 = 510
let timeForLevel0025 = 520
let timeForLevel0026 = 530
let timeForLevel0027 = 540
let timeForLevel0028 = 550
let timeForLevel0029 = 560
let timeForLevel0030 = 570
let timeForLevel0031 = 580
let timeForLevel0032 = 590
let timeForLevel0033 = 600
