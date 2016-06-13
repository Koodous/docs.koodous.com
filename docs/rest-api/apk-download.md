# APK Download

Method to get a download url of an especific sample.

## Resource url/s

* `https://api.koodous.com/apks/:sha256/download`

## Parameters

* **:sha256** _sha256 lookup (**Required**)_

## Example request

`https://api.koodous.com/apks/cc489e3296408abbfbd5e2aad0665abd60bae3442d10bcc702a7e8424e547544/download`

## Example result
```json
{
    "download_url": "https://lmcn2.koodous.com/download/JDSS8lPNBQCed8qOy6gu0ECtSYDJwqmRr8B+lDie0vTPiJZz2IViaj3xiSAsWHh3eJKsc2LkdL0ZLhEyk9P3LJbusF+OxchdicKKyxvCpPyIM2Km7yIou7P7QOCkGajS"
}
```

**Note:** The download url expires after 15 minutes.

## Example in python

```python
import requests
import urllib

sha256 = "2419c7f2730ecf8944cd4bbd0f3b3157c62f2c3d1f78f6f29e07b4c818c15487"

url_koodous = "https://api.koodous.com/apks/%s/download" % sha256
r = requests.get(url=url_koodous, headers={'Authorization': 'Token *****your_token*****'})

if r.status_code is 200:
    testfile = urllib.URLopener()
    testfile.retrieve(r.json().get('download_url'), ffile)

```
[Check pykoodous.py, a python API manager script](https://github.com/Koodous/Scripts/blob/master/pykoodous.py).
