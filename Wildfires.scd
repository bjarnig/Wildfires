
/*   Sounds used in the scores  */

~mcri = SoundFile.collect("/Users/bjarni/Works/PIECES/WFS/snd/mcri/*")
~colm = SoundFile.collect("/Users/bjarni/Works/PIECES/WFS/snd/colm/*")
~driw = SoundFile.collect("/Users/bjarni/Works/PIECES/WFS/snd/driw/*")



( /* ALGO 01 */

c = WFSCommunity("/Users/bjarni/01.uscore");

forBy (0, 8, 2, { arg j;

var aoffset = 0, aduration = 14, boffset = 0, bduration = 7, aspace = 3, bspace = 5;
var srca = "b_3", srcb = "b_3";
var events = 6;

events.do {|i|

    c.add(WFSAgent(aoffset, aduration, j,
		WFSSynth(srca, rrand(0.1,0.2), rrand(0.1,0.2), rrand(0.1,0.2)),
		WFSTpoint(rrand(j.neg,j), rrand(j.neg,j), 4.0.rand, 4.0.rand, -12)
	));

	aoffset = aoffset + aduration + aspace;
	aduration = rrand(10,15);
	aspace = rrand(1.5,4.5);
};

events.do {|i|

	c.add(WFSAgent(boffset, bduration, j+1,
		WFSSynth(srcb, rrand(0.6,0.8), rrand(0.6,0.8), rrand(0.6,0.8)),
		WFSTpoint(rrand(i.neg,i), rrand(i.neg,i), 2.0.rand, 2.0.rand, -12)
	));

	boffset = boffset + bduration + bspace;
	bduration = rrand(5,13);
	bspace = rrand(2.5,3.5);
};

});

c.write();

)

( /* ALGO 02 */

c = WFSCommunity("/Users/bjarni/02.uscore");

forBy (0, 6, 2, { arg j;

var layera = "b_2";
var layerb = "b_4";
var aoffset = 0, aduration = 12, boffset = 0, bduration = 5, aspace = 0, bspace = 0;
var axbr = Pbrown(-6.0,6.0,1.0).asStream, bxbr = Pbrown(-6.0,6.0,1.0).asStream;
var apxbr = Pbrown(0.1,0.3,0.01).asStream, bpxbr = Pbrown(0.1,0.3,0.01).asStream;

5.do {|i|

    c.add(WFSAgent(aoffset, aduration, j,
		WFSSynth(layera, apxbr.next, apxbr.next, apxbr.next),
		WFSTpoint(axbr.next, axbr.next.neg, 4.0.rand, 4.0.rand, -9)
	));

	aoffset = aoffset + aduration + aspace;
	aduration = rrand(20,25);
	aspace = rrand(0.5,4.5);
};

5.do {|i|

	c.add(WFSAgent(boffset, bduration, j+1,
		WFSSynth(layerb, apxbr.next,  apxbr.next,  apxbr.next),
		WFSTrandom(axbr.next, axbr.next.neg, 4.0.rand, 4.0.rand, rrand(0.1,0.4) * i, 1, 1, -9)
	));

	boffset = boffset + bduration + bspace;
	bduration = rrand(12,23);
	bspace = rrand(0.5,4.5);
};

});

c.write();

)


( /* ALGO 03 */

c = WFSCommunity("/Users/bjarni/03.uscore");

forBy (0, 8, 2, { arg j;

var layera = "b_3";
var layerb = "b_5";
var aoffset = 0, aduration = 2, boffset = 0, bduration = 3, aspace = 0, bspace = 0;
var axbr = Pbrown(-6.0,6.0,2.0).asStream, bxbr = Pbrown(-6.0,6.0,2.0).asStream;
var apxbr = Pbrown(0.5,0.8,0.01).asStream, bpxbr = Pbrown(0.1,0.3,0.01).asStream;

10.do {|i|

    c.add(WFSAgent(aoffset, aduration, j,
		WFSSynth(layera, apxbr.next, apxbr.next, apxbr.next),
		WFSTpoint(axbr.next, axbr.next, 0.8.rand, 0.9.rand,-6)
	));

	aoffset = aoffset + aduration + aspace;
	aduration = rrand(2,4);
	aspace = rrand(1.5,1.75);
};

10.do {|i|

	c.add(WFSAgent(boffset, bduration, j+1,
		WFSSynth(layerb, apxbr.next,  apxbr.next,  apxbr.next),
		WFSTpoint(axbr.next, axbr.next, 0.1.rand, 0.2.rand,-6)
	));

	boffset = boffset + bduration + bspace;
	bduration = rrand(3,5);
	bspace = rrand(1.5,1.85);
};

});

c.write();

)

( /* ALGO 04 */

var com = WFSCommunity("/Users/bjarni/04.uscore");
var bd = 7.0;

10.do{|j|

	10.do{|i|

		var offs = rrand(0.6,1.2);

		com.add(WFSAgent(bd * i * offs + rrand(0.2,1.2), (bd*0.6) + rrand(bd*0.2,bd*0.4) * offs, j,
			WFSSample(~mcri.choose.path,rrand(0.8,1.3)),
			WFSTrandom(i.rand,i.rand.neg,1.rand,1.rand,rx:rrand(1.5,3.0),ry:rrand(1.5,3.0).rand,speed:rrand(0.1,0.6))
		));
	}
};

com.write();

)


( /* ALGO 05 */

var com = WFSCommunity("/Users/bjarni/05.uscore");
var bd = 3.0;

10.do{|j|

	10.do{|i|

		var offs = rrand(0.6,1.2);

		com.add(WFSAgent(bd * i * offs + rrand(1.1,1.4), (bd*0.6) + rrand(bd*0.2,bd*0.4) * offs, j,
			WFSSample(~colm.choose.path,rrand(0.8,1.3)),
			WFSTrandom(6.rand,6.rand.neg,1.rand,1.rand,rx:rrand(1.5,3.0),ry:rrand(1.5,3.0).rand,speed:rrand(0.1,0.6) * i,gain:6.neg)
		));
	}
};

com.write();

)


( /* ALGO 06 */

var com = WFSCommunity("/Users/bjarni/06.uscore");
var bd = 3.0;

10.do{|j|

	10.do{|i|

		var offs = rrand(2.9,5.4);

		com.add(WFSAgent(bd * i * offs, (bd*0.6) + rrand(bd*0.2,bd*0.4) * offs, j,
			WFSSample(~driw.choose.path,rrand(0.2,0.8)),
			WFSTrandom(rrand(-5.0,5.0),rrand(-5.0,5.0) ,1.rand,1.rand,rx:rrand(1.5,3.0),ry:rrand(1.5,3.0).rand,speed:rrand(0.1,0.6) * i,gain:12.neg)
		));
	}
};

com.write();

)


// ----------- -----------  -----------    -----------    -----------


( /* ALGO 07 */

var com = WFSCommunity("/Users/bjarni/07.uscore");
var start = 0;

4.do{|i|

	2.do{|j|

		com.add(
			WFSAgent(start, rrand(7.0, 9.0), j,
			WFSSynth("b_1", 1.0.rand, rrand(0.6,0.9), 1.0.rand),
		));

		start = (start + 10) * 1.01;
	};

	com.add(
		WFSAgent(start, rrand(7.0, 9.0), 2,
		WFSSynth("b_1", 1.0.rand, rrand(0.01,0.45), 1.0.rand),
		WFSTpoint(4.0.rand, -4.0.rand, 0.1.rand, 0.1.rand, -1)
	));

};

com.write();

)

( /* ALGO 07b */

var com = WFSCommunity("/Users/bjarni/07b.uscore");
var start = 0;

4.do{|i|

	2.do{|j|

		com.add(
			WFSAgent(start, rrand(7.0, 9.0), j,
			WFSSynth("b_3", 1.0.rand, rrand(0.6,0.9), 1.0.rand),
			WFSTpoint(4.0.rand, -4.0.rand, 0.1.rand, 0.1.rand, -1)
		));

		start = (start + 10) * 1.01;
	};

	com.add(
		WFSAgent(start, rrand(7.0, 9.0), 2,
		WFSSynth("b_3", 1.0.rand, rrand(0.01,0.45), 1.0.rand),
		WFSTpoint(4.0.rand, -4.0.rand, 0.1.rand, 0.1.rand, -1)
	));

};

com.write();

)


( /* ALGO 08 */

var com = WFSCommunity("/Users/bjarni/08.uscore");
var bd = 5.0;
var offs = 0;

8.do{|j|

	7.do{|i|

		offs = rrand(2.9,7.4);

		com.add(WFSAgent(bd * i * offs + rrand(0.01,1.2), (bd*0.6) + rrand(bd*0.2,bd*0.4) * offs, j,
			WFSSample(~mcri[ (i+4).wrap(0,~mcri.size-1) ].path,rrand(0.8,1.4)),
			WFSTrandom(rrand(-5.0,5.0),rrand(-5.0,5.0) ,1.rand,1.rand,rx:rrand(1.5,3.0),ry:rrand(1.5,3.0).rand,speed:rrand(0.01,0.15) * i, gain:12.neg)
		));
	};
};

com.write();

)




( /* ALGO 09 */

var com = WFSCommunity("/Users/bjarni/09.uscore");
var bd = 5.0;
var offs = 0;

8.do{|j|

	var pstart = Pbrown(5,10, 0.5).asStream;

	7.do{|i|

		var ps = pstart.next;

		offs = rrand(2.9,7.4);

		com.add(WFSAgent(ps, ps*0.8, j,
			WFSSample(~mcri[ (i+4).wrap(0,~mcri.size-1) ].path,rrand(0.2,1.6)),
			WFSTrandom(rrand(-5.0,5.0),rrand(-5.0,5.0) ,1.rand,1.rand,rx:rrand(1.5,3.0),ry:rrand(1.5,3.0).rand,speed:rrand(0.01,0.15) * i, gain:12.neg)
		));
	};
};

com.write();

)

