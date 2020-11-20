//
//  DetailView.swift
//  ShoppingItems
//
//  Created by Marc Harvey on 11/11/2020.
//  Copyright © 2020 Marc Harvey. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    
    enum DetailViewImages: String {
        case appIconNavBar = "appHeader"
    }
    
    //MARK: - Properties
    @Environment(\.managedObjectContext) var managedObjectContext
    @Environment(\.presentationMode) var presentationMode
    let itemToBeDisplayed: ShoppingItems
    @State private var hasData = false
    
    //MARK: - Body of the view
    var body: some View {
        NavigationView {
            ZStack{
                Color.init(red: 0.07, green: 0.45, blue: 0.87)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                Text("\(itemToBeDisplayed.notesOnItem)")
                    .foregroundColor(.white)
                    .font(.custom("Raleway", size: 25, relativeTo: .headline))
                    .padding(.leading, 20)
                    .padding(.trailing, 20)
                    .padding(.top, 20)
                    .padding(.bottom, 20)
                    .allowsTightening(true)
                }
            }
        }
        .navigationBarTitle("\(itemToBeDisplayed.itemToBeAdded)")
        .font(.custom("Open Sans", size: 30, relativeTo: .body))
        .navigationBarTitleDisplayMode(.inline)
        .allowsTightening(true)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        Text("Henlo")
    }
}
