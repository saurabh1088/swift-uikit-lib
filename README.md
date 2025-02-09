# swift-uikit-lib

## Learnings

### Issue : NSInternalInconsistencyException - Could not load NIB in bundle

Detailed error :
```
"Terminating app due to uncaught exception 'NSInternalInconsistencyException', reason: 'Could not load NIB in bundle: 'NSBundle'"
```

Resolution :

1. Needed to give xib reference in Package.swift file like below

```
    .target(
        name: "SwiftUIKitLib",
        resources: [.process("SingleDetailTableViewCell.xib")]),
    .testTarget(
        name: "SwiftUIKitLibTests",
        dependencies: ["SwiftUIKitLib"],
        // Terminating app due to uncaught exception 'NSInternalInconsistencyException', reason: 'Could not load NIB in bundle: 'NSBundle. Still not working
        resources: [
            .process("../../Sources/SwiftUIKitLib/SingleDetailTableViewCell.xib")
        ]
    )
```

2. In test target while loading nib from Bundle, the Bindle should not be passed
as nil

```
let nib = UINib(nibName: "SingleDetailTableViewCell", bundle: Bundle.module)
sut = nib.instantiate(withOwner: nil, options: nil)[0] as? SingleDetailTableViewCell
```


### Issue : this class is not key value coding-compliant for the key

Detailed error :
```
"Terminating app due to uncaught exception 'NSUnknownKeyException', reason: '[<UITableViewCell 0x10183cc00> setValue:forUndefinedKey:]: this class is not key value coding-compliant for the key detailLabel.'"

```

1. Make sure the xib's Custom Class section has both class and module name set.
If module name is missing then IBOutlets are not properly realised.
