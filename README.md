# Tellah

Swift HTTP utility framework for Foundation's URL loading system.

## Request Protocol

GET request.

```
struct FetchUserRequest: Request {
    let method = HTTPMethod.GET
    var url: NSURL {
        return NSURL(string: "/users/\(userID)")!
    }
    let userID: String
    
    init(userID: String) {
        self.userID = userID
    }
}

let urlRequest: NSURLRequest = FetchUserRequest(userID: "12345").urlRequestValue

```

POST request.

```
struct AddUserRequest: Request {
    let method = HTTPMethod.POST
    let url = NSURL(string: "/users")!
    let headers: [String: String] = [HTTPHeaderField.ContentType: HTTPContentType.JSON]
    let body: NSData? = ["user": "foo"].jsonEncodedData
}
```

## NSMutableURLRequest

```
extension NSMutableURLRequest {
    public func setQueryParameters(parameters: [String : String])

    public func setJSON(json: AnyObject, options: NSJSONWritingOptions) throws

    public func setJSON(json: AnyObject) throws
}
```

## Session
