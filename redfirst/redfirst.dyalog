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

∇Z←Runbm X;rotp;inpt;inptp;resp;kern;dylg;_
⎕←'Bit Matrix' X
inpt←?X X⍴2
inptp←mka inpt
resp←mka ⍬
kern←'#.redfirst.(cdRunbn resp 0 inptp)'
dylg←'#.redfirst.(DY.Run inpt)'
⎕←#.timing.cmpx kern dylg
_←frea inptp ⋄ _←frea resp
Z←0 0⍴⍬
∇

∇Z←Runbv X;rotp;inpt;inptp;resp;kern;dylg;_
⎕←'Bit Vector' X
inpt←?X⍴2
inptp←mka inpt
resp←mka ⍬
kern←'#.redfirst.(cdRunbn resp 0 inptp)'
dylg←'#.redfirst.(DY.Run inpt)'
⎕←#.timing.cmpx kern dylg
_←frea inptp ⋄ _←frea resp
Z←0 0⍴⍬
∇

∇Z←Runim X;rotp;inpt;inptp;resp;kern;dylg;_
⎕←'Int Matrix' X
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
_←Runbv¨2*5+⍳15
_←Runbv¨3*5+⍳10
_←Runbm¨2*5+⍳11
_←Runbm¨3*5+⍳5
_←Runim¨2*5+⍳9
∇

:EndNamespace
