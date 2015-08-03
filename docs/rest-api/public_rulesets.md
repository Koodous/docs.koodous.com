# Public Rulesets

## Resource url/s

* `https://koodous.com/api/public_rulesets`
* `https://koodous.com/api/public_rulesets/:id`

## Object details

* **id** _Ruleset ID_
* **active** _Ruleset is active or not._
* **created_on** _The date when ruleset was created on koodous._
* **detections** _Total APK detections for this ruleset._
* **modified_on** _The date when comment was modified._
* **name** _Ruleset's name._
* **privacy** _Ruleset's privacy (public or private)._
* **rules** _The ruleset content._
* **send_notifications** _The ruleset will notify detections or not._
* **social** _The ruleset is inside the Koodous detection system._

## Resource information

| | |
| ------------- |:-------------:|
| **Response formats** | JSON |
| **Requires authentication** | Yes |
| **Requests per minute** | 60|

## Parameters

* **:sha256** _sha256 lookup (**Required**)_
* **?page** _Specify page of current results_
* **?page_size** _A value of users votes_

Examples:

* `https://koodous.com/api/public_rulesets`
* `https://koodous.com/api/public_rulesets?page=1&page_size=10&active=True&privacy=public&ordering=-modified_on`

## Example request

`https://koodous.com/api/public_rulesets?page=1&page_size=10&active=True&privacy=public&ordering=-modified_on`

## Example result
```json
{
    "count": 1,
    "next": null,
    "previous": null,
    "results": [
        {
            "id": 497,
            "created_on": 1431685981,
            "modified_on": 1431685981,
            "name": "New Ruleset",
            "rules": "rule silent_banker : banker\n{\n\tmeta:\n\t\tdescription = \"This is just an example\"\n\t\tthread_level = 3\n\t\tin_the_wild = true\n\n\tstrings:\n\t\t$a = {6A 40 68 00 30 00 00 6A 14 8D 91}\n\t\t$b = {8D 4D B0 2B C1 83 C0 27 99 6A 4E 59 F7 F9}\n\t\t$c = \"UVODFRYSIHLNWPEJXQZAKCBGMT\"\n\n\tcondition:\n\t\t$a or $b or $c\n}",
            "active": false,
            "privacy": "public",
            "social": false,
            "deleted": false,
            "send_notifications": true,
            "detections": 0,
            "rating": 0,
        }
    ]
}
```

## Ruleset creation
```
Remote Address:koodous.com
Request URL:https://koodous.com/api/public_rulesets
Request Method:POST
Status Code:201 CREATED
```

Payload example:

```json
{"active":true, name: "New Ruleset", rules: ""rule silent_banker : banker\n{\n\tmeta:\n\t\tdescription = \"This is just an example\"\n\t\tthread_level = 3\n\t\tin_the_wild = true\n\n\tstrings:\n\t\t$a = {6A 40 68 00 30 00 00 6A 14 8D 91}\n\t\t$b = {8D 4D B0 2B C1 83 C0 27 99 6A 4E 59 F7 F9}\n\t\t$c = \"UVODFRYSIHLNWPEJXQZAKCBGMT\"\n\n\tcondition:\n\t\t$a or $b or $c\n}"}
```

## Ruleset Update
```
Remote Address:koodous.com
Request URL:https://koodous.com/api/public_rulesets/:id
Request Method:PATCH
Status Code:200 OK
```

Payload example:

```json
{"active":true, name: "New Ruleset", rules: ""rule silent_banker : banker\n{\n\tmeta:\n\t\tdescription = \"This is just an example\"\n\t\tthread_level = 3\n\t\tin_the_wild = true\n\n\tstrings:\n\t\t$a = {6A 40 68 00 30 00 00 6A 14 8D 91}\n\t\t$b = {8D 4D B0 2B C1 83 C0 27 99 6A 4E 59 F7 F9}\n\t\t$c = \"UVODFRYSIHLNWPEJXQZAKCBGMT\"\n\n\tcondition:\n\t\t$a or $b or $c\n}"}
```

## Ruleset deletion

```
Remote Address:koodous.com
Request URL:https://koodous.com/api/public_rulesets/:id
Request Method:DELETE
Status Code:204 NO CONTENT
```