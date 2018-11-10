# GBAClient

## Usage
```swift
GBAClient.shared.fetch("東野圭吾") { result in
    switch result {
    case .success(let res):
        print(res.items[0].volumeInfo.title)
        print(res.items[0].volumeInfo.authors!)
    case .failure(let error):
        print(error)
    }
}

GBAClient.shared.fetch(search: .author, keyword: "東野圭吾") { result in
    switch result {
    case .success(let res):
        print(res.items[0].volumeInfo.title)
        print(res.items[0].volumeInfo.authors!)
    case .failure(let error):
        print(error)
    }
}
```
