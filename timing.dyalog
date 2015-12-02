:Namespace timing

 cmpx←{						 ⍝ Approx expression timings.
     ⍺←⍬					 ⍝ options: raw	cpu cols.
     1=≡,⍵:⍺ ∇⊂,⍵				 ⍝ single expression: enclose.
     ⍺{						 ⍝ options.
         (⍎⍵)-⎕AI				 ⍝ time	of ⍺ expr-iterations.
     }{⎕IO ⎕ML←0 1				 ⍝ local sysvars (see Notes).
         dflt←{⍵+⍺×⍵=0}				 ⍝ ⍺ default if	⍵=0.
         raw cpu cols secs←0 0 40 1 dflt¨4↑⍺	 ⍝ raw/cpu times, hist wdth secs
         clock←(2-cpu)∘⊃			 ⍝ 0:elapsed, 1:cpu
         count nett←1 ⍺⍺{			 ⍝ loop	count and times.
             times←⍺ ⍺⍺{			 ⍝ time	for each expression.
                 head←'{0<⍵:∇⍵-1⊣'		 ⍝ loop	pre- and
                 tail←'⋄⎕AI}⍺'			 ⍝ post-amble.
                 clock ⍺ ⍺⍺ head,⍵,tail		 ⍝ time	for ⍺ loops of expr.
             }¨⍵				 ⍝ ... for each	expression.
             (secs×1000)>+/times÷⍴,⍵:(⍺×2)∇ ⍵	 ⍝ too quick: reiterate	× 2.
             null←'{0<⍵:∇⍵-⊢1⋄⎕AI}⍺'		 ⍝ null	loop for "control" time.
             adj←{⍵-0⌊⌊/⍵}			 ⍝ adjusted to clear -ive vals.
             ⍺,⊂adj times-clock	⍺ ⍺⍺ null	 ⍝ times - null	loop overhead.
         }⍵					 ⍝ vector of expressions.
         hist←↑{(⌊0.5+cols×⍵÷⌈/⍵)⍴¨'⎕'}nett	 ⍝ simple histogram.
         raw:nett÷count×1000			 ⍝ raw numeric result.
         esec←↑6 ¯2∘⍕¨nett÷count×1000		 ⍝ e-format seconds.
         rels←⌊100×¯1+{⍵÷⊃⍵}1⌈nett		 ⍝ percentages relative	to 1st.
         sign←{(1+×⍵)⊃'- +'}			 ⍝ sign: - +.
         fpcs←⌽↑{'%',⌽(sign ⍵),⍕|⍵}¨rels	 ⍝ formatted percentages.
         diff←{⍵⊃' *'}¨×{⍵⍳⍵},⍵⍵¨⍵		 ⍝ result differences.
         exps←diff,' ',↑⍵			 ⍝ exprs with diff markers.
         pref←{↑⍺∘,¨↓⍵}				 ⍝ ⍺-prefix of rows of matrix ⍵.
         cmps←'	| 'pref	fpcs,' ',hist		 ⍝ percents and	histogram.
         1=⍴,⍵:esec				 ⍝ single expr:	time only.
         exps,'	→ 'pref	esec,cmps		 ⍝ [*] expr → secs | %s	histo.
     }{						 ⍝ right operand:
         ⍎⍵					 ⍝ expr	executed in native envt.
     }⍵						 ⍝ vector of subject exprs.
 }


:EndNamespace