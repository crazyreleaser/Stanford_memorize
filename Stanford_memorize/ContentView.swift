//
//  ContentView.swift
//  Stanford_memorize
//
//  Created by admin on 06.08.2021.
//

import SwiftUI

struct ContentView: View {
    var emojisFruit = ["🍏","🍎","🍐","🍋","🍌","🍉","🍇","🍓","🫐","🍈","🍒","🍑","🥭","🍍","🥥","🥝","🍅","🍆","🥑","🥦","🥬","🥒","🌶"]
    var emojisSport = ["⚽️","🏀","🏈","🥎","🏉","🥏","🎱","🏓","🪃","🏒","🏹","🪁","🥊","🛼","🛹","🥋","🛷","⛸","⛷","🏂","🪂","🏄‍♂️","🚣‍♀️"]
    var emojisVehicles = ["🚗","🚕","🚙","🚌","🚎","🏎","🚓","🚑","🚒","🚐","🛻","🚚","🚛","🚜","🛵","🚲","🛴","🏍","🛺","🚔","🚍","🚘","🚃","🚠","🚡","🚖","🚅","✈️","🛫","🛬","🛰","🚀","🛸","🚁","🛩","🛶","⛵️","🚤","🛥","🛳","⛴","🚢"]
    
    @State var currentEmojis = ["🚗","🚕","🚙","🚌","🚎","🏎","🚓","🚑","🚒","🚐","🛻","🚚","🚛","🚜","🛵","🚲","🛴","🏍","🛺","🚔","🚍","🚘","🚃","🚠","🚡","🚖","🚅","✈️","🛫","🛬","🛰","🚀","🛸","🚁","🛩","🛶","⛵️","🚤","🛥","🛳","⛴","🚢"]
    @State var emojiCount = 4
    
    var body: some View {
        VStack{
            Text("Memorize!").font(.largeTitle)
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 70))]) {
                    ForEach(currentEmojis, id: \.self) { emoji in
                        CardView(content: emoji).aspectRatio(3/4,contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.purple)
            Spacer()
            HStack{
//                removeCard
                setFruits
                Spacer()
                setSports
                Spacer()
                setVehicles
//                Spacer()
//                addCard
            }
            .padding(.horizontal)
        }
        .padding(.horizontal)
    }
    
    var setFruits: some View {
        Button(action: {
            currentEmojis = emojisFruit
            currentEmojis.shuffle()
        }, label: {
            VStack{
                Image(systemName: "leaf").font(.largeTitle)
                Text("Fruits")
            }
        })
    }
    var setSports: some View {
        Button(action: {
            currentEmojis = emojisSport
            currentEmojis.shuffle()
        }, label: {
            VStack{
                Image(systemName: "sportscourt").font(.largeTitle)
                Text("Sports")
            }
        })
    }
    var setVehicles: some View {
        Button(action: {
            currentEmojis = emojisVehicles
            currentEmojis.shuffle()
        }, label: {
            VStack{
                Image(systemName: "car").font(.largeTitle)
                Text("Vehicles")
            }
        })
    }
    var removeCard: some View {
        Button(action: {
            if emojiCount > 1 {
                emojiCount -= 1
            }
        }, label: {
            Image(systemName: "minus.circle")
        })
    }
    var addCard: some View {
        Button(action: {
            if emojiCount < currentEmojis.count {
                emojiCount += 1
            }
        }, label: {
            VStack{
                Image(systemName: "plus.circle")
            }
        })
    }
}

struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 4)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
        ContentView()
            .preferredColorScheme(.dark)
    }
}


