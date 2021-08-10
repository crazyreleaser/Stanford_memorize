//
//  ContentView.swift
//  Stanford_memorize
//
//  Created by admin on 06.08.2021.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["🚗","🚕","🚙","🚌","🚎","🏎","🚓","🚑","🚒","🚐","🛻","🚚","🚛","🚜","🛵","🚲","🛴","🏍","🛺","🚔","🚍","🚘","🚃","🚠","🚡","🚖","🚅","✈️","🛫","🛬","🛰","🚀","🛸","🚁","🛩","🛶","⛵️","🚤","🛥","🛳","⛴","🚢"]
    @State var emojiCount = 8
    
    var body: some View {
        VStack{
            ScrollView{
                LazyVGrid(columns: [GridItem(),GridItem(), GridItem()]) {
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji).aspectRatio(3/4,contentMode: .fill)
                    }
                }
            }
            .foregroundColor(.purple)
            Spacer()
            HStack{
                removeCard
                Spacer()
                addCard
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        .padding(.horizontal)
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
            if emojiCount < emojis.count {
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
            let shape = RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.stroke(lineWidth: 4)
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


