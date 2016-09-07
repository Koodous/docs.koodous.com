The repository screen of Koodous allows you to search through _millions of packages_ any particular application. Once you have found your "target", you can access the detailed view, where you can vote, comment, download it and ask for an on-demand analysis. 

***

## Searching

In the repository screen you can search for any APK in the system. Depending of the fields, the search will return APKs with an exact or partial match:

#### Regular text search

You have the possibility to look for apks introducing text with no command at all. The entered text will be compared to the following fields:

- App name
- Developer
- Package
- Hash (md5, sha1, sha256)

From here you can use some little commands to exclude or add some options to your search. Check out the following examples:

- [66038ee31eea9fa77cb657299edcca9f66b9ba26af0c9eb514aff39abfd2b68c](https://koodous.com/apks?search=66038ee31eea9fa77cb657299edcca9f66b9ba26af0c9eb514aff39abfd2b68c) Looks for the introduced hash
- [Whatsapp](https://koodous.com/apks?search=Whatsapp) Looks for **Whatsapp**
- [Whatsap*](https://koodous.com/apks?search=Whatsap*) Looks for strings that start with **Whatsap**
- [Whatsapp -com.whatsapp](https://koodous.com/apks?search=Whatsapp%20-com.whatsapp) Looks for **Whatsapp* excluding **com.whatsapp**
- [Whatsapp~1 -com.whatsapp](https://koodous.com/apks?search=Whatsapp~1%20-com.whatsapp) Looks for **Whatsapp** and similars words (like typos) excluding **com.whatsapp**. The number **1** can get higher for a softer comparison.
- ["Whatsapp Plus"](https://koodous.com/apks?search="Whatsapp%20Plus") Looks for apps with that two words in that order
- [Whatsapp AND Facebook](https://koodous.com/apks?search=Whatsapp%20AND%20Facebook) Looks for apps that contains both both words (**AND** can be removed as is the default command)
- [Whatsapp OR Facebook](https://koodous.com/apks?search=Whatsapp%20OR%20Facebook) Looks for apps that contains **Whatsapp** or **Facebook**
- [(Whatsapp OR Facebook) -(com.principal OR com.whatsapp)](https://koodous.com/apks?search=(Whatsapp%20OR%20Facebook)%20-(com.principal%20OR%20com.whatsapp)) You can group conditions and excluding them too

## Advanced search

We provide an advanced search to ease the search of malware or interesting samples. You can either filter by tags, filesize, user's rating, ... For instance, if we can find applications with a rating less than -1 and from GooglePlay, you can use [```rating:<=-1 tags:googleplay```](https://koodous.com/apks?search=rating:<=-1 tags:googleplay). This is useful to detect applications rated by users that maybe are not detected by any ruleset.

Another interesting search can be: [```package_name:"com.whatsapp" -developer:"WhatsApp Inc."```](https://koodous.com/apks?search=package_name:"com.whatsapp"%20-developer:"WhatsApp%20Inc.")

The following table describes each search modifier available, you can combine these as you can with the previous examples on regular text search section.

| Attribute | Modificator | Description |
| ------------- |:-------------:| ----- |
| Rating | rating: | This modificator is used to obtain application with certain users rating. You can get applications with score greater or equal than 2 with ```rating:>2```. Or more interesting, with score equal or less than -1 ```rating:>=-1``` |
| Developer | developer: (or company:) | The developer of each application is extracted from the certificate, and you can search by these using this modificator. For instance: ```developer:"WhatsApp Inc."``` |
| Package Name | package_name: | Each application must have an unique package name, and each update must have the same name. Example: ```package_name:com.whatsapp``` |
| App Name | appname: (or app:) | The name of the application, for instance: ```appname:WhatsApp``` |
| Filesize (in bytes) | size: | The filesize of the APK file is, in many times, an indicator of their purpose. You can filter by this parameter with, for instance, for files greater or equal than 1MB: ```size:>1000000```, or less than 700KB: ```size:<700000```. Last but not least, you can use ranges (from 700kb to 1MB) ```size:[700000 TO 1000000]``` |
| Tag | tags: (or tag:) | We tag the samples with interesting word and each user can set by one or more tag to any sample, and you can find for this. For example, finding sample that we know come from Google Play: ```tags:googleplay``` or that any user has tagged as **banker** ```tags:banker``` |
| Submission date | date: (or created_on:) | The date when each APK was submitted is indexed and you can filter by that. For instance: ```date:<2015-06-16``` for samples previous to this date and ```date:>2015-06-16``` for samples submitted after this date. Here, ranges can be used too ```date:[2015-06-16 TO 2015-06-17]```
| Certificate | certificate: (or cert:) | Each application (as well the well-formed) has signed by a certificate. We have each certificate indexed and you can find by that, concretly by its *sha1*. For instance, we know that official Twitter application has **40F3166BB567D3144BCA7DA466BB948B782270EA** as sha1 certificate, then, we can found all versions of the official Twitter application with this: ```cert:40F3166BB567D3144BCA7DA466BB948B782270EA``` or ```certificate:40F3166BB567D3144BCA7DA466BB948B782270EA``` if you want to write a bit more :).|
| Installed on devices | installed: (or on_devices:) | This search modifier has no parameters. It search only APKs that are installed or sometime was installed in some device. Example: ```installed:true``` or ```installed:false``` |
| Detected by community | detected: | This search modifier has no parameters. It search only APKs that has been detected by Koodous community. Example: ```detected:true``` or ```detected:false``` |
| Hardcoded urls | url: (or urls:) | Looks for urls inside APK with partial or full search. Example: ```url:google.com``` or ```url:"https://play.google.com/store"``` |
| Network hosts | network.hosts: | Looks for hosts of connections made from the app. Example: ```network.hosts:8.8.8.8``` |
| Network http | network.http: | Looks for http uris of connections made from the app (full or partial search). Example: ```network.http:"com:80"``` |
| Network DNS | network.dns: | Looks for dns resolutions made from the app (full or partial search). Example: ```network.dns:"google.com"``` |
| Network domains | network.domains: | Like dns (full or partial search). Example: ```network.domains:"google.com"``` |



## The detailed view

Entering on the detailed view of an APK is as easy as clicking over its name or SHA256 hash. Once inside, it is possible to see more information, vote it, write comments, request an analysis or download it.

The comment system is placed on a tab and is pretty straight-forward: write your findings or opinions and click Send. Just remember to be respectful with the rest of the community, do constructive critics and follow the standard netiquette. 

The up and down arrows on the right of the application image allows you to vote if that specific application is trustworthy or not. Please notice this is not about how you like an application, but about how safe you think it is. 

Many APKs contain the ![Corrupted](../img/corrupted-tag.png) tag.  This just means that we haven't been able to detect a .dex file, resources file or a certificate. Many service APPs installed on devices don't have a certificate by default. Because of this, we consider that it's corrupted. 

You can download and send an analysis request using the specific buttons above the app image. 

### Info tabs

* The _General info_ tab shows a brief summary of the most identificative information. 
* Depending on the app, another _Metadata_ tab will appear showing a more complete report with information from Google Play, such as ratings and categories. 
* If the APK has been analyzed, another _Analysis_ tab will show the report, also in json format. 

