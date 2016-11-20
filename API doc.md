# Flight-Planner API
## GET /routes
 
**Response:** 
 - Status code: 200
sample Response:

 ```json
   [
      {"id":10,
      "name":"SF-LA",
      "distance":1000.0,
      "user_id":1,
      "created_at":"2016-11-20T02:34:48.697Z",
      "updated_at":"2016-11-20T02:34:48.697Z"
      },
      {"id":11,
      "name":"NY-LA",
      "distance":1000.0,
      "user_id":1,
      "created_at":"2016-11-20T02:34:48.697Z",
      "updated_at":"2016-11-20T02:34:48.697Z"
      }
  ]
 ```
 
  
  ## GET /routes/:id
 
**Response:** 
 - Status code: 200
sample Response:

 ```json
   {
      "route":{
      "id":10,
      "name":"SF-LA",
      "distance":1000.0,
      "user_id":1,
      "created_at":"2016-11-20T02:34:48.697Z",
      "updated_at":"2016-11-20T02:34:48.697Z"
      },
      "nodes":[{
              "id":8,
      		"lat":23.0,
              "long":43.0,
              "route_id":13,
              "created_at":"2016-11-20T19:55:58.034Z",
              "updated_at":"2016-11-20T19:55:58.034Z"},
              {"id":9,
              "lat":34.0,
              "long":55.0,
              "route_id":13,
              "created_at":"2016-11-20T19:56:04.117Z",
              "updated_at":"2016-11-20T19:56:04.117Z"}
            ]
   }
```


  ## POST /routes
  **Body Params**
  - name:string
  - distance:float
  - user_id:number

**Response:** 
 - Status code: 200
sample Response:

 ```json
   
     {
      "id":10,
      "name":"SF-LA",
      "distance":1000.0,
      "user_id":1,
      "created_at":"2016-11-20T02:34:48.697Z",
      "updated_at":"2016-11-20T02:34:48.697Z"
      }
   
 ```
 
 
  ## PUT /routes/:id
  **Body Params**
  - name:string
  - distance:float
  - user_id:number

**Response:** 
 - Status code: 200
sample Response:

 ```json
   
      {
      "id":10,
      "name":"SF-LA",
      "distance":1000.0,
      "user_id":1,
      "created_at":"2016-11-20T02:34:48.697Z",
      "updated_at":"2016-11-20T02:34:48.697Z"
      }
   
 ```


 ## DELETE /routes/:id

**Response:** 
 - Status code: 200
sample Response:

 ```json
   
     {
      "id":10,
      "name":"SF-LA",
      "distance":1000.0,
      "user_id":1,
      "created_at":"2016-11-20T02:34:48.697Z",
      "updated_at":"2016-11-20T02:34:48.697Z"
      }
   
 ```

## DELETE /routes/:id/nodes/clear
clears all the nodes assocciated to a route without deleting the route
**Response:** 
 - Status code: 200
sample Response:
```json
{"success":"all nodes are deleted"}
```

POST /routes/:id/nodes
**Body Params **
- lat : float
- long; float
- 
**Response:** 
 - Status code: 200
sample Response:

```json
{    "id":12,
     "lat":23.0,
     "long":2300000.0,
     "route_id":13,
     "created_at":"2016-11-20T20:35:29.992Z",
     "updated_at":"2016-11-20T20:35:29.992Z"
}
```