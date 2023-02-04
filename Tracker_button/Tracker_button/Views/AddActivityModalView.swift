//
//  AddActivityModalView.swift
//  Tracker_button
//
//  Created by Ariuna Banzarkhanova on 14/12/22.
//

import SwiftUI

struct AddActivityModalView: View {
    
    var userActivities = ["figure.run", "cart", "pawprint.fill", "party.popper", "bicycle", "film.fill", "bubble.left.and.bubble.right.fill", "theatermasks.fill"]
    
    let col = [
        GridItem(.fixed(90)),
        GridItem(.fixed(90)),
        GridItem(.fixed(90)),
        GridItem(.fixed(90))
    ]
    
    var body: some View {
        VStack(alignment: .center) {
            Text("Choose your activity?")
                .font(.largeTitle)
                .fontWeight(.bold)
            
//          Activity icons aligned Vertially
            HStack {
                LazyVGrid(columns: col, alignment: .center, spacing: 15) {
                    ForEach (userActivities, id: \.self) { activity in Image(systemName: activity)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
                            .foregroundColor(.white)
                            .padding(.vertical, 20)
                            .background(
                                Circle()
                                    .frame(width: 63.0, height: 63.0)
                                    .foregroundColor(.pink)
                            )
                    }
                }
                .padding(.top, 30)
                .padding(.bottom, 40)
            }
            Button {
                
            } label:{
                Text("Search")
                    .frame(width: 200, height: 50)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.white)
                    .background(
                        RoundedRectangle(cornerRadius: 30)
                            .foregroundColor(.mint)
                    )
            }
        }
    }
}

struct AddActivityModalView_Previews: PreviewProvider {
    static var previews: some View {
        AddActivityModalView()
    }
}
