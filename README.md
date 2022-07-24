# SulliedLocation

A package written to help with detailed Location data on iOS that makes use of the [Combine](https://developer.apple.com/documentation/combine/) and [SwiftUI](https://developer.apple.com/documentation/swiftui/) frameworks. Use this package to create a [Publisher](https://developer.apple.com/documentation/combine/publisher) that publishes any Location values it receives from the system. It also contains a SwiftUI view that allows a user to control to toggle the collection of Location data.

This project is a work in progress. Publishing more anonymous and useful data is a work in progress. The goal is to publish relative position data instead of the full geodetic position provided by the system. Optionally processing this data to improve accuracy by combining multiple measurements and using knowledge of past and future positions. There is more interest in an accurate measurement of position derivatives such as velocity and distance than geodetic position.

Replacing Combine with support for the built-in [Swift async/await](https://docs.swift.org/swift-book/LanguageGuide/Concurrency.html) asynchronous functionality is being considered. Perhaps support for both methods will be kept.
