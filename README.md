# CyclicalDependencies

Solve dependencies between two projects that depend on each other.

The projects are as follows:
OldApp
NewApp
CommonApp

Thanks to CommonApp we can register OldApp and NewApp UIViewControllers for their use.

Additionally, through protocol, we can pass information to said ViewControllers without having visibility of their classes.


We can register and recover:
- ViewControllers
- Models (NSObject)
