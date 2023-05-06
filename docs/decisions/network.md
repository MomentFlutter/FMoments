# Network

Status: [ accepted ] \
Deciders: [Chinnasamy Chinnaraj]\
Date: [2023-01-24]\
Technical Story: [https://github.com/Regional-IT-India/catalyst-getting-started/issues/5#issue-1347223761]

### Context

- Why to choose monorepo over multiple repo?

### Considered Options

- [Dio](https://pub.dev/packages/dio)
- [http](https://pub.dev/packages/http)

### Comparison of the Options

| Dio                                              | http                                    |
|--------------------------------------------------|-----------------------------------------|
| Have centralized configuration                   | Does not have centralized configuration |
|                                                  |                                         |
| Does not have to provide url, path response type | Have to provide url, path response type |
|                                                  |                                         |
| Have interceptors, to modify info like error     | Does not have interceptors              |
| messaging, or any parsing                        |                                         |
|                                                  |                                         |
| Have abort controller and does not have to write | Does not have such features and have to |
| endpoint directly, it can be automated.          | write lot of code                       |

### Recommendation

In this Flutter starter kit we are using Dio package for http client because Dio is a powerful HTTP client for dart,
which supports Interceptors, Global configuration, FormData, Request cancellation, File downloading, Timeout, etc.
By comparing the http package with Dio, Dio provides an intuitive API for performing advanced network tasks with
minimal effort.
