# Analysts

Method to list koodous's analysts

## Resource url/s

* `https://api.koodous.com/analysts`
* `https://api.koodous.com/analysts/:username`

## Object details

* **username** _Analyst's Username_
* **first_name** _Analyst's first name_
* **last_name** _Analyst's last name_
* **date_joined** _Account creation date_
* **last_login** _Last login date_
* **total_public_rulesets** _Number of public analyst's rulesets_
* **total_followers** _Number of followers_
* **total_following** _Total of analyst that the user is following_
* **total_comments** _Total comments written by analyst_
* **avatar_url** Analyst image_
* **occupation** _Occupation_
* **bio** _Bio_
* **twitter_user** _Username in twitter_

## Resource information

| | |
| ------------- |:-------------:|
| **Response formats** | JSON |
| **Requires authentication** | Yes |
| **Requests per minute** | 500|

## Parameters

* **:username** _Username lookup (**Required for analyst detail request**)_
* **?page** _Specify page of current results_
* **?page_size** _A value of users votes_

Examples:

* `https://api.koodous.com/analysts?page=1&page_size=5`
* `https://api.koodous.com/analysts/user1`

## Example request

`https://api.koodous.com/apks/analysts`

## Example result
```json
{
    "count": 1,
    "next": null,
    "previous": null,
    "results": [
        {
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
        },
    ]
}
```

## Update analyst info

An analyst can edit his profile information with the next example request:

```
Remote Address: koodous.com
Request URL: https://api.koodous.com/analysts/user1
Request Method: PATCH
Status Code: 200 OK
```

Payload and response should looks like following:

```json
{
    "first_name": "Andrew",
    "last_name": "Smith2"
}x
```

## Analyst extra methods

Analyst related info can be accesed from `/analysts/:username`.

* GET `/analysts/:username/followers` Analysts list following requested username
* GET `/analysts/:username/following` Analysts list followed by requested username
* GET `/analysts/:username/comments` Comments written by requested username
* GET `/analysts/:username/activity` Requested username activity
* GET `/analysts/:username/rulesets` Public rulesets of requested username
* GET `/analysts/:username/follow` Start following analyst
* GET `/analysts/:username/unfollow` Stop following analyst