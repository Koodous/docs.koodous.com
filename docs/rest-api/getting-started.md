#Getting started

The Koodous public REST API gives you the chance to create your koodo client for different platforms.

## Creating an account

You need a token to access our API. Just create your account on [koodous.com](http://koodous.com) and check 
your user page to get your access token.

## Authentication

Almost every request need to specify your user token using `Authorization` header. A request with token `c080ddd1fab46bc919ca0d62299e9995b1886853` should looks like follows:

```
GET /api/apks
Authorization: Token c080ddd1fab46bc919ca0d62299e9995b1886853
```

## Response

Responses format are json. The example response of the last request will looks like follows:

```
{
    "count": 12312,
    "next": "https://koodous.com/api/apks?page=2",
    "previous": null,
    "results": [
        {
            "created_on": 1429390443,
            "rating": 0,
            "image": "https://koodous.com/media/apk_images/tmpFESIMk",
            "md5": "ee644f55b915c9fb3362be28647eb976",
            "sha1": "dee89c3cb639ca791ea3e7e2da3d7b8ac7972e13",
            "sha256": "4891047860f004894de77b4c8018e3f69bb50a210159b77119e90dcd87860e98",
            "app": "9812hnj",
            "package_name": "com.digitaran.9812hnj",
            "company": "Digitaran",
            "displayed_version": "1.0",
            "size": 1040818,
            "stored": true,
            "analyzed": false,
            "is_apk": true,
            "trusted": false,
            "is_malware": false,
            "corrupted": false,
            "hidden": false,
            "repo": ""
        },
        ...
    ]
}
```

## Python example

Here you have an example using python and [requests library](http://docs.python-requests.org/en/latest/):

```python
import requests

url = "https://koodous.com/api/apks"
headers = {"Authorization":"Token c080ddd1fab46fc919ca0d62299e9995b1886853"}
r = requests.get(url=url, headers=headers)

r.status_code
#200

r.json()
#JSON response
```