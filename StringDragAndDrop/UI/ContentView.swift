//
//  ContentView.swift
//  StringDnD3
//
//  Created by Eric Kampman on 9/29/24.
//

import SwiftUI

struct ContentView: View {
	@State private var leadingStrings = String.leadingStrings
	@State private var trailingStrings = String.trailingStrings
	
    var body: some View {
		NavigationSplitView {
			LeadingListContainerView(leadingStrings: $leadingStrings, trailingStrings: $trailingStrings)
		} detail: {
			TrailingGridView(leadingStrings: $leadingStrings, trailingStrings: $trailingStrings)
		}
    }
}

#Preview {
    ContentView()
}
