# APK Votes

Method to vote an APK sample

## Resource url/s

* `https://koodous.com/api/apks/:sha256/votes`

## Resource information

| | |
| ------------- |:-------------:|
| **Response formats** | JSON |
| **Requires authentication** | Yes |
| **Requests per minute** | 60|

## Parameters

* **:sha256** _sha256 lookup (**Required**)_

## Example request

```
Remote Address:koodous.com
Request URL:https://koodous.com/api/apks/:sha256/votes
Request Method:POST
Status Code:201 CREATED
```

## Payload options

```json
{kind: "positive"}
```

```json
{kind: "negative"}
```