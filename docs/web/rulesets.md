# Rulesets

The Yara rules are a great tool to make a static analysis over a sample.

## Searching

In the repository screen you can search for any APK in the system. Depending of the fields, the search will return APKs with an exact or partial match:

* Partial match fields
** App name
** Package
** Developer

* Exact match fields
** SHA256
** SHA1
** MD5

If you search for a partial hash, like 0bb9246deae4d3210e06791e9999c45 (notice the last figure is left), the search engine will look in any partial match field, probably giving you no results at all.

At the moment, there is no way to tell the search engine what are you looking for. So, if you look for a string, i.e. Rockstar, you will have applications, packages and developers who has the string somewhere in its name. In this case, you'll need to be more specific.

## The detailed view

Entering on the detailed view of an APK is as easy as clicking over its name or SHA256 hash. Once inside, it is possible to see more information, vote, write comments, send an analysis request or download it.

The comment system is pretty starightforward: write your findings or opinions and push Send. Just remember to be respectful with the rest of the community, do constructive critics and follow a little netiquette. 

The up and down arrows on the right of the application image let you vote if that specific application is trustworthy or not. Please notice is not about how you like an application, but about how safe you think it is. 

You can download and send an analysis request using the button above the app image. 

The General info tab shows a brief summary of the most identificative information. Depending on the app, another Metadata tab will also show a more complete report with information from Google Play such as ratings and categories in json format. Finally, if the APK has been analysed, another analysis tab will show the report, also in json format. 
