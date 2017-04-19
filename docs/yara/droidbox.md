# Introduction

Droidbox is a tool to perform dynamic analysis of Android applications. With this module developed to be used with Yara, you can match applications by several criteria based on the dynamic analysis.

First of all, you need to import the module with the next directive at the header of the ruleset.

```
import "droidbox"
```

#Send SMS
If during the dynamic analysis the application send any SMS we register that. For instance, a tipical Android trojan after the installation and execution, it downloads a list of premium numbers and then sends one SMS to each one.

You can view this in the Droidbox report, under the **Analysis report** tab of the application (SMS).

In order to detect this behaviour with Yara, we have created the next functionality:

```
//Remind to import the droidbox module!!

rule videogames
{
	condition:
		droidbox.sendsms(/./) //With that we detect if the APP send an SMS to any destination.
}
```

Or maybe, you want to look for some specific destination:

```
droidbox.sendsms("1234")
```

or part of it:

```
droidbox.sendsms(/23/)
```

#Phone calls
Some times the applications make calls (in background or showing to the user, shamelessly!), you can detect these applications with this simple condition:

```
rule videogames
{
	condition:
		droidbox.phonecall(/./) //With that we detect if the APP call to any destination.
}
```

Or an specific destination:

```
droidbox.phonecall("123456789")
```

#Libraries
The applications uses libraries to several purposes, good or bad, but in any case with this directive you can catch them:

```
rule dexprotector
{
	condition:
		droidbox.library("/data/data/ar.music.video.player/app_outdex/libdexprotectorasfe90.so") //With that we detect if the APP call to a specific library.
}
```
But there is a better way, in case you don't know the package name or the complete name of the library loaded:

```
// Remember scape dots!
droidbox.library(/libdexprotectorasfe90\.so/)
```

#Written files
Droidbox also detect written and read files by the applications, and you can detect them by filename (written or read) or by content:
```
droidbox.written.filename("/data/data/ar.music.video.player/app_outdex/libdexprotectorasfe90.so") // By complete string
droidbox.written.filename(/libdexprotector/) // By regex, more powerful
```

Also, the data written. If it is binary data, we will represent as hexbytes, but if it's a text, you can use ascii directly.:
```
droidbox.written.data(/6465780A303335/) // Write the header of a dex file
```
Or if you are looking for a specific text:
```
droidbox.written.data("ID: 645r327673gfngnc")
```

#Read files
Like this module working with written files, it works with read files and its data:
```
// For filenames:
droidbox.read.filename("/proc/meminfo")
droidbox.read.filename(/meminfo/)
// For data:
droidbox.read.data(/6465780A303335/) // Read the header of a dex file (not load, only read)
droidbox.read.data("ID: 645r327673gfngnc")
```
