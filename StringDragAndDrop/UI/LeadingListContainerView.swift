//
//  LeadingListContainerView.swift
//  StringDnD3
//
//  Created by Eric Kampman on 10/5/24.
//

import SwiftUI
import UniformTypeIdentifiers

struct LeadingListContainerView: View {
	@Binding var leadingStrings: [String]
	@Binding var trailingStrings: [String]
	@State var draggedItem: String?
	@State var highlight: Bool = false
	@State var showAddSheet = false

	var body: some View {
		VStack {
			Button(action: { showAddSheet.toggle() }) {
				Text("Add")
			}
			.keyboardShortcut(.defaultAction)
			List {
				ForEach(leadingStrings, id: \.self) { string in
					LeadingItemView(item: string, leadingStrings: $leadingStrings, trailingStrings: $trailingStrings)
						.draggable(string)
						.border(Color.blue, width: 4)
				}
				Spacer()
			}
			.background(.white)
//			.background(highlight ? .white : unhighlightedColor) // doesn't quite work well...
			.onDrop(of: [UTType.text],
					delegate: LeadingContainerDropDelegate(leadingStrings: $leadingStrings, trailingStrings: $trailingStrings, highlight: $highlight, draggedItem: $draggedItem))
			.sheet(isPresented: $showAddSheet) {
				AddStringView(leadingStrings: $leadingStrings)
			}
		}
	}
}

//#Preview {
//    LeadingListContainerView()
//}
