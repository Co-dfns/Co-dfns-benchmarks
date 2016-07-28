:Namespace rotfirst
  ⎕IO←0

S←⊂':Namespace'
S,←⊂'Run←{⍺⊖⍵}'
S,←⊂':EndNamespace'

DY←⎕FIX S
CD←'rotfirst' #.codfns.Fix S
SOP←#.codfns.BSO'rotfirst'
'cdRun'⎕NA SOP,'|Runbi P P P'
mka←'rotfirst'∘#.codfns.MKA
frea←'rotfirst'∘#.codfns.FREA

∇Z←Run(R X Y);rotp;inpt;inptp;resp;kern;dylg;_
⎕←R X Y
rotp←mka Y
inpt←?X X⍴R
inptp←mka inpt
resp←mka ⍬
kern←'#.rotfirst.(cdRun resp rotp inptp)'
dylg←'#.rotfirst.(R DY.Run inpt)'
⎕←#.timing.cmpx kern dylg
_←frea rotp ⋄ _←frea inptp ⋄ _←frea resp
Z←0 0⍴⍬
∇

∇Benchmark;_
_←Run⍤1⊢2,,∘-∘(÷∘2)⍨⍪2*5+⍳11
_←Run⍤1⊢2,,∘-∘(⌊2÷⍨⊢)⍨⍪3*5+⍳5
_←Run⍤1⊢256,,∘-∘(÷∘2)⍨⍪2*5+⍳10
∇

:EndNamespace
