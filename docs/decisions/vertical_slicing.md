# Vertical Slicing
Status: [ accepted ] \
Deciders: [Chinnasamy Chinnaraj]\
Date: [2022-08-26]\
Technical Story: [https://github.com/Regional-IT-India/catalyst-getting-started/issues/5#issue-1347223761]

### Context

- Should we choose vertical slicing or horizontal slicing?

### Considered Options

- Horizontal Slicing
- Vertical Slicing

### Comparison of the Options

| Horizontal Slicing                           |  Vertical Slicing                                     |
| -------------------------------------------  | ----------------------------------------------------- |
| The stakeholder must wait until the entire   | The stakeholder gets value sooner                     |
| system is deployed before realizing value    |                                            |
|                                              |                                                       |
| You’re adding to existing functionality in   | New feature requests require new ways of thinking     |
| an incremental fashion                       |  about existing functionality                         |
|                                              |                                                       | 
| Stakeholders feedback might leads to change  | Stakeholder feedback allows for changes earlier in |
| entire system                                | the project


### Recommendation

In this Flutter starter kit we are using Vertical Slicing for software development because in Vertical Slicing each resulting story provides some sort of meaningful value to the user. This not only makes them easier to test, but they also become easier for the customer to interact with to provide feedback and guidance for our next sprint.