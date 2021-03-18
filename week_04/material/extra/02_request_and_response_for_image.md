## Image

### An happy image

REQUEST: `{"analysis": {"resource": "https://i.dailymail.co.uk/i/pix/2012/02/06/article-0-0CD054CA00000578-89_1024x615_large.jpg", "category": "image"}}`

RESPONSE:
```json
{
    "id": 4,
    "category": "image",
    "resource": "https://i.dailymail.co.uk/i/pix/2012/02/06/article-0-0CD054CA00000578-89_1024x615_large.jpg",
    "results": {
        "safe": "0.9902439",
        "explicit": "0.008693915",
        "drug": "0.0005571933",
        "suggestive": "0.00039955962",
        "gore": "0.00010545897"
    },
    "request_ip": "81.235.198.199",
    "created_at": "2021-02-07T21:46:52.627Z",
    "updated_at": "2021-02-07T21:46:52.627Z"
}
```
### An inappropriate image

REQUEST: `{"analysis": {"resource": "https://images.unsplash.com/photo-1572648414902-be106c6c826e?ixid=MXwxMjA3fDB8MHxzZWFyY2h8Mnx8bXVyZGVyfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60", "category": "image"}}`

RESPONSE:
```json
{
    "id": 22,
    "category": "image",
    "resource": "https://images.unsplash.com/photo-1572648414902-be106c6c826e?ixid=MXwxMjA3fDB8MHxzZWFyY2h8Mnx8bXVyZGVyfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
    "results": {
        "gore": "0.99999726",
        "safe": "1.0526162e-06",
        "suggestive": "1.0247506e-06",
        "drug": "3.8188062e-07",
        "explicit": "3.2897844e-07"
    },
    "request_ip": "185.176.246.65",
    "created_at": "2021-02-10T15:28:50.575Z",
    "updated_at": "2021-02-10T15:28:50.575Z"
}
```