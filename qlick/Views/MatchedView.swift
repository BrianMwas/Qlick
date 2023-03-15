//
//  MatchedView.swift
//  qlick
//
//  Created by Brian Mwangi on 08/07/2022.
//

import SwiftUI

struct MatchedView: View {
    @Namespace var namespace
    @State var show: Bool = false
    
    var body: some View {
        ZStack {
            if !show {
                
            } else  {
                
            }
        }
        .onTapGesture {
            withAnimation(.spring(response: 0.6, dampingFraction: 0.7)) {
                show.toggle()
            }
        }
    }
}

struct MatchedView_Previews: PreviewProvider {
    static var previews: some View {
        MatchedView()
    }
}
