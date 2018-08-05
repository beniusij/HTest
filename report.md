# Multi-path Story Builder

This short report provides an overview on application specifications, design 
& implementation, and my opinion about applicant's qualities assessed in this test.

## Instructions

1. Unzip the package
2. In the terminal, execute following commands: 
    1. `gem install bunlder`
    2. `cd` to the project directory
    3. `bundler install`
    4. Run `rackup configure.ru` command
4. In the browser of your choice, go to `http://localhost:9292`

### Prerequisites
 
* Ruby version >= 2.2.0

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
a hierarchy similar to the diagram shown above and has methods for manipulating and 
traversing the data in this data structure. Thus, `Tree` ADT was selected for 
implementing the application. 

Web applications follow Model-View-Controller pattern. The project will aim to 
use the structure proposed in this pattern. The diagram below shows that
the tree components a split into individual directories. 

    *
    |- controllers
    |   |- ApplicationController
    |   +- StoryController
    |- models
    |   |- Sentence
    |   +- Story
    |- Views
    |   |- Layout
    |   |- Form
    |   +- Link
    +- configure.ru

Controller contains `ApplicationController` as a base controller for the app 
and `StoryController` which inherits the first one. Models folder contains files
for `Sentence` and `Story` classes that are created and processed by the `StoryController`.
Lastly, Views folder contains of a base view `Layout` and partials rendered in the main 
view. `Configure.ru` contains the configuration for running the application.

### Implementation

As mentioned above, `Tree` ADT was implemented to achieve the functionality specified.
`Sentence` class represents the tree node and it has `sentence` and `options` properties.
The `sentence` holds a `String` value and `options` is an array for subsequent `Sentence`
objects. `Story` class represents the tree structure which contains the `root` node and
a pointer to the `current` sentence presented to the user. 

The `ApplicationController` was added as a base controller for the app so all necessary
files and dependencies would be required there and could be inherited by the sub-controllers
when developing and adding new features. In this case, `StoryController`
inherits it as well as handles requests and processes the data submitted. `Sessions` 
are used to persist the story in the web server.

Lastly, `layout` views is used as a base view and consist of HTML content that does not 
change. Meanwhile, `link` and `form` partials are rendered based on set criteria in the
`layout` view. 

## Shortcuts

Following lists out shortcuts used in this project, which usually should 
be avoided, but were used to achieve greater efficiency. 

* Internal style sheet was used inside `<head>` to make table borders visible.
Usually any CSS should be in external file and included in views using `<link>` tags.
* Not all `Tree` methods are implemented, since they are not required given the 
application's requirements.
* Tests are not used to reduce development time. 

## List of properties

The following displays a list of properties this test assesses:
* Ability to write functioning and dynamic code
* Solution-oriented mindset
* Theoretical knowledge application in practise
* Application structure planning
* Fulfilling the project requirements on time
* Project documentation