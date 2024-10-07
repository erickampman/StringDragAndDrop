//
//  TrailingItemView.swift
//  StringDnD3
//
//  Created by Eric Kampman on 10/5/24.
//

import SwiftUI
import UniformTypeIdentifiers

struct TrailingItemView: View {
	let item: String
	@State var draggedItem: String?
	@Binding var leadingStrings: [String]
	@Binding var trailingStrings: [String]
	@State var highlight: Bool = false

	var body: some View {
		HStack {
			Text(item)
		}
		.frame(width: 100, height: 40)
		.background(highlight ? .white : .gray)
		.onDrop(of: [UTType.text],
				delegate: TrailingItemDropDelegate(item: item,
												   leadingStrings: $leadingStrings,
												   trailingStrings: $trailingStrings,
												   draggedItem: $draggedItem,
												   highlight: $highlight))
	}
}

//#Preview {
////	@Previewable @State var dropDelegate = TrailingItemDropDelegate(item: "foobar")
//	
//	TrailingItemView(item: "foobar", constant([String]))
//}
