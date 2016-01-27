# Public Rulesets Comments

Method to list rulesets comments with pagination

## Resource url/s

* `https://api.koodous.com/public_rulesets/:id/comments`

## Object details

* **id** _Comment ID_
* **author** _Analyst object ([analysts](/rest-api/analysts/))_
* **apk** _APK sha256 hash_
* **created_on** _The date when comment was created on koodous_
* **modified_on** _The date when comment was modified_
* **text** _The comment's content_

## Resource information

| | |
| ------------- |:-------------:|
| **Response formats** | JSON |
| **Requires authentication** | Yes |
| **Requests per minute** | 100|

## Parameters

* **:id** _Id lookup (**Required**)_
* **?page** _Specify page of current results_
* **?page_size** _A value of users votes_

Examples:

* `https://api.koodous.com/public_rulesets/123/comments`
* `https://api.koodous.com/public_rulesets/123/comments?cursor=cD0yMDE1LTA3LTA4KzE0JTNBMTAlM0E1MyUyQjAwJTNBMDA%3D`

## Example request

`https://api.koodous.com/public_rulesets/123/comments`

## Example result
```json
{
    "count": 1,
    "next": null,
    "previous": null,
    "results": [
        {
            "id": 114,
            "author": {
                "username": "user1",
                "first_name": "Robert",
                "last_name": "Smith",
                "date_joined": 1414423670,
                "last_login": 1429694015,
                "total_public_rulesets": 1,
                "total_followers": 3,
                "total_following": 6,
                "total_comments": 27,
                "avatar_url": "/media/avatars/116585.jpg",
                "occupation": "Malware analyst",
                "bio": "Malware analyst",
                "twitter_user": "",
                "can_invite": true
            },
            "ruleset": 123,
            "created_on": 1429698724,
            "modified_on": 1429698724,
            "text": "test"
        }
    ]
}
```

## Comment creation

Comment creation can be done with the next request:

```
Remote Address: koodous.com
Request URL: https://api.koodous.com/public_rulesets/:id/comments
Request Method: POST
Status Code: 201 CREATED
```

Payload should looks like following:

```json
{"text": "test2"}
```

## Comment deletion

A comment can be delete if the authenticated user is the owner. The request should looks like following:

```
Remote Address: koodous.com
Request URL: https://api.koodous.com/public_rulesets/:id/comments/:id
Request Method: DELETE
Status Code: 204 NO CONTENT
```