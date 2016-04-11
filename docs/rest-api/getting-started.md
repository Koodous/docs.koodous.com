#Getting started

The Koodous public REST API gives you the chance to create your koodo client for different platforms.

## Creating an account

You need a token to access our API. Just create your account on koodous and check 
your [user settings page](//koodous.com/settings/profile) to get your access token.

## Authentication

Almost every request need to specify your user token using `Authorization` header. A request with token `c080ddd1fab46bc919ca0d62299e9995b1886853` should looks like follows:

```
GET /apks
Authorization: Token c080ddd1fab46bc919ca0d62299e9995b1886853
```

## Response

Responses format are json. The example response of the last request will looks like follows:

```
{
    "count": 12312,
    "next": "https://api.koodous.com/apks?cursor=cD0yMDE2LTAxLTEzKzEwJTNBMzYlM0EwNyUyQjAwJTNBMDA%3D",
    "previous": null,
    "results": [
        {
            "created_on": 1429390443,
            "rating": 0,
            "image": "https://cdn1.koodous.com/apk_images/tmpFESIMk",
            "tags": [],
            "md5": "ee644f55b915c9fb3362be28647eb976",
            "sha1": "dee89c3cb639ca791ea3e7e2da3d7b8ac7972e13",
            "sha256": "4891047860f004894de77b4c8018e3f69bb50a210159b77119e90dcd87860e98",
            "app": "PornNow",
            "package_name": "com.digitaran.pornnow",
            "company": "Digitaran",
            "displayed_version": "1.0",
            "size": 1040818,
            "stored": true,
            "analyzed": true,
            "is_apk": true,
            "trusted": false,
            "detected": false,
            "corrupted": false,
            "repo": "",
            "on_devices": false
        },
        ...
    ]
}
```

## Api levels

Depending on your API level, you can have different limits when interacting with the Koodous API.

| Range | Basic | Bronze | Silver | Gold |
| :---: |:---:|:---:|:---:|:---:|
| **APK downloads** | 50/day | 100/day | 250/day | 500/day |
| **Analysis requests**| 50/day | 100/day | 100/day | 100/day |

## Python example

Here you have an example using python and [requests library](http://docs.python-requests.org/en/latest/):

```python
import requests

url = "https://api.koodous.com/apks"
headers = {"Authorization":"Token c080ddd1fab46fc919ca0d62299e9995b1886853"}
r = requests.get(url=url, headers=headers)

r.status_code
#200

r.json()
#JSON response
```

## Python API Class

There is a python example class with almost all Koodous API methods, check it out:

[pykoodous.py](https://github.com/Koodous/Scripts/blob/master/pykoodous.py)
