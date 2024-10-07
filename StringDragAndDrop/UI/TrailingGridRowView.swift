//
//  TrailingGridRowView.swift
//  StringDnD3
//
//  Created by Eric Kampman on 10/5/24.
//

import SwiftUI
import UniformTypeIdentifiers

struct TrailingGridRowView: View {
	@State var dropDelegate = TrailingRowDropDelegate?.none
	@State var draggedItem: String?
	@Binding var leadingStrings: [String]
	@Binding var trailingStrings: [String]
	@State var highlight: Bool = false

    var body: some View {
		GridRow {
			ForEach(trailingStrings, id: \.self) { string in
				TrailingItemView(item: string, leadingStrings: $leadingStrings, trailingStrings: $trailingStrings)
					.draggable(string)
					.border(Color.blue, width: 4)
			}
			Spacer()
		}
		.background(highlight ? .white : .gray)
		.onDrop(of: [UTType.text],
				delegate: TrailingRowDropDelegate(leadingStrings: $leadingStrings, trailingStrings: $trailingStrings, highlight: $highlight, draggedItem: $draggedItem))
    }
}

//#Preview {
////	@Previewable @State var leadingStrings = [String]()
//	@Previewable @State var trailingStrings = [String]()
//	TrailingGridRowView(trailingStrings: $trailingStrings)
//}
