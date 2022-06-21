# PopularArticles

A simple app to hit the NY Times Most Popular Articles API and:
* Show a list of articles newest first(sorted based on date)
* Shows details when items on the list are tapped. 


We'll be using the most viewed section of this API.
http://api.nytimes.com/svc/mostpopular/v2/mostviewed/{section}/{period}.json?apikey= sample-key To test this API, 
For testAPI we used 
* all-sections for the section path component in the URL
* 7 for period

## Tools And Resources Used

- [Package](https://developer.apple.com/documentation/swift_packages) - Swift Package Manager, or SPM, lets you manage your project dependencies, allowing you to import libraries into your applications with ease.

# Installation

* Installation by cloning the repository
* Go to directory
* use command + B or Product -> Build to build the project
* Press run icon in Xcode or command + R to run the project on Simulator


# Architecture

 This project uses MVVM design pattern and project is developed in Swift5.
