//
//  TrailingRowDropDelegate.swift
//  StringDnD3
//
//  Created by Eric Kampman on 10/5/24.
//

import SwiftUI

struct TrailingRowDropDelegate: DropDelegate {
	@Binding var leadingStrings: [String]
	@Binding var trailingStrings: [String]
	@Binding var highlight: Bool
	@Binding var draggedItem: String?
	let id = UUID()
	
	func performDrop(info: DropInfo) -> Bool {
		print("TrailingRowDropDelegate \(id.description) performDrop")
		
		if let draggedItem {
			if let leadingIndex = leadingStrings.firstIndex(of: draggedItem) {
				trailingStrings.append(draggedItem)
				leadingStrings.remove(at: leadingIndex)
			}
			else if let trailingIndex = trailingStrings.firstIndex(of: draggedItem) {
				trailingStrings.remove(at: trailingIndex)
				trailingStrings.append(draggedItem)
			}
		}
		highlight = false
		return true
	}
	
	func dropEntered(info: DropInfo) {
		print("TrailingRowDropDelegate \(id.description) dropEntered")
		highlight = true

		let provider = info.itemProviders(for: [.text])
		guard let draggedItem = provider.first else {
			return
		}
		let progress = draggedItem.loadObject(ofClass: String.self) { str, err in
			guard let str else { return }
			self.draggedItem = str
			
			print("TrailingRowDropDelegate draggedItem: \(String(describing: self.draggedItem))")
		}
	}

}
