
WFSAgent {
	var <>start=0, <>duration=0, <>track=0, <>sound=nil, <>movement=nil;

	*new { arg start=0, duration=0, track=0, sound=nil, movement=nil;
		^super.newCopyArgs(start, duration, track, sound, movement);
	}

	write {|file|

		file.write("UChain(" ++ this.start ++ ", " ++ this.track ++", " ++ this.duration ++ ",");

		this.sound.write(file);
		this.movement.write(file);

		file.write(")" ++ this.sound.color() ++ ", \n");
	}
}

WFSSynth {

	var <>name="", <>a=0.5, <>b=0.5, <>c=0.5;

	*new { arg name="", a=0.5, b=0.5, c=0.5;
		^super.newCopyArgs(name, a, b, c);
	}

	write {|file|
		file.write("[ '" ++ this.name ++ "', [ 'a', " ++ this.a ++ ", 'b', " ++ this.b ++ ", 'c', " ++ this.c ++ " ]],");
	}

	color {
		^ ".displayColor_(Color(0.34, 0.50, " ++ rrand(0.4,0.6) ++ "))"
	}
}

WFSSample {

	var <>path, <>rate=1.0, <>loop=false;

	*new { arg path, rate=1.0,loop=false;
		^super.newCopyArgs(path,rate,loop);
	}

	write {|file|
		file.write("[ 'bufSoundFile', [ 'soundFile', BufSndFile.newBasic(\"" ++ this.path ++ "\", nil, nil, 44100, 0, nil, " ++ this.rate ++ ",  " ++ this.loop ++ ") ]],");
	}

	color {
		^ ".displayColor_(Color(" ++ rrand(0.4,0.6) ++ ", 0.50, 0.55))"
	}
}

WFSTrandom {

	var <>x=0.5, <>y=0.5, <>fadeIn=0, <>fadeOut=0, <>speed=0.2, <>rx=0.5, <>ry=0.5, <>gain=0;

	*new { arg x=0.5, y=0.5, fadeIn=0.0, fadeOut=0.0, speed=0.2, rx=0.5, ry=0.5, gain=0;
		^super.newCopyArgs(x, y, fadeIn, fadeOut, speed, rx, ry, gain);
	}

	write {|file|
		file.write("[
'wfsSource', [ 'point', [ 'random_trajectory', [ 'speed', " ++ this.speed ++ ", 'center', Point(" ++ this.x ++ ", " ++ this.y ++ "),  'radius', Point(" ++ this.ry ++ ", "++ this.ry ++ ") ]], 'quality', 'better', 'dbRollOff', -3.0, 'u_fadeIn'," ++ this.fadeIn ++ ", 'u_fadeOut', " ++ this.fadeOut ++" ]]");
	}
}

WFSTpoint {

	var <>x=0.5, <>y=0.5, <>fadeIn=0, <>fadeOut=0, <>gain=0;

	*new { arg x=0.5, y=0.5, fadeIn=0.0, fadeOut=0.0, gain=0;
		^super.newCopyArgs(x, y, fadeIn, fadeOut, gain);
	}

	write {|file|
		file.write("[ 'wfsSource', [ 'point', Point(" ++ this.x ++ ", " ++ this.y ++ "), 'u_gain', " ++ this.gain ++ ", 'u_fadeIn'," ++ this.fadeIn ++ ", 'u_fadeOut', " ++ this.fadeOut ++" ]]"
		);
	}
}