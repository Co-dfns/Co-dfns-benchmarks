:Namespace romilly
  ⎕IO←0

S←':Namespace' 'Run←{÷1+*-⍺+.×⍵}' ':EndNamespace'

DY←⎕FIX S
CD←'romilly' #.codfns.Fix S
SOP←#.codfns.BSO'romilly'
'cdrun'⎕NA SOP,'|Runff P P P'
mka←'romilly'∘#.codfns.MKA
frea←'romilly'∘#.codfns.FREA

∇Run X;mat;vec;CDR;DYR;_
⎕←X
mat←0.01×?X X⍴100
vec←0.01×?X⍴100
matp←mka mat
vecp←mka vec
resp←mka ⍬
kern←'#.romilly.(cdrun resp matp vecp)'
cdfn←'#.romilly.(mat CD.Run vec)'
dylg←'#.romilly.(mat DY.Run vec)'
⎕←#.timing.cmpx kern dylg
frea vecp ⋄ frea matp ⋄ frea resp
∇

∇Benchmark;_
Run¨2*5+⍳9
∇

:EndNamespace
