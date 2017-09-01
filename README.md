This is a test project.

Goals:
- setup this git account - DONE
- learn & test - STARTED, enough is ready
- write the first R program to handle the stuff - Took graph & code from http://chartsgraphs.wordpress.com/2011/02/22/september-2011-arctic-sea-ice-extent-forecast/
- setup the arctic thingie - YUP, first results are nice...

Code is edited here, updated on the server (php calls shell script to update the local git there, launch the R script and create ze graph). 
All done in 3 hours :-)



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

