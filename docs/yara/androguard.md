# Introduction

Androguard is a tool to make a static analysis of Android applications. With this module developed to used with Yara, you can match applications by several criteria based on the static analysis.

First of all, you need to import the module with the next directive at the header of the ruleset.

```
import "androguard"
```
# Package name
Each Android application has a package name that need to be unique once the application is installed in the mobile phone, but in the wild, we found several applications with the same (or similar) package name. To find this kind of applications, we can use the next condition (we use a complete rule for explain the behaviour):

```
androguard.package_name(regex)
```

And match with a string too...

```
androguard.package_name(string)
```


```
rule videogames
{
	meta:
		description = "Rule to catch APKs with package name match with videogame"
	condition:
		androguard.package_name(/videogame/)
}
```

You can add more restrictions to this rule, like strings, another functions of this module or conditions of another module.

# APP name
The app name displayed when you install an application in a device could be an indicator of an "anomaly". For this reason, we have an condition to catch this applications. You can match with a regex or with a string.

```
androguard.app_name(regex)
```
```
androguard.app_name(string)
```

```
rule videogames
{
	meta:
		description = "Rule to catch APKs with app name match with cars"
	condition:
		androguard.app_name(/cars/)
}
```


# Activity
The activities is an esential part of the Android applications. They define the "screens" of an application and its logic, so, with the name of that, you can filter some applications. In the next example, we are going to filter applications which the name one of its activity is sms, with a point after and before of that word:

It accepts two formats, with string and with regular expression:
```
androguard.activity(string)
```
```
androguard.activity(regex)
```
And you must use in the conditions section:
```
rule sendSMS
{
	condition:
		androguard.activity(/\.sms\./) or
		androguard.activity("com.package.name.sendSMS")
}
```

Of course, this filter does not indicate that the application send SMSs, but maybe receive or use an screen to send some type of SMS.

# Permissions

In order to detect some applications that requires an special or desired permissions, you can use this condition. It find in all permissions of the application and if one of this match with the regular expression, it generates a notification.

The format is the next:
```
androguard.permission(regex)
```

And you must use in the conditions section:

```
rule videogames
{
	condition:
		androguard.permission(/RESTART_PACKAGES/)
}
```

## Permissions number
Some applications with a huge number of permissions could be malware and this variable could help you to detect them.

```
rule videogames
{
	condition:
		androguard.permissions_number > 5
}
```

# Service

The service or services of an application are use to run tasks in background. Many times, the malware use this to downloads configuration files, to send stolen data or another thing, ever in background. In order to detect the applications that use an special or desired service name, you can use this condition. It find in all services of the application and if one of this match with the regular expression or an exact string and then generates a notification.


```
androguard.service(regex)
```
```
androguard.service(string)
```

And you must use in the conditions section:

```
rule videogames
{
	condition:
		androguard.service("com.example.SendData") or
		androguard.service(/receivetoken/)
}
```

# Certificate
In our website, one of the details of each APK is the "Developer". If you are a malware analyst, you must know that this field is not easy to know, so we use the APK' certificate to extract it. If you encounter a serie of APKs with the same Developer, you can create a Yara rule to know more of them.

### SHA1
Each certificate has an SHA1 as a part of its signature, and you can match with it! Some malware developers use the same certificate for many samples, and with this condition you can detect them:

```
androguard.certificate.sha1(string)
```

**Remember** that you need to match with the complete sha1, not with a part or regex of it.

Example:

```
rule videogames: adware
{
	condition:
		androguard.certificate.sha1("5C88CB801C4FB3D609B57DCD7CAFC25B35E03AC2")
}
```

### Issuer
The issuer of a certificate is the person (or entity) that generate the certificate. With the next condition you can match with it:

```
androguard.certificate.issuer(regex)
```

### Subject
The subject of a certificate is the owner of its. To match with this field, you can use:

```
androguard.certificate.subject(regex)
```

NOTE: Normally, Issuer and Subject in an APK' certificates are the same, but this is not a norm.

# URL
We perform an static analysis over the APK extracting the **hardcored URLs**. You can do a rule to match with that (using a regex or a string).

```
androguard.url(regex)
```
```
androguard.url(string)
```

```
rule videogames: adware
{
	condition:
		androguard.url(/adurl\.com/) or
		androguard.url("google.com")
}
```

**NOTE**: Remember that if you want to find a point (.) with a regex, you need to escape it with reverse slash. If you don't do that, it can match with any character.

#SDK versions
The AndroidManifest.xml file contains the versions minimum, maximum and target that the application requires, specified with the API number.

The API list is the next:

|Code name|Version|API level|
|------------|:-------------:|-----|
|Lollipop|5.0|API level 21|
|KitKat|4.4 - 4.4.4|API level 19|
|Jelly Bean|4.3.x|API level 18|
|Jelly Bean|4.2.x|API level 17|
|Jelly Bean|4.1.x|API level 16|
|Ice Cream Sandwich|4.0.3 - 4.0.4|API level 15|
|Ice Cream Sandwich|4.0.1 - 4.0.2|API level 14|
|Honeycomb|3.2.x|API level 13|
|Honeycomb|3.1|API level 12|
|Honeycomb|3.0|API level 11|
|Gingerbread|2.3.3 - 2.3.7|API level 10|
|Gingerbread|2.3 - 2.3.2|API level 9|
|Froyo|2.2.x|API level 8|
|Eclair|2.1|API level 7|
|Eclair|2.0.1|API level 6|
|Eclair|2.0|API level 5|
|Donut|1.6|API level 4|
|Cupcake|1.5|API level 3|
|(no code name)|1.1|API level 2|
|(no code name)|1.0|API level 1|

You can see an updated version of this table in its source: [https://source.android.com/source/build-numbers.html](https://source.android.com/source/build-numbers.html)


###Min SDK
Minimum SDK version specifies that, the minimum version of Android require to execute the application. You can filter that using:

```
rule videogames: adware
{
	condition:
		androguard.min_sdk == 10 or
		androguard.min_sdk > 10 or
		androguard.min_sdk <= 20 
		//It's only an example, don't bother!
}
```

###Max SDK
Maximum SDK specifies the higger version of Android that could run this application:

```
rule videogames: adware
{
	condition:
		androguard.max_sdk == 18 or
		androguard.max_sdk > 18 or
		androguard.max_sdk >= 19 
}
```

###Target SDK
The target version, theorically, specifies in which Android version the application was tested and worked fine.

```
rule videogames: adware
{
	condition:
		androguard.target_sdk == 14 or
		androguard.target_sdk > 14 or
		androguard.target_sdk >= 15 
}
```