
Version control systems are important to all software development companies, and has been in use since the 1970s. Its origins can be found in local source code management on a mainframe computer with connected terminals, for example Source Code Control System (SCCS) released in 1977.

There are two main types of Version Control Systems - Centralized and Distributed

### Centralized Version Control System - CVCS

The general concept of a Centralized Version Control System is that it works on a Client-Server relationship. The repository is located at one place and servers provides latest code and grant access to the all the clients, allowing them to work with code using either locking or merging to handle synchronization.

The challenges with a CVCS are for example:

-   Network connection is required to work on the source code
-   Developers must ask for permission in order to contribute to a project
-   A single point of failure is an issue when using one server

### Distributed Version Control System - CVCS

Distributed systems on the other hand, let the user download a copy of the repository locally on their computer. So, in a Distributed Version Control System, every user has a local copy of the repository in addition to the central repo on the server side. Distributed Version Control provides flexibility and has emerged with the concept that everyone has their own repository, they don’t just check out the snapshot of the code – they fully mirror the central repository.

Open Source community has played a significant role in development and growth of DVCSs. Originally, systems like Mercurial and Git were developed as a reaction to changes in licensing of BitKeeper ([https://www.bitkeeper.org/](https://www.bitkeeper.org/)), one of the first distributed solutions. Under new license provisions introduced in 2006, BitKeeper was no longer free to use. These tools have been adapted to open source projects to fit their specific needs. Some of the most important factors for open source projects are being able to work offline, using changesets instead of full versions, and flexibility in using different workflow models.

Advantages of DVCS include:

-   Allows users to work when not connected to a network.
-   C for DVCS, because there is no need to communicate with a central server. With DVCS,
-   Network communication is only necessary when sharing changes among other users making common operations, such as commits, viewing history, and reverting changes, faster.
-   Allows private work, so users can use their changes even for early drafts they do not want to publish.
-   Working copies effectively function as remote backups, which avoids relying on one physical machine as a single point of failure.
-   Allows for a centralized control of the "release version" of the codebase.


**Today, many of these workflows can be found in enterprise organizations and Distributed Version Control Systems seem to be the most popular choice among many developers and teams.**