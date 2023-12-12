# vcpkg-registry
[![CodeFactor](https://img.shields.io/codefactor/grade/github/Iswenzz/vcpkg-registry?label=codefactor&logo=codefactor)](https://www.codefactor.io/repository/github/iswenzz/vcpkg-registry)
[![License](https://img.shields.io/github/license/Iswenzz/vcpkg-registry?color=blue&logo=gitbook&logoColor=white)](https://github.com/Iswenzz/vcpkg-registry/blob/master/LICENSE)

A repository for managing vcpkg ports of my libraries as well as dependencies not yet included in vcpkg. It provides a convenient way to distribute and use these ports within your development environment when working with the [vcpkg](https://github.com/microsoft/vcpkg) package manager.

## Instructions
Configure your **vcpkg-configuration.json** file.

```json
{
    "default-registry": {
        "kind": "git",
        "repository": "https://github.com/microsoft/vcpkg",
        "baseline": "4a600e9fea71bd7872080cbb716797e04d30e6d3"
    },
    "registries": [
        {
            "kind": "git",
            "repository": "https://github.com/Iswenzz/vcpkg-registry",
            "packages": ["ADD_PACKAGES_HERE"],
            "baseline": "c12eb749ee43da80e9951717c334059a50bbdf5b"
        }
    ]
}
```

# Test ports
	vcpkg install cod4dm1 --overlay-ports=ports/cod4dm1 --editable --triplet=x64-windows

# Add ports
	git add ports/cod4dm1
	git commit -m "Port: CoD4DM1"
	git rev-parse HEAD:ports/cod4dm1
	git add versions
	git commit --amend --no-edit

## Contributors
***Note:*** If you would like to contribute to this repository, feel free to send a pull request, and I will review your code.
Also feel free to post about any problems that may arise in the issues section of the repository.
