//
//  KitchenApp.swift
//  Kitchen
//
//  Created by Daniel Leal PImenta on 24/04/25.
//

import SwiftUI
import TipKit

 @main
 struct KitchenApp: App {
     @StateObject private var favoritesManager = FavoritesManager()
     @StateObject var gameTimerManager = GameTimerManager()
     @StateObject var globalAppState = GlobalAppState()
     
     init(){
         let pageControl = UIPageControl.appearance()
         pageControl.currentPageIndicatorTintColor = UIColor.systemBlue
         pageControl.pageIndicatorTintColor = UIColor.systemGray3
         
         do {
             try Tips.configure([
                 .displayFrequency(.immediate),
                 .datastoreLocation(.applicationDefault)
             ])
         } catch {
             print("Erro ao configurar o TipKit: \(error.localizedDescription)")
         }
     }
     var body: some Scene {
         WindowGroup {
             SplashView().environmentObject(gameTimerManager).environmentObject(globalAppState).environmentObject(favoritesManager)

         }
     }
 }
 
