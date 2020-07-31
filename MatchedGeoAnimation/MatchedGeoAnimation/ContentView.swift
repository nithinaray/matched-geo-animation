//
//  ContentView.swift
//  MatchedGeoAnimation
//
//  Created by Nithi on 7/31/20.
//

import SwiftUI

struct ContentView: View {
    private let colors: [Color] = [Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)), Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)), Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)), Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)), Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))]
    @Namespace private var animation
    @State private var ascending: Bool = true

    var body: some View {
        VStack {
            Button(action: { withAnimation(Animation.linear(duration: 1.0)) {
                    ascending.toggle()
                }
            }) {
                Image(systemName: "arrow.up.arrow.down.circle.fill")
                    .font(.system(size: 36, weight: .semibold, design: .default))
                    .foregroundColor(.black)
            }
            .padding()

            if ascending {
                ForEach((0..<5), id: \.self) { i in
                    RoundedRectangle(cornerRadius: 10.0, style: .continuous)
                        .fill(colors[i])
                        .frame(maxWidth: .infinity)
                        .matchedGeometryEffect(id: "\(i)", in: animation)
                        .padding(.bottom)
                }
            } else {
                ForEach((0..<5).reversed(), id: \.self) { i in
                    RoundedRectangle(cornerRadius: 10.0, style: .continuous)
                        .fill(colors[i])
                        .frame(maxWidth: .infinity)
                        .matchedGeometryEffect(id: "\(i)", in: animation)
                        .padding(.bottom)
                }

            }
        }
        .padding(.horizontal)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
