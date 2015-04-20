# APKs

This method returns a paginated list of apks

## Resource url/s

* `https://koodous.com/api/apks`
* `https://koodous.com/api/apks/:sha256`


## Object details

* **created_on** The date when apks was created on koodous.
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