# cmods

Some chromium modifications

## changes to chrome://newtab
Replaced by a particles.js background with a centered clock. In December the animation will change to look like snow.
## bookmarks management
Is done with a simple bm.html file, which can be quickly accessed by pressing Alt+B (needs to be configured in Extensions>Keyboard Shortcuts, remappable in manifest.json). 
The query field in bm.html has 3 different modes:
```
To directly go to the first regex match, just type your query and hit enter
To search for bookmark names, prepend a ? to your query (this uses window.find)
To forward your query to DuckDuckGo, prepend an ! (Bangs still work)
```
To edit bm.html, a simple shell script is provided, it currently supports adding, removing and renaming bookmarks, which is done using regular expressions, so be careful... For doing more 'complex' things, use your favorite text editor.