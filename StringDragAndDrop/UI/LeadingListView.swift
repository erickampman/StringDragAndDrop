//
//  ListView.swift
//  StringDnD3
//
//  Created by Eric Kampman on 9/29/24.
//

import SwiftUI

struct LeadingListView: View {
	@Binding var leadingStrings: [String]
	@Binding var trailingStrings: [String]
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
			}
			.border(.blue)
		}
		.sheet(isPresented: $showAddSheet) {
			AddStringView(leadingStrings: $leadingStrings)
		}
    }
}

#Preview {
	@Previewable @State var leadingStrings = [String]()
	@Previewable @State var trailingStrings = [String]()

	return LeadingListView(leadingStrings: $leadingStrings, trailingStrings: $trailingStrings, showAddSheet: true)
}
