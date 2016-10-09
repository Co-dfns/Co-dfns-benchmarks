:Namespace genokey_acc

'mk'⎕NA'P ./build/gk.so|mk I'
'fk'⎕NA'./build/gk.so|fk >I1[] P I'
'gk'⎕NA'P ./build/gk.so|gk P <I1[] <I1[] <I1[] I I I I'

rp_joinx←{
	⍝ Join relations ⍺ and ⍵ into a single relation
	⍝ 1994-03-17 / GLM
	⍝ 1999-06-17 / GLM
	A0 V0	←⍺
	A1 V1	←⍵
	V	←V0,V1	⍝ both sets of variables
	(⍳≢V)≡V⍳V:	(↓[0]↑,(↓[0]↑A0)∘.,↓[0]↑A1)[I](V[I←⍋V])	⍝ if no common variables
	BM	←⊂1
	L	←((V0∊V1)/A0)
	R	←(V1∊V0)/A1
	S	←(⍴⊃L),(⍴⊃R)
	BM	←mk⊢ST←×/S
	colligate←{	⍝ colligate common variables two at a time
		G0	←⍺⍳⍨D0←∪⍺	
		G1	←⍵⍳⍨D1←∪⍵	
		J0	←D0∘.∩D1	⍝ The unique elements are colligated by intersection
		TJ0	←,≢¨J0
		BM	←gk BM G0 G1 TJ0 (≢G0) (≢G1) (≢J0) (⊃⌽⍴J0)
			J0 G0 G1
	}
	R	←L colligate¨R
	BM	←ST↑11⎕DR fk (⌈ST÷8) BM ST
	I0 I1	←↓S⊤BM/⍳ST
	⍬≡I0:	⍬	⍝ Exit if contradiction
	CA	←{(0⊃⍵)[((1⊃⍵)[I0]),¨(2⊃⍵)[I1]]}¨R	
	A0	←↓(↑(~V0∊V1)/A0)[;I0]	⍝ Arguments of free variables in first  relation in the joined relation
	A1	←↓(↑(~V1∊V0)/A1)[;I1]	⍝ Arguments of free variables in second relation in the joined relation
	V	←(V0∩V1),(V0~V1),V1~V0	
		(CA,A0,A1)[I](V[I←⍋V])	⍝ Joined relation ordered by variables
}

:EndNamespace
