# RunTime ToolKit
RunTime ToolKit includes: Marshal, a component for runtime inspection; and Caddie, a client to oragnize sessions and bookmarks.

Together, Marshal and Caddie enable diagnostics at runtime and review sessions offline. Marshal documents your actions by creating a session file and capturing screenshots and modifications as you inspect. Caddie gathers the sessions and indexes bookmarks to return to important sessions.
## RT Marshal - Component Inspection @ Runtime
Marshal provides a tree view of your application and an object inspector to adjust settings.  Create a bookmark for offline review.
#### Sessions
Sessions provide logging of screen shots and bookmarks.  Sessions are saved when the application exits to later be indexed by Caddie.
#### Bookmarks
Bookmarks provide marking points in sessions and an optional description.  

### Feature Overview

![Marshal Main Features](/images/marshal_features_map.png)

1. View session log

2. Add session bookmarks

3. Tree of forms and components

4. Tabs of inspected components 

5. Tools by component type (all components get an object inspector)

6. Tool detail area

7. Path in form

## RT Caddie - Session review offline
Caddie provides session collection and display for review after you have closed your application.  Sessions are parsed for bookmarks to quickly get you back to the session after you have closed your application.  Bookmarks provide a filter to your sessions. 
### Bookmarks usage
- [X] Bookmark a point in the session for later review (The session will have screenshot along with your bookmark)


### Feature Overview

![Caddie Main Features](/images/caddie_features_map.png)

1. Sessions list and bookmarks

2. Index of bookmarks set in Marshal

3. Individual sessions opened for review

4. Bookmarks automatically open the session so you can review further

5. Tabs of your applications

### Installation

Delphinus-Support

For Delphinus you need to edit the browse path.  Replace C:\Users\Public\Documents\Embarcadero\Studio\20.0\Comps\RunTime-ToolKit\source\lib\brokenraw with C:\Users\Public\Documents\Embarcadero\Studio\20.0\Comps\RunTime-ToolKit\lib\Win32\Release.  GoTo Tools --> Options --> Language --> Delphi --> Browsing Path

![Powered By Delphi](https://i1.wp.com/blogs.embarcadero.com/wp-content/uploads/2021/01/Powered-by-Delphi-white-175px-7388078.png?resize=175%2C82&ssl=1)[Powered by Delphi](https://www.embarcadero.com/products/delphi)
