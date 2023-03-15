//
//  AccountView.swift
//  qlick
//
//  Created by Brian Mwangi on 30/06/2022.
//

import SwiftUI

struct AccountView: View {
    @State var isDeleted = false
    @State var isPinned = false
    
    var body: some View {
        NavigationView {
            List {
                profile
                
                menu
                
                links
            }
            .listStyle(.automatic)
            .navigationTitle("Account")
        }
    }
    
    var profile: some View {
        VStack(spacing: 8) {
            Image(systemName: "person")
                .symbolVariant(.circle.fill)
                .font(.system(size: 32))
                .symbolRenderingMode(.palette)
                .foregroundStyle(.blue, .blue.opacity(0.4))
                .padding()
                .background(Circle().fill(.ultraThinMaterial))
                .background(
                    HexagonView()
                    .offset(x: -50, y: -100))
                .background(
                    BlobView()
                        .offset(x: 200, y: 0)
                        .scaleEffect(0.6)
                )
            
            Text("Brian")
                .font(.title.weight(.semibold))
            
            HStack {
                Image(systemName: "location")
                    .imageScale(.large)
                
                Text("Nairobi")
                    .foregroundColor(.secondary)
                
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
    }
    
    var menu: some View {
        Section {
            NavigationLink {
                Text("Settings")
            } label: {
                Label("Settings", systemImage: "gear")
            }
            NavigationLink {
                Text("Billing")
            } label: {
                Label("Billing", systemImage: "creditcard")
            }
            NavigationLink {
                Text("Help")
            } label: {
                Label("Help", systemImage: "questionmark")
            }
            
        }
        .accentColor(.secondary)
        .listRowSeparatorTint(.blue)
        .listRowSeparator(.hidden)
    }
    
    var links : some View {
        Section {
            if !isDeleted {
                Link(destination: URL(string: "https://apple.com")!) {
                    HStack {
                        Label("Home", systemImage: "house")
                        Spacer()
                        Image(systemName: "link")
                            .foregroundColor(.secondary)
                    }
                }
                .swipeActions(edge: .leading, allowsFullSwipe: true) {
                    Button(action: { isDeleted = true }) {
                        Label("Delete", systemImage: "trash")
                    }
                    .tint(.red)
                    pinButton
                }
                
            }
                
           
                Link(destination: URL(string: "https://youtube.com")!) {
                    HStack {
                        Label("Youtube", systemImage: "tv")
                        Spacer()
                        Image(systemName: "link")
                            .foregroundColor(.secondary)
                    }
                }
                .swipeActions {
                    pinButton
                }
                
            
        }
        .accentColor(.primary)
        .listRowSeparator(.hidden)
    }
    
    var pinButton : some View {
        Button {
            isPinned.toggle()
        } label: {
            if !isPinned  {
                Label("UnPin", systemImage: "pin.slash")
            } else {
                Label("Pin", systemImage: "pin")
            }
        }
        .tint(isPinned ? .blue : .gray)
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AccountView()
                .preferredColorScheme(.light)
            .previewDevice("iPhone 13")
            AccountView()
                .preferredColorScheme(.dark)
                .previewDevice("iPhone 13")
        }
    }
}
