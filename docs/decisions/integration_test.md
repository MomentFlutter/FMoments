# Integration Test
Status: [ ] \
Deciders: [Chinnasamy Chinnaraj]\
Date: [2023-04-06]\
Technical Story: [https://github.com/Regional-IT-India/catalyst-ui-flutter-starter/issues/27#issue-1616360326]

### Context

- Why to choose `integration_test` for integration testing ?

### Considered Options

- Integration test
- Appium

### Comparison of the Options

| Appium test                                  | Integration test                                     |
| -------------------------------------------  | -----------------------------------------------------|
| Appium test automation is a black-box testing| Flutter Integration Test can be considered a grey-box|
| approach.                                    | testing approach.                                    | 
|                                              |                                                      |
| Appium supports variety of languages like    | Integration test is written in dart therefore        |
|  java, python, ruby and kotlin.              | developers can write tests using same language       |
|                                              | and tools.                                           |
|                                              |                                                      |
| Appium supports automating tests for Android,| Flutter Integration Test supports automating tests   |
| iOS and Windows desktop applications.        | for Android, iOS, Web, and Desktop applications      |
| the central repository                       | across Windows, Mac and Linux platforms.             |
|                                              |                                                      | 
| Appium is in the beginning stage to support  | Easy to locate elements and to add missing locators. |
| Flutter applications.At the moment it is not | Given test code is part of the application’s code, we|
| robust to recognize all the widgets.         | have the flexibility to add locators to widgets.     |
|                                              |                                                      |
| Does not have an inbuilt performance         | Flutter Dev Tools enable us with performance         |
| monitoring capability to monitor memory,     | monitoring capability along with network calls,      |
| battery, CPU, Network calls.                 | logs and more                                        |

### Recommendation

In this Flutter starter kit we are using integration_test which is provided by flutter, because it support dart language so developer can use same langguage and tools to write test cases and it's easier to locate elements as well as we have flexibility to add locators widgets since test code is part part of application code.

