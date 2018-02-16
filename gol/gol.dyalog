:Namespace gol

S1←':Namespace' 'life←{⊃1 ⍵∨.∧3 4=+⌿,1 0 ¯1∘.⊖1 0 ¯1⌽¨⊂⍵}' ':EndNamespace'
S2←⊂':Namespace' 
S2,←⊂'life←{l←1⌽⍵ ⋄ r←¯1⌽⍵'
S2,←⊂' lu←1⊖l ⋄ cu←1⊖⍵ ⋄ ru←1⊖r'
S2,←⊂' ld←¯1⊖l ⋄ cd←¯1⊖⍵ ⋄ rd←¯1⊖⍵'
S2,←⊂' sm←lu+cu+ru+l+⍵+r+ld+cd+rd'
S2,←⊂' (3=sm)∨(⍵∧4=sm)}' 
S2,←⊂':EndNamespace'

DY←⎕FIX S1
CD←'gol' #.codfns.Fix S2
SOP←'gol',#.codfns.soext⍬
'cdlife'⎕NA SOP,'|life_cdf P P P'
'sync'⎕NA SOP,'|afsync'
mka←'gol'∘#.codfns.MKA
frea←{}'gol'∘#.codfns.FREA
kern←'#.gol.{cdlife ZP 0 DP ⋄ sync}⍬'
cdfns←'#.gol.(CD.life D)'
dylg←'#.gol.(DY.life D)'

∇Run X;D;ZP;DP
 D←?X X⍴2 ⋄ ⎕←X ⋄ DP←mka D ⋄ ZP←mka ⍬
 ⎕←#.cmpx kern cdfns dylg
 frea DP ⋄ frea ZP
∇

∇Benchmark
 Run¨2*5+⍳9
∇

:EndNamespace
