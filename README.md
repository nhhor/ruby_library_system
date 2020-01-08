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
|User should be able to **C**reate new words to the app and it will display (**R**ead) all words entered.|click_on `Add a new word`, fill_in `word_test`, click_on `Go!`|_word_test_|
|User should be able to **U**pdate existing word(s).|click_on `word_test`, click_on `Edit word` fill_in `word_test2`, click_on `Update`| _word_test2_|
|User should be able to **D**elete existing word(s).|click_on `word_test2`, click_on `Edit word` click_on `Delete word`| _There are currently no records to display._|
||||
|User should be able to click on a created word and in the resulting view be able to **C**reate a new definition for that word and it will display (**R**ead) all definitions entered.|... click_on `word_test2`, fill_in `definition_test`, click_on `Add definition` |Word Name: _word_test2_, Word Definitions: _definition_test_|
|User should be able to click on a created definition and add in the resulting view be able to **U**pdate the definition.|... click_on `definition_test`, fill_in `definition_test2`, click_on `Update definition` |Word Name: _word_test2_, Word Definitions: _definition_test2_|
|User should be able to click on a created definition and add in the resulting view be able to **D**elete the definition.|... click_on `definition_test2`, click_on `Delete definition` |Word Name: _word_test2_, Word Definitions: _..._|
||||
||||



## References

## Support and contact details
Contact [example@sample.com](mailto:example@sample.com)

## License
_This This repository is copyright (C) 2019 by Noah Horwitz & Eva Wiedmann and licensed under the GNU General Public License v3.0 [gpl-3.0](https://www.gnu.org/licenses/gpl-3.0.en.html)_.
