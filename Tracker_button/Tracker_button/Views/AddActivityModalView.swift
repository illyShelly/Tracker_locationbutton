//
//  AddActivityModalView.swift
//  Tracker_button
//
//  Created by Ariuna Banzarkhanova on 14/12/22.
//

import SwiftUI

struct AddActivityModalView: View {
    var userActivities = ["figure.run", "cart", "pawprint.fill", "party.popper", "bicycle", "film.fill", "bubble.left.and.bubble.right.fill", "building.columns.fill"]
    
    let rows = [
        GridItem(.fixed(90)),
        GridItem(.fixed(90))
    ]
    
    var body: some View {
        VStack(alignment: .center){
            Text("What to do?")
                .font(.largeTitle)
                .fontWeight(.bold)
            HStack {
                LazyHGrid(rows: rows, alignment: .center, spacing: 25){
                    ForEach (userActivities, id: \.self) { activity in Image(systemName: activity)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 40, height: 40)
                            .foregroundColor(.white)
                            .padding()
                            .background(
                                Circle()
                                    .frame(width: 70.0, height: 70.0)
                                    .foregroundColor(.pink)
                            )
                    }
                }
                .padding()
            }
            Button{
                
            } label:{
                Text("Done")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.black)
                    .background(
                        RoundedRectangle(cornerRadius: 40)
                            .frame(width: 100.0, height: 60.0)
                            .foregroundColor(.gray)
                        
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
