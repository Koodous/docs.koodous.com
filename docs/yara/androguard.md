# Introduction

Androguard is a tool to make a static analysis of Android applications. With this module developed to used with Yara, you can match applications by several criteria based on the static analysis.

First of all, you need to import the module with the next directive at the header of the ruleset.

```
import "androguard"
```
# Package name
Each Android application has a package name that need to be unique once the application is installed in the mobile phone, but in the will, we found several applications with the same (or similar) package name. To find this kind of applications, we can use the next condition (we use a complete rule to explain the COMPORTAMIENTO):

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

In order to detect some applications 

androguard.permission(/RESTART_PACKAGES/)