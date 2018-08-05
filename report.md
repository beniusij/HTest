# Multi-path Story Builder

This short report provides an overview on application specifications, design 
& implementation, and my opinion about applicant's qualities assessed in this test.

## Instructions

1. Unzip the package
2. In the terminal, execute following commands: 
    1. `gem install bunlder`
    2. `cd` to the project directory
    3. `bundler install`
    4. Run `ruby story_builder.rb` command
4. In the browser of your choice, go to `http://localhost:4567`

### Prerequisites
 
* Ruby v1.8^

## Application design and implementation

### Project Requirements

1. A sentence can have up to 4 possible next sentences, every following 
sentence can have up to 4 more sentences and so on.
2. Database should not be used. Instead, data should be persist in-memory. 
3. When clicked on 'Back to the start.' link, starting sentence should 
displayed with added paths. 

### Design

According to the requirements, the visualisation of the data structure will look
similarly to the diagram below. Furthermore, the application should enable 
adding new sentence anywhere in the tree and selecting one. 

                    ___Sentence___
                   /              \
                  /                \
            Sentence            Sentence
            /     \                 |
           /       \                |
       Sentence Sentence        Sentence
                               /    |   \
                              /     |    \
                       Sentence Sentence Sentence
   
`Tree` abstract data type is used for applications where data nodes are stored in 
a hierarchy similar to the diagram above and has methods for manipulating and 
traversing the data in the hierarchy. Thus, `Tree` ADT was selected for implementing 
the application. 

### Implementation

As mentioned above, `Tree` ADT was implemented to achieve the functionality specified.
`Sentence` class represents the tree node and it has `sentence` and `options` properties.
The `sentence` holds a `String` value and `options` is an array for subsequent `Sentence`
objects. `Story` class represents the tree structure which contains the `root` node and
a pointer to the `current` sentence presented to the viewer. 

`story_builder.rb` file contains the routes, views and processes the data. Generally, that
is a poor practise and these should be split into separate files. However, given 

## Shortcuts

Following lists out shortcuts used in this project, which usually should 
be avoided, but were used to achieve greater efficiency. 

* Class scope variables were used for `Story` and `Sentences` objects 
instead of persisting those in sessions
* Views and controller were coded in the same file, which usually should
should have been split into `Views` and `Controllers` respectively to
implement Model-View-Controller patter which is a standard for web applications.

## List of properties

The following displays a list of properties this test assesses:
* Ability to write functioning and dynamic code
* Solution-oriented mindset
* Theoretical knowledge application in practise
* Application structure planning
* Fulfilling the project requirements on time
* Project documentation