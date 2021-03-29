# intershop-localizations
## Introduction
This project is used to manage localizations of Intershop Commerce Suite that are not part of the General Availability releases.
It is provided "as is" and as a form of collaboration. Everyone is free to contribute.

## Content
### originals
The "originals" folder contains the original localization files created for Intershop in english. The folder structure is
`originals/<version>/<application>/<cartridge>/<localization file>_en.properties`

At the moment, only SLDSystem application is included in this project.
Those files can be used as a reference, and should only be updated by Intershop

### prepared
contains the localization sources. All translation keys for one version and application are grouped in one file, sorted by localization key for easier change management.
example: `7.10.29.1_SLDSystem_en.properties`
This file can be used as a source for a completely new translation.

### prepare.sh
Shell command to create the "prepared" files when a new Intershop version or application is released

### translated
Contains the locliazed version of the files in "prepared". In it there is a directory for each locale that has been translated, and in it all different files for different applications.
example: `translated/it/7.10.29.1_SLDSystem_it.properties`

* The translation should be done supporting all syntax of the Intershop localization framework.
* The file should be kept sorted in order of localization keys to easily identify changes between different versions
* The file should contain only ASCII caracters, so every Unicode letter should be unicode escaped, i.e. `key=Hej d\u00c5` [Example](https://www.mobilefish.com/services/unicode_escape_sequence_converter/unicode_escape_sequence_converter.php)

## Usage
The localization files can be used in custom project by putting them into the localization folder of any custom cartridge belonging specifically to the referenced application. For more details and options, see Intershop localization framework.

## More info
This project is an initiative of an employee of Intershop, but not officially supported and mantained by Intershop Communications.
For more information contact [m.boffardi@intershop.com](mailto:m.boffardi@intershop.com).

