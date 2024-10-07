#  StringDragAndDrop

This project allows one to drag items to and from sidebar and detail views. 

Turned out to be much harder than I thought it would be. 
I'd love to get feedback about simpler approaches, if they exist. 

Currently this project makes use of DropDelegates' DropInfo, but I already know that doing this with a custom Transferable (protocol) object is problematic. 
It requires that the object be (something like) nsobjectbridgeable, which you have to code. (Don't have a project currently where I can give better info).

I will be modifying this project to get rid of the code that makes use of DropInfo.

