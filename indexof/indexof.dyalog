:Namespace indexof

S←':Namespace' 'Run←{⍺⍳⍵}' ':EndNamespace'

DY←⎕FIX S
CD←'indexof' #.codfns.Fix S
SOP←#.codfns.BSO'indexof'
'cdrun'⎕NA SOP,'|Runii P P P'
mka←'indexof'∘#.codfns.MKA
frea←{}'indexof'∘#.codfns.FREA

∇LC Run RC;L;LP;R;RP;ZP;kern;dylg
⎕←LC RC
L←?LC⍴2*19
LP←mka L
R←?RC⍴2*19
RP←mka R
ZP←mka ⍬
kern←'#.indexof.(cdrun ZP LP RP)'
dylg←'#.indexof.(L DY.Run R)'
⎕←#.cmpx kern dylg
frea LP ⋄ frea RP ⋄ frea ZP
∇

∇Benchmark;_
∘.Run⍨2*10+⍳10
∇

:EndNamespace
