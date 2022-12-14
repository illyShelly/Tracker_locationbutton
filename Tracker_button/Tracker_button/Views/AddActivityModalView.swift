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
        VStack{
            Text("Select activity")
                .foregroundColor(Color("AppColor2"))
                .font(.largeTitle)
                .fontWeight(.semibold)
            ScrollView(.horizontal) {
                LazyHGrid(rows: rows, alignment: .center, spacing: 25){
                    ForEach (userActivities, id: \.self) { activity in Image(systemName: activity)
                            .resizable()
                            .frame(width: 45, height: 48)
                            .foregroundColor(.white)
                            .padding()
                            .background(
                                Circle()
                                    .frame(width: 85.0, height: 85.0)
                                    .foregroundColor(Color("AppColor"))
                            )
                    }
                }
                .padding()
            }
            Button{
                
            } label:{
                Text("Share Activity")
                    .foregroundColor(.white)
                    .font(.title)
                    .fontWeight(.semibold)
                    .background(
                    RoundedRectangle(cornerRadius: 60)
                        .foregroundColor(Color("AppColor2"))
                        .frame(width: 240, height: 50)
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
