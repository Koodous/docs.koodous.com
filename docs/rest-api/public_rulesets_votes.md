# Public Rulesets Votes

Method to list votes or vote a ruleset.

## Resource url/s

* `https://api.koodous.com/public_rulesets/:id/votes`

## Object details

* **kind** _Positive or negative_
* **analyst** _Vote's username_


## Resource information

| | |
| ------------- |:-------------:|
| **Response formats** | JSON |
| **Requires authentication** | Yes |
| **Requests per minute** | 100|

## Parameters

* **:id** _id lookup (**Required**)_

```json
{
  "count": 6,
  "next": null,
  "previous": null,
  "results": [
    {
      "kind": "positive",
      "analyst": "user1"
    },
    {
      "kind": "positive",
      "analyst": "user2"
    },
    {
      "kind": "positive",
      "analyst": "user3"
    },
    {
      "kind": "positive",
      "analyst": "user4"
    },
    {
      "kind": "positive",
      "analyst": "user5"
    },
    {
      "kind": "negative",
      "analyst": "user6"
    }
  ]
}
```

## Creation Example request

```
Remote Address:koodous.com
Request URL:https://api.koodous.com/public_rulesets/:id/votes
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