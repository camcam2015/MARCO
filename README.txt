created by u/tt on 6/20/17
commands: list, add, remove/delete, run, rename, info, edit

EDITING A MARCO:
Once a marco is added, programs and websites can be passed to it and run. When ran, the marco
will read each line from the text file it is linked to, which must be typed in a specific format:

[type],[path],[executable],[alias]

      [type] : Specifies if a program or a website is being run.
	       inputs: program, website
      [path] : Path name. Not needed if type is website.
[executable] : File name or URL to be executed. 
     [alias] : Name for specific process, can be anything.

 ex: website,https://www.rockpapershotgun.com/,RPS
     program,C:\Program Files (x86)\Steam,Steam.exe,steam

Each "process" should be located on separate lines.
NOTE: Be sure to not add spaces after the commas- spaces in the file path are valid.

Constructive criticism is very welcome. This is my second batch project
(the first was basically a mini version of this), I hope you find it useful!








"It's 'macro', not 'marco'."
> I'm well aware ;)