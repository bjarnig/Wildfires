
/*

BG : Synthesis Udefs

*/


// 01 - GRIT

Udef( \b_1, { |a=0.5, b=0.5, c=0.5|

	var modfreq = LFDClipNoise.ar(1000*c).range(50, LFNoise1.ar(0.01).range(500,800));
	var mod = PMOsc.ar(50 * a, modfreq, 1);
	var grav = LeastChange.ar(GravityGrid.ar(0, 100*b), mod);
	var filtMod = LFDClipNoise.ar(0.2 * b).range(200,19000);
	var sig = 0.09 * HPF.ar(LPF.ar(grav,Lag.ar(filtMod,0.15)), 30);

	URandSeed.ir();
	UMixOut.ar( 0, sig, 0, true )
} ).category_( \synthesis )
	.setSpec( \a, [0.0,1.0,\lin].asSpec )
	.setSpec( \b, [0.0,1.0,\lin].asSpec )
	.setSpec( \c, [0.001,0.9,\lin].asSpec );

// ----------------------------------

// 02 - plane

Udef( \b_2, { |a=0.5,b=0.5,c=0.5|
	var sig;
	var aa = 9, bb = 5, min=0.1, max=0.2;
	var sd = SampleDur.ir;
	var trig, seq, freq;
	sd = sd * c * 2;
	trig = Impulse.kr( LFNoise1.kr([0.2,0.8,0.3,0.8]).range(0.01, 1.0) * a );
	seq = Dseq([ Dbrown(10, 30, 2, 16), Dwhite(10, 20, 8)], inf);
    freq = Demand.kr(trig, 0, seq);
	sig = BPeakEQ.ar(HPF.ar(DemandEnvGen.ar(
		Dseq([min, min.neg, [max.neg, max]], inf),
		Dseq([sd * aa, sd * bb], inf)
	).fold2(SinOsc.ar(freq * 2 * b)).sum * 0.2, 40 + (200 * a)), 4000, 1, -3);

	URandSeed.ir();
	UMixOut.ar( 0, sig, 0, true )
} ).category_( \synthesis )
	.setSpec( \a, [0.0,1.0,\lin].asSpec )
	.setSpec( \b, [0.0,1.0,\lin].asSpec )
	.setSpec( \c, [0.0,1.0,\lin].asSpec );

// 03 - noisea

Udef( \b_3, { |a=0.5,b=0.5,c=0.5|
	var sig = BBandStop.ar(RLPF.ar(
		Crackle.ar(
			LFNoise2.ar(24* a).range(1.01, 1.5), 0.5), 60 + (13000*b), 0.4),
	        StandardL.ar(11*a).range(200*c,600*c), 8*c);
	XFade2.ar(sig, HPF.ar(sig * Gendy3.ar(freq:20 * c).range(0.2,4.0),60),LinLin.kr(b,0,1,-1,1));
	sig = sig * 2;

	URandSeed.ir();
	UMixOut.ar( 0, sig, 0, true )
} ).category_( \synthesis )
	.setSpec( \a, [0.0,1.0,\lin].asSpec )
	.setSpec( \b, [0.0,1.0,\lin].asSpec )
	.setSpec( \c, [0.0,1.0,\lin].asSpec );

// 04 - wfsa

Udef( \b_4, { |a=0.5,b=0.5,c=0.5|

	var aa = 9.5, bb = 13, min=0.1, max=0.2;
	var sd = SampleDur.ir * LinLin.kr(b,0.0,1.0,0.2,0.8) * 4;
	var sig = Limiter.ar(HPF.ar(DemandEnvGen.ar(
		Dseq([min, min.neg, Array.rand(4, 0.1,0.3) ], inf),
		sd * Dseq([aa, bb, Dbrown(aa,bb,bb-aa,aa) * ( c * 2)], inf)
	).fold2(SinOsc.ar(0.010 * a)), 40 * LinLin.kr(a,0.0,1.0,0.5,5))*0.6, 0.8).sum
	* XLine.ar(0.0001,1.0,0.3) * LFNoise1.ar(10*c).range(0.6,1.2);

	URandSeed.ir();
	UMixOut.ar( 0, sig, 0, true )
} ).category_( \synthesis )
	.setSpec( \a, [0.0,1.0,\lin].asSpec )
	.setSpec( \b, [0.0,1.0,\lin].asSpec )
	.setSpec( \c, [0.0,1.0,\lin].asSpec );


// 05 - sparkling

Udef( \b_5, { |a=0.5,b=0.5,c=0.5|

	var laga = Lag.ar(LFDClipNoise.ar(800*b).range(20,650 * (2*c)), 0.001);
	var lagb = Lag.ar(LFDClipNoise.ar(400*b).range(20,950 * (2*LinLin.kr(c,0.0,1.0,0.0001,16))), 0.001);
	var oa = PMOsc.ar(10*a, laga, 0.8, 0, [1,0.001]) * 0.125;
	var ob = PMOsc.ar(10*a, lagb, 0.8, 0, [0.001,1]) * 0.125;
	var sig = BPeakEQ.ar((oa + ob).sum, freq: 800.0, rq: 2.0, db: -6.0);

	URandSeed.ir();
	UMixOut.ar( 0, sig, 0, true )
} ).category_( \synthesis )
	.setSpec( \a, [0.0,1.0,\lin].asSpec )
	.setSpec( \b, [0.0,1.0,\lin].asSpec )
	.setSpec( \c, [0.0,1.0,\lin].asSpec );