# Sparkle
A project creation and management system for Wikia Developers Wiki 

# Installation
Sparkle requires Python 3.x

Clone Sparkle:
```
:~$ git clone https://github.com/BenjaminJWilliams/Sparkle.git
```

Enter the Sparkle directory and give Sparkle permissions to execute:
```
:~$ cd Sparkle
:~$ chmod +x sparkle
```

Install sparkle so that it can be used:
```
:~$ sudo mv sparkle /usr/bin/sparkle
```

Grab a beer:
```
:~$ sudo apt-get beer
```

# Useage
__NOTICE: This is not idiot proof *yet* so please don't be stupid when using this.__
__NOTICE: In order to compile SCSS projects you need SCSS. Please see [here](http://sass-lang.com/) for more info.__

### Creating a project
```
:~$ sparkle create
```

### Compiling projects
```
:~$ cd MyProject
:~$ sparkle compile -js # For a JS project
:~$ sparkle compile -css # For a CSS project
```