:Namespace genokey_cd

I←{⍬≡⍴⍵:⍵ ⋄ ⊃((⎕DR ⍵)323)⎕DR ⍵}
S←':Namespace' 'Do←{⍺∧0≠⍵}' ':EndNamespace'

CD←'genokey'#.codfns.Fix S
so←#.codfns.BSO 'genokey'
'Doii'⎕NA so,'|fn_1_1ii P P P P'

⍝[c]To convert the Co-dfns version into something with good 
⍝[c]performance, we have the following set of steps that we need to take,
⍝[c]given in the order of their impact priority:
⍝[c]
⍝[c]1. 	Enable support for matrix indexing to merge the G0 G1⌷ portion 
⍝[c]	of the code into the ⍺∧0≠⍵ part. 
⍝[c]
⍝[c]3. 	Add support for bitvectors to enable better handling of the input 
⍝[c]	data. 

rp_joinx←{
	⍝ Join relations ⍺ and ⍵ into a single relation
	⍝ 1994-03-17 / GLM
	⍝ 1999-06-17 / GLM
	A0 V0	←⍺
	A1 V1	←⍵
	V	←V0,V1	⍝ both sets of variables
	(⍳≢V)≡V⍳V:	(↓[0]↑,(↓[0]↑A0)∘.,↓[0]↑A1)[I](V[I←⍋V])	⍝ if no common variables
	AL AR	←((V0∊V1)/A0)((V1∊V0)/A1)
	BM	←'genokey'#.codfns.MKA I 1
	colligate←{	⍝ colligate common variables two at a time
		G0	←⍺⍳⍨D0←∪⍺	
		G1	←⍵⍳⍨D1←∪⍵	
		J0	←D0∘.∩D1	⍝ The unique elements are colligated by intersection
		DAT	←'genokey'#.codfns.MKA I G0 G1⌷≢¨J0
		_	←Doii BM BM DAT 0
		_	←'genokey'#.codfns.FREA DAT
			J0 G0 G1
	}
	R	←((V0∊V1)/A0)colligate¨(V1∊V0)/A1
	BM	←{⊃((⎕DR ⍵)11)⎕DR ⍵}'genokey'#.codfns.EXA BM 1
	I0 I1	←↓(⍴BM)⊤(,BM)/⍳×/⍴BM
	⍬≡I0:	⍬	⍝ Exit if contradiction
	CA	←{(0⊃⍵)[((1⊃⍵)[I0]),¨(2⊃⍵)[I1]]}¨R	
	A0	←↓(↑(~V0∊V1)/A0)[;I0]	⍝ Arguments of free variables in first  relation in the joined relation
	A1	←↓(↑(~V1∊V0)/A1)[;I1]	⍝ Arguments of free variables in second relation in the joined relation
	V	←(V0∩V1),(V0~V1),V1~V0	
		(CA,A0,A1)[I](V[I←⍋V])	⍝ Joined relation ordered by variables
}

:EndNamespace
