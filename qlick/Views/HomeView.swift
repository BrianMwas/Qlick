//
//  HomeView.swift
//  qlick
//
//  Created by Brian Mwangi on 08/07/2022.
//

import SwiftUI

struct HomeView: View {
    @State var hasScroll = false
    @Namespace var namespace
    @State var show: Bool = false
    @State var showStatusBar = true
    @State var selectedID = UUID()
    @EnvironmentObject var model: Model
    
    var body: some View {
        ZStack {
            Color("background").ignoresSafeArea()
            
            ScrollView {
                scrollDetection
                
                featured
                
                Text("Courses".uppercased())
                    .font(.footnote.weight(.semibold))
                    .foregroundColor(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 20)
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 300), spacing: 20)]) {
                    if !show {
                        cards
                    } else {
                        ForEach(courses) { course in
                            Rectangle()
                                .fill(.white)
                                .frame(height: 200)
                                .cornerRadius(30)
                                .shadow(color: Color("shadow"), radius: 20, x: 0, y: 10)
                                .opacity(0.3)
                            .padding(.horizontal, 30)
                        }
                    }
                }
                .padding(.horizontal, 20)
            }
            .coordinateSpace(name: "scroll")
            .safeAreaInset(edge: .top, content: {
                Color.clear.frame(height: 70)
            })
            .overlay(
                NavigationBar(title: "Featured", hasScrolled: $hasScroll)
                    
            )
            
            if show {
                detail
            }
        }
        .statusBar(hidden: !showStatusBar)
        .onChange(of: show) { newValue in
            withAnimation(.closeCard) {
                if newValue {
                    showStatusBar = false
                } else {
                    showStatusBar = true
                }
            }
        }
    }
    
    var scrollDetection: some View {
         GeometryReader { proxy in
             Color.clear
                 .preference(key: ScrollPreferenceKey.self, value: proxy.frame(in: .named("scroll")).minY)
         }
         .frame(height: 0)
         .onPreferenceChange(ScrollPreferenceKey.self, perform: { value in
             withAnimation(.easeInOut) {
                 if value < 0 {
                     hasScroll = true
                 } else {
                     hasScroll = false
                 }
             }
         })
    }
    
    var featured: some View {
        TabView {
            ForEach(featuredCourses ) { item in
                GeometryReader { proxy in
                    let minX = proxy.frame(in: .global).minX
                    FeaturedItem(course: item)
                        .frame(maxWidth: 500)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 40)
                        .rotation3DEffect(.degrees(minX / -10), axis: (x: 0, y: 1, z: 0))
                        .shadow(color: Color("shadow").opacity(0.3), radius: 10, x: 0, y: 10)
                        .blur(radius: abs(minX / 40))
                        .overlay(
                            Image(item.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 230)
                                .offset(x: 32, y: -100)
                                .offset(x: minX / 3)
                            )
                }
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .frame(height: 430)
        .background(Image("Blob 1").offset(x: 250, y: -100))
    }
    
    var cards : some View {
        ForEach(courses) { course in
            CourseItem(namespace: namespace,
                       course: course,
                       show: $show)
                .onTapGesture {
                    withAnimation(.openCard) {
                        show.toggle()
                        model.showDetail.toggle()
                        showStatusBar = false
                        selectedID = course.id
                    }
            }
        }
    }
    
    var detail : some View  {
        ForEach(courses) { course in
            if course.id == selectedID {
                CourseView(namespace: namespace, course: course, show: $show)
                    .zIndex(1)
                    .transition(.asymmetric(insertion: .opacity.animation(.easeIn(duration: 0.2)), removal: .opacity.animation(.easeInOut(duration: 0.3).delay(0.3))))
            }
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeView()
                
            HomeView()
                .preferredColorScheme(.dark)
        }
        .environmentObject(Model())
    }
}
