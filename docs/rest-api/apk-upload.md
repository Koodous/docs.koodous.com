# APK Upload

Method to get an upload url for an especific sample.

## Resource url/s

* `https://api.koodous.com/apks/:sha256/get_upload_url`

## Parameters

* **:sha256** _sha256 lookup (**Required**)_

## Example request

`https://api.koodous.com/apks/cc489e3296408abbfbd5e2aad0665abd60bae3442d10bcc702a7e8424e547544/get_upload_url`

## Example result
```json
{
    "upload_url":"https://lmcn2.koodous.com/upload/JDSS8lPNBQCed8qOy6gu0CmvsheZhYdQDM6UMPa3Oz7uJSbCRbdez0c9DKxoXUf7P0dobSZUiB2njx4f3xjX1Sq6pJM4Q0NwuokwL7glirbF3sSR8wG0BA0NmIP3+H8g"
}
```

**Note:** The upload url expires after 15 minutes.

## Example in python
```python
import requests

sha256 = "2419c7f2730ecf8944cd4bbd0f3b3157c62f2c3d1f78f6f29e07b4c818c15487"
url_koodous = "https://api.koodous.com/apks/%s/get_upload_url" % sha256
r = requests.get(url=url_koodous, headers={'Authorization': 'Token *****your_token*****'})

requests.post(url=r.json().get('upload_url'), files=files)
```