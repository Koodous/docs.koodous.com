#Getting started

The Koodous public REST API gives you the chance to create your own Koodous client for different platforms.

## Creating an account

You can use our API without authentication token. However, there are some requests that require an user token to be done, such as voting, comment and APK-related. 

In order to get your API token just create your account on koodous and check 
your [user settings page](//koodous.com/settings/profile) to get your access token.

## Authentication

To use the requests that require authentication you need to specify your user token using the `Authorization` header. A request with token `c080ddd1fab46bc919ca0d62299e9995b1886853` should look like the following:

```
GET /apks
Authorization: Token c080ddd1fab46bc919ca0d62299e9995b1886853
```

## Response

Response format is JSON. The example response of the previous request will look like this:

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

## Python example

Here you have an example using Python and [requests library](http://docs.python-requests.org/en/latest/):

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
