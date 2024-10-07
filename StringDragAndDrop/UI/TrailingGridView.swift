//
//  TrailingGridView.swift
//  StringDnD3
//
//  Created by Eric Kampman on 9/29/24.
//

import SwiftUI
import UniformTypeIdentifiers

struct TrailingGridView: View {
	@Binding var leadingStrings: [String]
	@Binding var trailingStrings: [String]

    var body: some View {
		ScrollView {
			Grid(horizontalSpacing: 0, verticalSpacing: 0) {
				TrailingGridRowView(leadingStrings: $leadingStrings, trailingStrings: $trailingStrings)
			}
			.border(Color.green, width: 2)
		}
    }
	
}

#Preview {
	@Previewable @State var leadingStrings = [String]()
	@Previewable @State var trailingStrings = [String]()

	TrailingGridView(leadingStrings: $leadingStrings, trailingStrings: $trailingStrings)
}
