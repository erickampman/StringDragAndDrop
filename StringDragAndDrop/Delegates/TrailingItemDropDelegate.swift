//
//  TrailingItemDropDelegate.swift
//  StringDnD3
//
//  Created by Eric Kampman on 10/5/24.
//

import SwiftUI

struct TrailingItemDropDelegate: DropDelegate {
	let item: String?
	@Binding var leadingStrings: [String]
	@Binding var trailingStrings: [String]
	@Binding var draggedItem: String?
	@Binding var highlight: Bool

//	let id = UUID()
	
	func performDrop(info: DropInfo) -> Bool {
		print("TrailingItemDropDelegate \(String(describing: item)) performDrop")
		
		let myIndex = trailingStrings.firstIndex(of: item!)
		
		if let draggedItem {
			if let leadingIndex = leadingStrings.firstIndex(of: draggedItem) {
				trailingStrings.insert(draggedItem, at: myIndex!)
				leadingStrings.remove(at: leadingIndex)
			}
			else if let trailingIndex = trailingStrings.firstIndex(of: draggedItem) {
				trailingStrings.remove(at: trailingIndex)
				var updatedIndex = myIndex!
				if myIndex! > trailingIndex {
					updatedIndex -= 1
				}
				trailingStrings.insert(draggedItem, at: updatedIndex)
			}
		}
		highlight = false
		return true
	}
	func dropExited(info: DropInfo) {
		highlight = false
	}
	
	func dropEntered(info: DropInfo) {
		print("TrailingItemDropDelegate \(String(describing: item)) dropEntered")
		highlight = true

		let provider = info.itemProviders(for: [.text])
		guard let draggedItem = provider.first else {
			return
		}
		let progress = draggedItem.loadObject(ofClass: String.self) { str, err in
			guard let str else { return }
			self.draggedItem = str
			
			print("TrailingItemDropDelegate draggedItem: \(String(describing: self.draggedItem))")
		}
	}
}

