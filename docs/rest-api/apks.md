# APKs

This method returns a paginated list of apks

## Resource url/s

* `https://koodous.com/api/apks`
* `https://koodous.com/api/apks/:sha256`


## Object details

* **created_on** _The date when apks was created on koodous._
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

## Resource information

| | |
| ------------- |:-------------:|
| **Response formats** | JSON |
| **Requires authentication** | Yes |
| **Requests per minute** | 60|

## Parameters

* **:sha256** _sha256 lookup_
* **?page** _Specify page of current results_
* **?page_size** _Number of elements per page_

Examples:

* `https://koodous.com/api/apks/cc489e3296408abbfbd5e2aad0665abd60bae3442d10bcc702a7e8424e547544`
* `https://koodous.com/api/apks?page=1&page_size=5`
* `https://koodous.com/api/apks?page=3&page_size=25`

## Search, filters and ordering

* **?search** _Text that search using fields **app**, **package_name** and **company**
* **?analyzed=(True|False)** _Boolean to filter apks analyzed or not_
* **?md5** _md5 lookup_
* **?sha1** _sha1 lookup_
* **?sha256** _sha256 lookup_
* **?ordering=(created_on, -created_on)** _Timestamp creation date order (desc. or asc.)_


Examples:

* Example: `https://koodous.com/api/apks?search=Facebook`
* Example: `https://koodous.com/api/apks?analyzed=True`
* Example: `https://koodous.com/api/apks?md5=8fee025ee05aa599a29ef6563b24d027`
* Example: `https://koodous.com/api/apks?sha1=1d4d60016e4c404886d5a6e624f0cece6d45bc49`
* Example: `https://koodous.com/api/apks?ordering=created_on`

## Example request

`https://koodous.com/api/apks?page_size=2`

## Example result
```json
{
    "count": 2175933,
    "next": "https://koodous.com/api/apks?page=2&page_size=2",
    "previous": null,
    "results": [
        {
            "created_on": 1429629827,
            "rating": 0,
            "image": "https://koodous.com/media/apk_images/tmpYDOLaE",
            "md5": "8fee025ee05aa599a29ef6563b24d027",
            "sha1": "1d4d60016e4c404886d5a6e624f0cece6d45bc49",
            "sha256": "cc489e3296408abbfbd5e2aad0665abd60bae3442d10bcc702a7e8424e547544",
            "app": "Barbershop Settings",
            "package_name": "com.hallico.barbershoppole",
            "company": "Hallico Corporation",
            "displayed_version": "1.8",
            "size": 2106565,
            "analyzed": false,
            "corrupted": false,
            "repo": ""
        },
        {
            "created_on": 1429629826,
            "rating": 0,
            "image": "https://koodous.com/media/apk_images/tmphKmwA2",
            "md5": "795ec6217530a3531c66f3bb99d40802",
            "sha1": "9eca8b3a3c03542ef890b9074dc09430bf736068",
            "sha256": "249c7fe2730ecf8944cd4bbd0f3b3157c62f2c3d1f78f6f29e07b4c818c15487",
            "app": "私密快播",
            "package_name": "afhl.ktld.uysg.ptey",
            "company": "qmnu",
            "displayed_version": "7.8.0",
            "size": 2337458,
            "analyzed": false,
            "corrupted": false,
            "repo": ""
        }
    ]
}
```

## APK Votes
```
Remote Address:koodous.com
Request URL:https://koodous.com/api/apks/:sha256/votes
Request Method:POST
Status Code:201 CREATED
```

Payload examples:

```json
{kind: "positive"}
```

```json
{kind: "negative"}
```