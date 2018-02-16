:Namespace max
  ⎕IO←0

S←⊂':Namespace'
S,←⊂'Run←{⌈⌿⍵}'
S,←⊂':EndNamespace'

DY←⎕FIX S
CD←'max' #.codfns.Fix S
SOP←'max',#.codfns.soext⍬
'cdRunbn'⎕NA SOP,'|Run_cdf P P P'
'cdRunin'⎕NA SOP,'|Run_cdf P P P'
mka←'max'∘#.codfns.MKA
frea←'max'∘#.codfns.FREA

∇Z←Runbm X;rotp;inpt;inptp;resp;kern;dylg;_
⎕←'Bit Matrix' X
inpt←?X X⍴2
inptp←mka inpt
resp←mka ⍬
kern←'#.max.(cdRunbn resp 0 inptp)'
dylg←'#.max.(DY.Run inpt)'
⎕←#.timing.cmpx kern dylg
_←frea inptp ⋄ _←frea resp
Z←0 0⍴⍬
∇

∇Z←Runbv X;rotp;inpt;inptp;resp;kern;dylg;_
⎕←'Bit Vector' X
inpt←?X⍴2
inptp←mka inpt
resp←mka ⍬
kern←'#.max.(cdRunbn resp 0 inptp)'
dylg←'#.max.(DY.Run inpt)'
⎕←#.timing.cmpx kern dylg
_←frea inptp ⋄ _←frea resp
Z←0 0⍴⍬
∇

∇Z←Runiv X;rotp;inpt;inptp;resp;kern;dylg;_
⎕←'Int Vector' X
inpt←?X⍴2*20
inptp←mka inpt
resp←mka ⍬
kern←'#.max.(cdRunin resp 0 inptp)'
dylg←'#.max.(DY.Run inpt)'
⎕←#.timing.cmpx kern dylg
_←frea inptp ⋄ _←frea resp
Z←0 0⍴⍬
∇

∇Z←Runim X;rotp;inpt;inptp;resp;kern;dylg;_
⎕←'Int Matrix' X
inpt←?X X⍴2*20
inptp←mka inpt
resp←mka ⍬
kern←'#.max.(cdRunin resp 0 inptp)'
dylg←'#.max.(DY.Run inpt)'
⎕←#.timing.cmpx kern dylg
_←frea inptp ⋄ _←frea resp
Z←0 0⍴⍬
∇

∇Benchmark;_
⍝_←Runbv¨2*5+⍳15
⍝_←Runbv¨3*5+⍳10
⍝_←Runbm¨2*5+⍳11
⍝_←Runbm¨3*5+⍳5
_←Runim¨2*5+⍳9
_←Runiv¨2*5+⍳12
∇

:EndNamespace
