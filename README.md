This is a test project.

Goals:
- setup this git account - DONE
- learn & test - STARTED, enough is ready
- write the first R program to handle the stuff - Took graph & code from http://chartsgraphs.wordpress.com/2011/02/22/september-2011-arctic-sea-ice-extent-forecast/
- setup the arctic thingie - YUP, first results are nice...

Code is edited here, updated on the server (php calls shell script to update the local git there, launch the R script and create ze graph). 
All done in 3 hours :-)



![Alt text](https://g.gravizo.com/svg?
  digraph G {
    aize ="4,4";
    main [shape=box];
    main -> parse [weight=8];
    parse -> execute;
    main -> init [style=dotted];
    main -> cleanup;
    execute -> { make_string; printf}
    init -> make_string;
    edge [color=red];
    main -> printf [style=bold,label="100 times"];
    make_string [label="make a string"];
    node [shape=box,style=filled,color=".7 .3 1.0"];
    execute -> compare;
  }
)


Gravizo - Your Graphviz, UMLGraph or PlantUML for your README
a simple way of describing graphs and include it easily in your web for free, blog, markdown page, github, and any location where remote images can be showed. Gravizo uses Graphviz to render graphs. It supports DOT, PlantUML, UMLGraph syntax and SVG in JSON format. It will include other formats in the future. No javascript, no plugins needed so you can include in any document.

News
Allow to render as SVG.

Added support for PlantUML state diagrams.

New graph source. You can point to a public file as source for the gravizo. Also can include multiple sources in the same file, allowing to add multiple graphs in same README.md without escape characters and compatible with Github and Bitbucket.

Support for undirect dot graphs.

Support CJK characters (Chinese, Japanese, and Korean).

Can restore PlantUML default look&feel adding "skinparam monochrome false".

Gravizo now supports SVG in JSON format.

Gravizo now supports activity diagrams.

How to use Gravizo
Direct
Use Gravizo is very easy, only need to call the url https://g.gravizo.com/svg? followed by your graph description in DOT, PlantUML or UMLGraph syntax.
<img src='https://g.gravizo.com/svg?
 digraph G {
   main -> parse -> execute;
   main -> init;
   main -> cleanup;
   execute -> make_string;
   execute -> printf
   init -> make_string;
   main -> printf;
   execute -> compare;
 }
'/>

Using markdown syntax in github.com
Also can use Markdown syntax including a image tag and then the url content include DOT, PlantUML or UMLGraph syntax. Don't forget to close the image tag.

![Alt text](https://g.gravizo.com/svg?
  digraph G {
    aize ="4,4";
    main [shape=box];
    main -> parse [weight=8];
    parse -> execute;
    main -> init [style=dotted];
    main -> cleanup;
    execute -> { make_string; printf}
    init -> make_string;
    edge [color=red];
    main -> printf [style=bold,label="100 times"];
    make_string [label="make a string"];
    node [shape=box,style=filled,color=".7 .3 1.0"];
    execute -> compare;
  }
)
DOT sample with Gravizo
Use it on you README.md at github to show the graph directly in your home page. Here is a sample

Using indirect markdown syntax in bitbucket.org
Use http://gravizo.com/source/svg/custom_mark?source_url_url_encoded to point source_url_url_encoded where is the source for the graph. Use custom_mark to delimit where the source is. Also include a blank image to hide source if you want.

![Alt text](https://g.gravizo.com/source/svg/thiisthemark?http%3A%2F%2Fwww.gravizo.com)
![Alt text](http://www.gravizo.com/img/1x1.png#

thiisthemark        
@startuml
object Object01
object Object02
object Object03
object Object04
object Object05
object Object06
object Object07
object Object08

Object01 <|-- Object02
Object03 *-- Object04
Object05 o-- "4" Object06
Object07 .. Object08 : some labels
@enduml
thiisthemark        
        
Plantuml sample with indirect Gravizo
More at bitbucket.org

Samples
This is a sequence example write in PlantUML. Note that you need to include ; after each line to make it compatible with Gravizo

<img src='https://g.gravizo.com/svg?
@startuml;

actor User;
participant "First Class" as A;
participant "Second Class" as B;
participant "Last Class" as C;

User -> A: DoWork;
activate A;

A -> B: Create Request;
activate B;

B -> C: DoWork;
activate C;

C --> B: WorkDone;
destroy C;

B --> A: Request Created;
deactivate B;

A --> User: Done;
deactivate A;

@enduml
'>
    
