# Introduction

Droidbox is a tool to perform a dynamic analysis of Android applications. With this module developed to be used with Yara, you can match applications by several criteria based on the dynamic analysis.

First of all, you need to import the module with the next directive at the header of the ruleset.

```
import "droidbox"
```

#Send SMS
If during the dynamic analysis the application send any SMS we register that. For instance, a tipical Android trojan after the installation and execution, it download a list of premium number and then send one SMS to each one.

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
Some times the applications make calls (in background or showing to the user, shamelessly!), you can detect this applications with this simple condition:

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
