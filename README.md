# Enigma

![the-imitation-game-movie-wallpaper-16](https://user-images.githubusercontent.com/65986168/93857776-59bc2900-fc78-11ea-9447-508658b3e78e.jpg)

### BackEnd Mod1 Final Project

#### Table of Contents
----------------------
- [History](https://github.com/abcdefghijohn/Enigma#history) 
- [Overview](https://github.com/abcdefghijohn/Enigma#overview)
- [Encrypting](https://github.com/abcdefghijohn/Enigma#encrypting)
- [Decrypting](https://github.com/abcdefghijohn/Enigma#decrypting) 
- [Self Evaluation](https://github.com/abcdefghijohn/Enigma#self-evaluation) 

#### History 
------------

The Enigma machine is an encryption device developed and used in the early- to mid-20th century but became widely know when it was employed extensively by Nazi Germany during World War II, in all branches of the German military. The Enigma machine was invented by the German engineer Arthur Scherbius at the end of World War I. The device was patented and started being marketed in 1923 as the Enigma machine. 

Pre-war German military planning emphasized fast, mobile forces and tactics, later known as blitzkrieg, which depend on radio communication for command and coordination. Since adversaries would likely intercept radio signals, messages would have to be protected with secure encoding. Compact and easily portable, the Enigma machine filled that need.

![enigma-machine-working](https://user-images.githubusercontent.com/65986168/93857864-7f493280-fc78-11ea-9650-2bc15b70e712.jpg)

The machine itself consists of 4 key parts; the keyboard, plugboard, reflector, and rotors. 
In order to encrypt and decrypt the message both the sender and receiver would need a key and date. The key being a randomly generated 5 digit number
and the date being today's date. 

The sender would input the message into the keyboard which would then be switched around in the plugboard, which is then sent to the three physical rotors
that were wired randomly, in order to add complexity the first rotor would shift one step after each press of the key. The reflector then sends the reflected signal to the lightboard which lights up a corresponding letter based on the key and date. The receiver would then need to use the key and date that the sender used in order to decrypt the message. 

#### Overview
-------------

Create an Enigma machine in ruby that can take a message written in a txt file and encrypt to an encrypted.txt file. Then use the key and date in order to decrypt aformentioned file in to a decrypted.txt file. 

#### Encrypting 
---------------

First write a message that you would like to be encrypted in the `message.txt` file. Then run the command: 

`ruby ./lib/encrypt.rb message.txt encrypted.txt`

Upon which the encrypted text will be written to the `encrypted.txt` file and you will be given a confirmation that looks like this:

`Created encrypted.txt with the key 03211 and date 210920`

In the confirmation message the key and date are given which will be need later for decrypting. 

#### Decrypting 
---------------

In order to decrypt a message, we would run the command like previously in encrypting with the addition of the previously provided key and date.

`ruby ./lib/decrypt.rb encrypted.txt decrypted.txt 03211 210920`

Which would then return the decrypted text into the decrypted.txt file and return the message: 

`Created decrypted.txt with the key 03211 and date 210920`

#### Self Evaluation 
--------------------

|**Category**        |**Score**|                       **Reason**                                                                 |
|:------------------:|:-------:|:------------------------------------------------------------------------------------------------:|
|**Functionality**   |    3    | Both encrypt and decrypt work from command line. All tests pass.                           |
|**OOP**             |    3    | Methods are in the classes they belong to, module is implemented, and helper methods are used    |
|**Ruby Conventions**|    3    | Code is indented and methods are named properly based on function.                               |
|**TDD**             |    3    | All tests pass, simple cov shows 100% coverage, rake runs as should.                             |
|**Version Control** |    3    | Have over 30 commits, pull requests were made based on function.                                 |
