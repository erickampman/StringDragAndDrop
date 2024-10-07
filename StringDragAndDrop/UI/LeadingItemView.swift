//
//  LeadingItemView.swift
//  StringDnD3
//
//  Created by Eric Kampman on 10/5/24.
//

import SwiftUI
import UniformTypeIdentifiers

struct LeadingItemView: View {
	let item: String
//	@State var dropDelegate = LeadingItemDropDelegate?.none
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
				delegate: LeadingItemDropDelegate(item: item,
												   leadingStrings: $leadingStrings,
												   trailingStrings: $trailingStrings,
												   draggedItem: $draggedItem,
												   highlight: $highlight))

    }
}

//#Preview {
//    LeadingItemView()
//}
