//
//  LeadingItemDropDelegate.swift
//  StringDnD3
//
//  Created by Eric Kampman on 10/5/24.
//

import SwiftUI

struct LeadingItemDropDelegate: DropDelegate {
	let item: String?
	@Binding var leadingStrings: [String]
	@Binding var trailingStrings: [String]
	@Binding var draggedItem: String?
	@Binding var highlight: Bool

	func performDrop(info: DropInfo) -> Bool {
		print("LeadingItemDropDelegate \(String(describing: item)) performDrop")
		let myIndex = leadingStrings.firstIndex(of: item!)
		
		if let draggedItem {
			if let trailingIndex = trailingStrings.firstIndex(of: draggedItem) {
				leadingStrings.insert(draggedItem, at: myIndex!)
				trailingStrings.remove(at: trailingIndex)
			}
			else if let leadingIndex = leadingStrings.firstIndex(of: draggedItem) {
				leadingStrings.remove(at: leadingIndex)
				var updatedIndex = myIndex!
				if myIndex! > leadingIndex {
					updatedIndex -= 1
				}
				leadingStrings.insert(draggedItem, at: updatedIndex)
			}
		}
		highlight = false
		return true
	}
	
	func dropExited(info: DropInfo) {
		highlight = false
	}
	
	func dropEntered(info: DropInfo) {
		print("LeadingItemDropDelegate \(String(describing: item)) dropEntered")
		highlight = true
		
		let provider = info.itemProviders(for: [.text])
		guard let draggedItem = provider.first else {
			return
		}
		let progress = draggedItem.loadObject(ofClass: String.self) { str, err in
			guard let str else { return }
			self.draggedItem = str
			
			print("LeadingItemDropDelegate draggedItem: \(String(describing: self.draggedItem))")
		}
	}
}
