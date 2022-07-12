
WFSCommunity {

    var <>agents;
    var <>path = "";

    *new {|path=""|
       ^super.newCopyArgs(List(), path);
    }

    add {|agent|
        this.agents.add(agent);
    }

    write {

        var file = File(path.standardizePath,"w");
        file.write("UScore(\n");

		this.agents.do{|agent|
            agent.write(file);
        };

        file.write(").name_(\"c\").displayBounds_(Rect(123.0, 357.0, 1053.0, 472.0))"); // What is this ??
        file.close;
    }

}