//
//  Course.swift
//  qlick
//
//  Created by Brian Mwangi on 08/07/2022.
//

import SwiftUI

struct Course: Identifiable {
    let id = UUID()
    var title: String
    var subtitle: String
    var text: String
    var image: String
    var background: String
    var logo: String
}

var featuredCourses = [
    Course(title: "Swift UI for IOS 14", subtitle: "20 Sections - 3hrs", text: "Build an IOS app with custom animations and layouts in less than 3 hours", image: "Illustration 5", background: "Background 5", logo: "Logo 2"),
    Course(title: "UI Design for IOS 15", subtitle: "20 Sections 3 hours", text: "Design an IOS app wth custom animations and transitions in less than  3 hours", image: "Illustration 3", background: "Background 4", logo: "Logo 4"),
    Course(title: "Flutter for designers", subtitle: "20 Sections 3 Hours", text: "Flutter is a relatively new toolkit that makes building cross platform applications easy and fun to use", image: "Illustration 1", background: "Background 1", logo: "Logo 1"),
    Course(title: "React Hooks advanced", subtitle: "20 Sections 3 hours", text: "Learn how to build a website with typescript, hooks, CSS, Contentful and Gatsby Cloud", image: "Illustration 2", background: "Background 2", logo: "Logo 3")
]


var courses = [
    Course(title: "Swift UI for IOS 14", subtitle: "20 Sections - 3hrs", text: "Build an IOS app with custom animations and layouts in less than 3 hours", image: "Illustration 5", background: "Background 5", logo: "Logo 2"),
    Course(title: "UI Design for IOS 15", subtitle: "20 Sections 3 hours", text: "Design an IOS app wth custom animations and transitions in less than  3 hours", image: "Illustration 3", background: "Background 4", logo: "Logo 4"),
    Course(title: "Flutter for designers", subtitle: "20 Sections 3 Hours", text: "Flutter is a relatively new toolkit that makes building cross platform applications easy and fun to use", image: "Illustration 1", background: "Background 1", logo: "Logo 1"),
    Course(title: "React Hooks advanced", subtitle: "20 Sections 3 hours", text: "Learn how to build a website with typescript, hooks, CSS, Contentful and Gatsby Cloud", image: "Illustration 2", background: "Background 2", logo: "Logo 3")
]
