:Namespace streak

S←':Namespace' 'Run←{is←¯1↓⍵<1⌽⍵ ⋄ s←+\is ⋄ ⌈/0,s-⌈\s-s×is}' ':EndNamespace'

DY←⎕FIX S
CD←'streak' #.codfns.Fix S
SOP←#.codfns.BSO'streak'
'cdrun'⎕NA SOP,'|Runin P P P'
mka←'streak'∘#.codfns.MKA
frea←{}'streak'∘#.codfns.FREA

∇Run RC;L;LP;R;RP;ZP;kern;dylg
⎕←RC
R←?RC⍴2*19
RP←mka R
ZP←mka ⍬
kern←'#.streak.(cdrun ZP 0 RP)'
dylg←'#.streak.(DY.Run R)'
⎕←#.cmpx kern dylg
frea LP ⋄ frea RP ⋄ frea ZP
∇

∇Benchmark;_
∘.Run⍨2*10+⍳10
∇

:EndNamespace
