//
//  NavigationBar.swift
//  qlick
//
//  Created by Brian Mwangi on 08/07/2022.
//

import SwiftUI

struct NavigationBar: View {
    var title: String = ""
    @Binding var hasScrolled: Bool
    
    var body: some View {
        ZStack {
            Color.clear
                .background(.ultraThinMaterial)
                .blur(radius: 10)
                .opacity(hasScrolled ? 0 : 1)
            
            Text(title)
                .animatableFont(size: hasScrolled ? 22: 34, weight: .bold)
                .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 20)
            .padding(.top, 20)
            
            HStack {
                Image(systemName: "magnifyingglass")
                    .font(.body.bold())
                    .frame(width: 36, height: 36)
                    .foregroundColor(.secondary)
                    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 14, style: .continuous))
                .strokeStyle(cornerRadius: 14)
                
                Image("Avatar Default")
                    .resizable()
                    .frame(width: 26, height: 26)
                    .cornerRadius(10)
                    .padding(8)
                    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 18, style: .continuous))
                    .strokeStyle(cornerRadius: 18)
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
            .padding(.trailing, 20)
            .padding(.top, 20)
            .offset(y: hasScrolled ? -4 : 0)
        }
        .frame(height: hasScrolled ? 44 : 70)
            .frame(maxHeight: .infinity, alignment: .top)
    }
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar(title: "Featured", hasScrolled: .constant(false))
    }
}
