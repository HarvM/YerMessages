//
//  DetailView.swift
//  ShoppingItems
//
//  Created by Marc Harvey on 11/11/2020.
//  Copyright © 2020 Marc Harvey. All rights reserved.
//

import SwiftUI
import SpriteKit

struct DetailView: View {
    
    ///The Futura font 
    enum CustomFont: String {
        case futuraFont = "Futura"
    }
    
    //MARK: - Properties
    @Environment(\.managedObjectContext) var managedObjectContext
    @Environment(\.presentationMode) var presentationMode
    let itemToBeDisplayed: ShoppingItems
    @State private var hasData = false
    @State private var displayGame = false
    
    ///Setting up the GameScene
    var scene: SKScene {
        let scene = GameScene()
        scene.size = CGSize(width: 100, height: 100)
        scene.scaleMode = .fill
        
        return scene
    }
    
    //MARK: - Body of the view
    var body: some View {
        NavigationView {
            ZStack{
                Color("defaultBackground")
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Section {
                    Text ("\(itemToBeDisplayed.itemToBeAdded)")
                        .font(.custom(CustomFont.futuraFont.rawValue, size: 35, relativeTo: .headline))
                        .lineLimit(3)
                        .foregroundColor(.yellow)
                    }
                    .frame(minWidth: 200, idealWidth: 350, maxWidth: 400, minHeight: 80, idealHeight: 100, maxHeight: 120, alignment: .top)
                    Section {
                    Text("\(itemToBeDisplayed.notesOnItem)")
                        .foregroundColor(.white)
                        .font(.custom(CustomFont.futuraFont.rawValue, size: 25, relativeTo: .headline))
                    }
                    .frame(minWidth: 200, idealWidth: 350, maxWidth: 400, minHeight: 400, idealHeight: 700, maxHeight: 800, alignment: .center)
                }
                .multilineTextAlignment(.center)
                .allowsTightening(true)
                .minimumScaleFactor(0.9)
                .padding(.top, 20)
                .onAppear(perform: startFidgetGame)
            }
        }
    }
    private func startFidgetGame() {
        if itemToBeDisplayed.notesOnItem == "" {
           ///Display the game
            SpriteView(scene: scene)
                .frame(width: 100, height: 100, alignment: .center)
                .edgesIgnoringSafeArea(.all)
            print("Trying to display the game")
        } else {
            ///Do nothing
            print("Keeping it normal")
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        Text("Henlo")
    }
}
