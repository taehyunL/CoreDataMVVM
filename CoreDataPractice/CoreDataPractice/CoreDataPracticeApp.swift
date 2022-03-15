//
//  CoreDataPracticeApp.swift
//  CoreDataPractice
//
//  Created by 이태현 on 2022/03/15.
//

import SwiftUI

@main
struct CoreDataPracticeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(coreDM: CoreDataManager())
        }
    }
}
