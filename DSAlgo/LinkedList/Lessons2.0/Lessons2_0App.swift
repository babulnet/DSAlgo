//
//  Lessons2_0App.swift
//  Lessons2.0
//
//  Created by Babul Raj on 23/03/22.
//

import SwiftUI

@main
struct Lessons2_0App: App {
    var body: some Scene {
        WindowGroup {
            ContentView(ll: LinkedListObservable(), heap: Heap())
        }
    }
}
