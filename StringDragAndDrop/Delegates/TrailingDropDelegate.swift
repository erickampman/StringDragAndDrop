//
//  TrailingDropDelegate.swift
//  StringDnD3
//
//  Created by Eric Kampman on 10/2/24.
//

import SwiftUI

struct TrailingDragDelegate: DropDelegate {
	let afterItem : String?
	@Binding var leadingStrings: [String]
	@Binding var trailingStrings: [String]
//	@State var data = String?.none
	var count = 0
		
	func performDrop(info: DropInfo) -> Bool {
		// If the item came from leadingStrings, then we need to
		// delete from there. The item has already been copied to trailingStrings
		
		let provider = info.itemProviders(for: [.text])
		guard let draggedItem = provider.first else {
			return true // ???
		}
		
		let progress = draggedItem.loadObject(ofClass: String.self) { str, err in
			guard let str else { return }
			
			
			if let index = leadingStrings.firstIndex(of: str) {
				leadingStrings.remove(at: index)
			}
		}
		
		return true
	}
	
	func dropExited(info: DropInfo) {
		/*
			If dropped item is coming
			from leadingStrings, we should remove the item,
			if it's been copied across by dropEntered.
		 
			If, however, the item is from trailingStrings,
			there won't be an existing item in leadingStrings,
			so I guess we do nothing... ?
		 */
		print("dropExited")
		
/*
		let provider = info.itemProviders(for: [.text])
		guard let draggedItem = provider.first else {
			return
		}
		
		let progress = draggedItem.loadObject(ofClass: String.self) { str, err in
			guard let str else { return }
			
			if let index = trailingStrings.firstIndex(of: str) {
				trailingStrings.remove(at: index)
			}
		}
 */
	}
	
	func dropUpdated(info: DropInfo) -> DropProposal? {
		print("dropUpdated")
		return nil
	}
	
	func validateDrop(info: DropInfo) -> Bool {
		print("validateDrop")
		return true
	}
	
	func dropEntered(info: DropInfo) {
		/* Cases:
		 1) if item already exists in trailingStrings, move it (or leave it)
		 2) if item doesn't exist in trailingStrings, insert it.
		 */
		
		let provider = info.itemProviders(for: [.text])
		guard let draggedItem = provider.first else {
			return
		}
		
		let progress = draggedItem.loadObject(ofClass: String.self) { str, err in
			guard let str else { return }
			
			print("dropEntered str -- \(str)")
			
			if trailingStrings.contains(str) {
				print("dropEntered -- already in trailingStrings")
			} else {
				trailingStrings.append(str)
				print("dropEntered -- appending \(str) to trailingStrings")
			}
		}
		
		// Not removing from leadingStrings (if applicable)
		// at this point. Do that in performDrop.

	}
	
/*
	// callback is too awkward. FIXME remove
	private func extractData(from info: DropInfo) -> Bool {
		let provider = info.itemProviders(for: [.text])
		guard let draggedItem = provider.first else {
			return false
		}
		
		let progress = draggedItem.loadObject(ofClass: String.self) { str, err in
			
			guard let str else { return }
			
			data = str
		}
		
		// does this matter???
		return progress.isFinished
	}
 */
		
}
