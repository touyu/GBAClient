# GBAClient

## Usage
```swift
GBAClient.shared.fetch("東野圭吾") { result in
    switch result {
    case .success(let res):
        dump(res)
    case .failure(let error):
        print(error)
    }
}

GBAClient.shared.fetch(search: .author, keyword: "東野圭吾") { result in
    switch result {
    case .success(let res):
        dump(res)
    case .failure(let error):
        print(error)
    }
}
```
