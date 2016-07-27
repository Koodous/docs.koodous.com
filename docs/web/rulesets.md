Yara rules are a great tool to make a static analysis over a sample.

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

At the moment, there is no way to tell the search engine what you are looking for. So, if you search a string (i.e. Rockstar), applications, packages and developers containing that string will be shown. 

## The detailed view

Entering on the detailed view of an APK is as easy as clicking over its name or SHA256 hash. Once inside, it is possible to see more information, vote it, write comments, request an analysis or download it.

The comment system is pretty starightforward: write your findings or opinions and click Send. Just remember to be respectful with the rest of the community, do constructive critics and follow a little netiquette. 

The up and down arrows on the right of the application image allows you to vote whether that specific application is trustworthy or not. Please notice this is not about how you like an application, but about how safe you think it is. 

You can download and send an analysis request using the button above the app image. 

The General info tab shows a brief summary of the most identificative information. Depending on the app, another Metadata tab will also appear showing a more complete report with information from Google Play, such as ratings and categories in JSON format. Finally, if the APK has been analyzed, another analysis tab will show the report, also in JSON format. 
