:Namespace rotate
  ⎕IO←0

S←⊂':Namespace'
S,←⊂'Run←{⍺⌽⍵}'
S,←⊂':EndNamespace'

DY←⎕FIX S
CD←'rotate' #.codfns.Fix S
SOP←'rotate',#.codfns.soext⍬
'cdRunbi'⎕NA SOP,'|Run_cdf P P P'
'cdRunii'⎕NA SOP,'|Run_cdf P P P'
mka←'rotate'∘#.codfns.MKA
frea←'rotate'∘#.codfns.FREA

∇Z←Runb(X Y);rotp;inpt;inptp;resp;kern;dylg;_
⎕←'Bitvector' X Y
rotp←mka Y
inpt←?X X⍴2
inptp←mka inpt
resp←mka ⍬
kern←'#.rotate.(cdRunbi resp rotp inptp)'
dylg←'#.rotate.(Y DY.Run inpt)'
⎕←#.timing.cmpx kern dylg
_←frea rotp ⋄ _←frea inptp ⋄ _←frea resp
Z←0 0⍴⍬
∇

∇Z←Runi(X Y);rotp;inpt;inptp;resp;kern;dylg;_
⎕←'Integer' X Y
rotp←mka Y
inpt←?X X⍴2*28
inptp←mka inpt
resp←mka ⍬
kern←'#.rotate.(cdRunii resp rotp inptp)'
dylg←'#.rotate.(Y DY.Run inpt)'
⎕←#.timing.cmpx kern dylg
_←frea rotp ⋄ _←frea inptp ⋄ _←frea resp
Z←0 0⍴⍬
∇

∇Benchmark;_
_←Runb⍤1,∘-∘(÷∘2)⍨⍪2*5+⍳11
_←Runb⍤1,∘-∘(⌊2÷⍨⊢)⍨⍪3*5+⍳5
_←Runi⍤1,∘-∘(÷∘2)⍨⍪2*5+⍳9
∇

:EndNamespace
