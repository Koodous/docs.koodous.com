# APKs

This method returns a paginated list of apks

## Resource url/s

* `https://api.koodous.com/apks`
* `https://api.koodous.com/apks/:sha256`


## Object details

* **created_on** _The date when APKs were created on koodous._
* **rating** _A value of users votes_
* **image** _APP image used shown on devices_
* **md5** _md5 hash_
* **sha1** _sha1 hash_
* **sha256** _sha256 hash_
* **app** _App name shown on devices_
* **package_name** _app package identifier_
* **company** _Company or developer of the app_
* **displayed_version** _APP version shown on market_
* **size** _APP size in bytes_
* **analyzed** _APK has been analyzed, or not, by koodous system_
* **trusted** _APK is inside Koodous whitelist_
* **detected** _APK has been detected by Koodous community_
* **corrupted** _APK cannot be exectuted correctly_



## Parameters

* **:sha256** _sha256 lookup_
* **?cursor** _Specify cursor of current results_

Examples:

* `https://api.koodous.com/apks/cc489e3296408abbfbd5e2aad0665abd60bae3442d10bcc702a7e8424e547544`
* `https://api.koodous.com/apks?cursor=cD0yMDE1LTA3LTA4KzE0JTNBMTAlM0E1MyUyQjAwJTNBMDA%3D`

_**Note:** Our advanced search system can be used in our API as a simple search, check [advanced search section](/web/the-repo/#advanced-search)_

## Example request

`https://api.koodous.com/apks?cursor=cD0yMDE1LTA3LTA4KzE0JTNBMTAlM0E1MyUyQjAwJTNBMDA%3D`

## Example result
```json
{
    "next": "https://api.koodous.com/apks?cursor=cD0yMDE1LTA3LTA4KzE0JTNBMTAlM0E1MyUyQjAwJTNBMDA%3D",
    "previous": null,
    "results": [
        {
            "created_on": 1429629827,
            "rating": 0,
            "image": "https://koodous.com/media/apk_images/tmpYDOLaE",
            "tags": [],
            "md5": "8fee025ee05aa599a29ef6563b24d027",
            "sha1": "1d4d60016e4c404886d5a6e624f0cece6d45bc49",
            "sha256": "cc489e3296408abbfbd5e2aad0665abd60bae3442d10bcc702a7e8424e547544",
            "app": "Barbershop Settings",
            "package_name": "com.hallico.barbershoppole",
            "company": "Hallico Corporation",
            "displayed_version": "1.8",
            "size": 2106565,
            "stored": true,
            "analyzed": true,
            "trusted": false,
            "detected": false,
            "corrupted": false,
            "repo": ""
        },
        {
            "created_on": 1429629826,
            "rating": 0,
            "image": "https://koodous.com/media/apk_images/tmphKmwA2",
            "tags": [],
            "md5": "795ec6217530a3531c66f3bb99d40802",
            "sha1": "9eca8b3a3c03542ef890b9074dc09430bf736068",
            "sha256": "249c7fe2730ecf8944cd4bbd0f3b3157c62f2c3d1f78f6f29e07b4c818c15487",
            "app": "私密快播",
            "package_name": "afhl.ktld.uysg.ptey",
            "company": "qmnu",
            "displayed_version": "7.8.0",
            "size": 2337458,
            "stored": true,
            "analyzed": true,
            "trusted": false,
            "detected": false,
            "corrupted": false,
            "repo": ""
        },
    ]
}
```

## Python examples

A basic APK list request.

```python
import requests
r = requests.get(url="https://api.koodous.com/apks")
r.json()
# {"next":"https://api.koodous.com/apks?cursor=cD0yMDE1LTA3LTA4KzE0JTNBMTAlM0E1MyUyQjAwJTNBMDA%3D", "previous": null, "results": [...
```

An APK search request

```python
import requests
params = {'search':'Whatsapp'}
r = requests.get(url="https://api.koodous.com/apks", params=params)
r.json()
# {"next":"https://api.koodous.com/apks?cursor=cD0yMDE1LTA3LTA4KzE0JTNBMTAlM0E1MyUyQjAwJTNBMDA%3D", "previous": null, "results": [...
```

An APK detail

```python
import requests
sha256 = "cc489e3296408abbfbd5e2aad0665abd60bae3442d10bcc702a7e8424e547544"
r = requests.get(url="https://api.koodous.com/apks/%s" % sha256)
r.json()
#{"created_on":1429629827,"rating":0,"image":"https://cdn1.koodous.com/apk_images/2015/4/21/tmpYDOLaE","tags":[],"md5":"8fee025ee05aa599a29ef6563b24d027"...
```
