---
title: Create a package
date: February 18, 2024
---

There are two approaches to creating a Swift package. One is by creating a new package in Xcode and the other is with the Swift command line tool.

## Xcode

The first approach is to use Xcode. After launching Xcode 15, select File -> New -> Package from the menu, then choose the Library template. This will create a Xcode project for a stand-alone Swift package. A package can also be created in an existing Xcode project.

## Command line

The second approach to create a Swift package is to use the `swift` command line tool. First create a directory for the package. In that directory, run the command shown below to create a package named "MyPkg". This will create the same files as the Xcode approach. Opening the `Package.swift` file will automatically launch Xcode.

```text
mkdir MyPackage
cd MyPackage
swift package init --type library --name MyPkg
```
