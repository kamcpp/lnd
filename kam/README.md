## Build aar file

You need to have **git** and **docker** installed before proceeding.

Clone modified **lnd** source from [https://github.com/kamcpp/lnd](https://github.com/kamcpp/lnd).

```
$ git clone https://github.com/kamcpp/lnd
```

Got to **lnd** directory.

```
$ cd lnd
```

Checkout **newmerge** branch.

```
$ git fetch
$ git checkout newmerge
```

Goto **kam** directory.

```
$ cd kam
```

Execute **build-aar.sh** script. It starts to build **lnd** for different targets. Wait until the build gets finished.

```
$ ./build-aar.sh
```

Once it got finished, you should find **build** directory. There are final binaries for different targets there and one of them is the *aar* file.

```
$ ls build
lnd-android-16-386        lnd-darwin-10.6-amd64     lnd-linux-386             lnd-linux-arm-7           lnd-linux-mips64le
lnd-android-16-arm        lnd-ios-5.0-arm64         lnd-linux-amd64           lnd-linux-arm64           lnd-linux-mipsle
lnd-android-16.aar        lnd-ios-5.0-armv7         lnd-linux-arm-5           lnd-linux-mips            lnd-windows-4.0-386.exe
lnd-darwin-10.6-386       lnd-ios-5.0-framework     lnd-linux-arm-6           lnd-linux-mips64          lnd-windows-4.0-amd64.exe
```

## Compile rawtxapp Android project

You should have installed following tools before continuing with Andorid build.

* `node`
* `npm`
* `react-native`
* `Android Studio`
* `Andorid SDK`

First, you need to clone the modified **rawtxapp** source.

```
$ git clone https://github.com/kamcpp/rawtxapp
```

Goto **rawtxapp** directory.

```
$ cd rawtxapp 
```

Copy **aar* file into proper directory. Replace `$LND_DIR` and `$RAWTXAPP_DIR` with proper directories for **lnd** and **rawtxapp** directories.

```
cp  $LND_DIR/kam/build/lnd-android-16.aar  $RAWTXAPP_DIR/android/rtx_export-android-16/rtx_export-android-16.aar
```

Install necessary *node.js* modules. If it found some vulnerabilites after `npm install`, then run `npm audit fix`.

```
$ npm install
```

Open `rawtxapp/android` in Andorid Studio. Try to build the project. If you have a missing *Andorid SDK*, it pops up or appears in the build output as errors. Follow the instructions to install missing SDKs.

After a successful initial build, try to run the app inside an emulator with Android SDK 27 or 28. This will actually create the *apk* file. Wait for APK installation and the final run on the emulator. A red page shows up.

Then, go back to **rawtxapp** directory. You can close *Android Studio* if you like. Run the app using `react-native`.

```
$ cd rawtxapp
$ react-native run-android
```

Wait for the build to finish. Run the app inside the emulator if it doesn't show up automatically. It should be installed by now. There is a delay at the startup screen while the react's javascript bundle is being created.

If you get another red screen about error code 500, just do the following:

```
$ cd rawtxapp
$ rm -rf node_modules
$ npm install
$ react-native run-android
```

Have fun!





