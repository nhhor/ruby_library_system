# Application: **Ruby Library System**

##### By Noah Horwitz & Eva Wiedmann

###### _First published 2019-01-08_

## Description:
This application was made as part of a coding project for Noah Horwitz & Eva Wiedmann, students at _[Epicodus](http://www.epicodus.com)_, a vocational school for technology careers based in Portland, OR. The project is designed to create an application that Make a program to catalog a library's books and let patrons check them out.


<!-- This project is fully deployed on **Heroku** [here](https://make-a-word-foundation.herokuapp.com/) -->

## Setup/Installation instructions:
* Click the `Clone or download` button and copy the link.
* Open your terminal application (assuming **GIT Scripts** and **node.js** (with NPM), and **Ruby 2.5.1** have been installed on your system) and type `git clone (link)`.
* In the terminal using the `cd`... command, navigate to the newly created repository and run `bundle install`.
* Then in the terminal, run `app.rb`.


## Technologies Used
> `Ruby`
> `Ruby gem Sinatra`

## Known Bugs
* None

## Behavior Driven Development Specifications

|Spec|Input|Output|
|-|-|-|
||||


CREATE DATABASE nova_library;
\c nova_library;
CREATE TABLE books (id serial PRIMARY KEY, name varchar);
<!-- CREATE TABLE songs (id serial PRIMARY KEY, name varchar, book_id int); -->

CREATE TABLE patrons (id serial PRIMARY KEY, name varchar);

CREATE TABLE books_patrons (id serial PRIMARY KEY, patron_id int, book_id int);

DROP DATABASE nova_library_test;

CREATE DATABASE nova_library_test WITH TEMPLATE nova_library;



## References

## Support and contact details
Contact [example@sample.com](mailto:example@sample.com)

## License
_This This repository is copyright (C) 2019 by Noah Horwitz & Eva Wiedmann and licensed under the GNU General Public License v3.0 [gpl-3.0](https://www.gnu.org/licenses/gpl-3.0.en.html)_.

## TASKS
practice database dump
1-many
rake homework for dump / creation
