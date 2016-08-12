:Namespace redfirst
  ⎕IO←0

S←⊂':Namespace'
S,←⊂'Run←{+⌿⍵}'
S,←⊂':EndNamespace'

DY←⎕FIX S
CD←'redfirst' #.codfns.Fix S
SOP←#.codfns.BSO'redfirst'
'cdRunbn'⎕NA SOP,'|Runbn P P P'
'cdRunin'⎕NA SOP,'|Runin P P P'
mka←'redfirst'∘#.codfns.MKA
frea←'redfirst'∘#.codfns.FREA

∇Z←Runb X;rotp;inpt;inptp;resp;kern;dylg;_
⎕←'Bitvector' X
inpt←?X X⍴2
inptp←mka inpt
resp←mka ⍬
kern←'#.redfirst.(cdRunbn resp 0 inptp)'
dylg←'#.redfirst.(DY.Run inpt)'
⎕←#.timing.cmpx kern dylg
Z←0 0⍴⍬
∇

∇Z←Runi X;rotp;inpt;inptp;resp;kern;dylg;_
⎕←'Integer' X
inpt←?X X⍴3
inptp←mka inpt
resp←mka ⍬
kern←'#.redfirst.(cdRunin resp 0 inptp)'
dylg←'#.redfirst.(DY.Run inpt)'
⎕←#.timing.cmpx kern dylg
_←frea inptp ⋄ _←frea resp
Z←0 0⍴⍬
∇

∇Benchmark;_
_←Runb¨2*5+⍳11
_←Runb¨3*5+⍳5
_←Runi¨2*5+⍳8
∇

:EndNamespace
