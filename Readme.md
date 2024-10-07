#  StringDragAndDrop

This project allows one to drag items to and from sidebar and detail views. 

Turned out to be much harder than I thought it would be. 

I'd love to get feedback about simpler approaches, if they exist. 

I don't do the actual transfer of the object until performDrop, unlike some examples I've seen. This means that the gridrow and list items don't reorder themselves visually when items are being dragged, but the problem of what to do when items are dragged, but not placed in a view that knows what to do with them, is avoided.

Currently this project makes use of DropDelegates' DropInfo, but I already know that doing this with a custom Transferable (protocol) object is problematic. 
It requires that the object be (something like) ObjectiveCBridgeable, which you have to code. Will look into this; however, it looks like a reasonable way to handle this for Transferable items is to use a unique string as the DropInfo contents, Since String items already conform to ObjectiveCBridgeable. 



