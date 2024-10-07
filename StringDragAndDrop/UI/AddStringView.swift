//
//  AddStringView.swift
//  StringDragAndDrop
//
//  Created by Eric Kampman on 9/18/24.
//

import SwiftUI

struct AddStringView: View {
	@Binding var leadingStrings: [String]
	@Environment(\.dismiss) var dismiss
	@State private var text = ""
	
    var body: some View {
		Form {
			TextField("Text", text: $text)
			HStack {
				Spacer()
				Button("Add (to leading list)") {
					leadingStrings.append(text)
					dismiss()
				}
				.buttonStyle(.borderless)
				.disabled(text.isEmpty)
				.keyboardShortcut(.defaultAction)
				
				Button("Cancel") {
					dismiss()
				}
				.buttonStyle(.borderless)
				.keyboardShortcut(.cancelAction)
				Spacer()
			}
		}
		.padding()
    }
}

//#Preview {
//    AddStringView()
//		.environment(StringManager())
//
//}
