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
The app name displayed when you install an application in a device could be an indicator of an "anomaly". For this reason, we have an condition to catch this applications.

```
androguard.app_name(regex)
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


```
rule videogames
{
	condition:
		androguard.activity(/\.sms\./)
}
```

Of course, this filter does not indicate that the application send SMSs, but maybe receive o use an screen to send some type of SMS.

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

The complete list of the permissions used in the manifest are in the [official Android documentation](http://developer.android.com/reference/android/Manifest.permission.html), but remember that some applications can have its own permissions!

# Certificate
In our website, one of the details of each APK is the "Developer". If you are a malware analyst, you must know that this field is not easy to know, so we use the APK' certificate to extract it. If you encounter a serie of APKs with the same Developer, you can create a Yara rule to know more of them.

## SHA1
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

## Issuer
The issuer of a certificate is the person (or entity) that generate the certificate. With the next condition you can match with it:

```
androguard.certificate.issuer(regex)
```

## Subject
The subject of a certificate is the owner of its. To match with this field, you can use:

```
androguard.certificate.subject(regex)
```

NOTE: Normally, Issuer and Subject in an APK' certificates are the same, but this is not a norm.
