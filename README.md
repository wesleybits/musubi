# musubi

This contains an ongoing project for a friend who really kind of needs a way to properly visualize her professional network, basically letting her see the connections that tie her to her collegues.

## Getting Started

So you decided to mess around with __musubi__, so you forked it and feel pretty ready to get hacking.  Good for you! Here's what you'll need to get started:

- [Java JDK8](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html)
- [Processing v3.0a5](http://processing.org)
- [Android SDK](https://developer.android.com/sdk/installing/index.html)
- [Ketai](http://ketai.org)

First you want to update your Java JDK to version 8.  The one from Oracle is the most reliable, so you're on your own if you choose to use others like OpenJDK.  Linux users should consult their distro's docs on how to get Oracle's JDK through their package managers, since a manual install is a painful thing to do.  Users of other platforms (Windows, Macintosh) can just go to Oracle's site since they make installing on those platforms painless.

Next is Processing.  You will always want the latest version, which is currently 3.0a5.  Get the one for your platform.  There is no install, just unzip it someplace where you can find it later and fire it up.

The Android SDK is painless.  If you're on 64-bit linux, be sure that you have complete 32-bit compatibility set up; if you don't or aren't sure, consult your docs and community to get this working.  Click on Processing's mode selection and pick "Add Mode ...".  Give it a minute, and you'll see "Android Mode" at the top with Processing's logo next to it.  Install that; and when done go back to Processing's mode selector and pick "Android Mode".  Here it'll ask if you want to point it to an Android SDK you have already, or if you want Processing to install one for you.  If you don't have the Android SDK already, pick the later since it'll grab everything you need to get started right away.  This can take a while, so you should make a sandwich and eat it while you wait.

For Ketai, on the menubar click "Android" then "Import Library" then "Add Library ...".  In the dialog that pops up, type "Ketai" in the search bar and install the library.

Now you're done.  Just clone this stuff into your sketchbook and Processing will find it automatically.  Read up on Processing's Android Mode [here](https://github.com/processing/processing-android/wiki) and be sure to look at the Ketai stuff [here](http://ketai.org/get-started/).
