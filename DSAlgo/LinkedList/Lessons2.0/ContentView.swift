//
//  ContentView.swift
//  Lessons2.0
//
//  Created by Babul Raj on 23/03/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var ll: LinkedListObservable
    @ObservedObject var heap: Heap
   
    var body: some View {
        VStack {
            Text(ll.linkedList?.description ?? "")
                .padding()
           // Text(heap.description)
              //  .padding()
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(ll: LinkedListObservable(), heap: Heap())
    }
}
