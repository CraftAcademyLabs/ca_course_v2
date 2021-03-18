REQUEST: `{"analysis": {"resource": "Are you fucking stupid???", "category": "text"}}`

RESPONSE:
```json
{
    "id": 2,
    "category": "text",
    "resource": "Are you fucking stupid???",
    "results": {
        "text": "Are you fucking stupid???",
        "external_id": null,
        "error": "false",
        "classifications": "[{\"tag_name\"=>\"profanity\", \"tag_id\"=>57725627, \"confidence\"=>0.967}]"
    },
    "request_ip": "81.235.198.199",
    "created_at": "2021-02-07T21:42:32.039Z",
    "updated_at": "2021-02-07T21:42:32.039Z"
}
```
REQUEST: `{"analysis": {"resource": "You seem like a nice chap, my dear friend!", "category": "text"}}`

RESPONSE:
```json
{
    "id": 3,
    "category": "text",
    "resource": "You seem like a nice chap, my dear friend!",
    "results": {
        "text": "You seem like a nice chap, my dear friend!",
        "external_id": null,
        "error": "false",
        "classifications": "[{\"tag_name\"=>\"clean\", \"tag_id\"=>57725628, \"confidence\"=>0.882}]"
    },
    "request_ip": "81.235.198.199",
    "created_at": "2021-02-07T21:43:53.239Z",
    "updated_at": "2021-02-07T21:43:53.239Z"
}
```