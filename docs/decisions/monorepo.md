# Monorepo
Status: [ accepted ] \
Deciders: [Chinnasamy Chinnaraj]\
Date: [2022-08-26]\
Technical Story: [https://github.com/Regional-IT-India/catalyst-getting-started/issues/5#issue-1347223761]

### Context

- Why to choose monorepo over multiple repo?

### Considered Options

- [monorepo](https://monorepo.tools/)
- multiple repo

### Comparison of the Options

| Monorepo                                     |  Multiple repo                                        |
| -------------------------------------------  | ----------------------------------------------------- |
| All the code of all the projects of an       | Each service and project have a separate              |
| organization resides in a central repository | repository.                                           |
|                                              |                                                       |
| Developers can easily share libraries, APIs, | Any changes to libraries and other common code should |
| and other common code as they are updated in |  be periodically synced to avoid issues later         |
| the central repository                       |                                                       |
|                                              |                                                       | 
| Managing dependencies in monorepo is easy    | Managing dependencies in multiple repo is complicated |
|                                              |                                                       |
| Standardisation is easier for monorepo       |  For multiple repo having one standardisation can be  |
|                                              |  difficult                                            |

### Recommendation

In this Flutter starter kit we are using Monorepo folder structure because Monorepo have single repository which contents single codebase, dependencies and libraries.
