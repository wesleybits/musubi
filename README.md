# musubi

This contains an ongoing project for a friend who really kind of needs a way to properly visualize her professional network, basically letting her see the connections that tie her to her collegues.

## Getting Started

So you decided to mess around with __musubi__, so you forked it and feel pretty ready to start hacking.  Good for you!  Here's what you'll need to get started:

- [Java JDK8](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html)
- [Processing v3.0a5 32-bit version](http://processing.org)
- [Android SDK](https://developer.android.com/sdk/installing/index.html)
- [Ketai v9](http://ketai.org)

Get the Java JDK for your platform, this is important.  If you're on Linux, consult your package manager or any community maintained repos that your distro is friendly with before going right to Oracle; this will save you buckets of frustration.  In comparison, Windows and Mac OSX users will have a much easier time with this.

Processing is easy.  Download it.  Extract it.  You're done.

Follow the Android SDK install directions.  Don't install the Android Studio option unless you intend to work on Android apps outside of Processing.  Android work is kind of insane to do without the Studio or Processing.  When you're selecting Android APIs to use, be sure to include the APIs for Android 4.4.2, since that's what my friend is currently running, but also feel perfectly free to grab whatever other goodies you wanna get your mits on.  At this point, fire up Processing and install Android Mode; when it asks, just point it to where you put the Android SDK.

_(About that previous paragraph, that's what I did before I saw that Processing 3 will install the Android SDK for you; so you can go ahead and try that if you're feeling adventurous.  Tell me about your experience!)_

Next is Ketai.  The furnished release that you can get via the Processing library manager won't work with Android v4.4.2.  You're gonna need to get version 9, which is available in their source repo.  Be sure to star them while you're there, Ketai _is_ a pretty badass library.  

To get Processing to use the it, in Processing do _File_ > _Preferences_ and look at the location of your Sketchbook.  In that directory there should be a folder named `libraries`.  If there isn't, make it and copy `ketai/downloads/Ketai_v9` there.  Now completely quit Processing and fire it back up again.

Now all the hard parts are done.  Now just clone this stuff into your sketchbook and Processing will find it automatically.  Read up on Processing's Android Mode [here](https://github.com/processing/processing-android/wiki) and be sure to look at the Ketai stuff [here](http://ketai.org/get-started/).
