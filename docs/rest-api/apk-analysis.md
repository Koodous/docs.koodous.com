# APK Analysis

Method to get an apk's analysis report.

## Resource url/s

* `https://api.koodous.com/apks/:sha256/analysis`

## Parameters

* **:sha256** _sha256 lookup (**Required**)_

## Example request

`https://api.koodous.com/apks/cc489e3296408abbfbd5e2aad0665abd60bae3442d10bcc702a7e8424e547544/analysis`

## Example in python

```python
import requests
import urllib

sha256 = "2419c7f2730ecf8944cd4bbd0f3b3157c62f2c3d1f78f6f29e07b4c818c15487"

url_koodous = "https://api.koodous.com/apks/%s/analysis" % sha256
r = requests.get(url=url_koodous)
r.json()
```
[Check pykoodous.py, a python API manager script](https://github.com/Koodous/Scripts/blob/master/pykoodous.py).


# Analysis request

If you want to request an APK analysis you need an [API token](/rest-api/getting-started/).

## Example request

`https://api.koodous.com/apks/cc489e3296408abbfbd5e2aad0665abd60bae3442d10bcc702a7e8424e547544/analyze`

## Example in python

```python
import requests
import urllib

sha256 = "2419c7f2730ecf8944cd4bbd0f3b3157c62f2c3d1f78f6f29e07b4c818c15487"

url_koodous = "https://api.koodous.com/apks/%s/analyze" % sha256
r = requests.get(url=url_koodous, headers={'Authorization': 'Token %s' % "YOURTOKENHERE"})
r.json()
```