:Namespace ann
  ⎕IO←0

S←':Namespace' 'Run←{÷1+*-⍺+.×⍵}' ':EndNamespace'

DY←⎕FIX S
CD←'ann' #.codfns.Fix S
SOP←#.codfns.BSO'ann'
'cdrun'⎕NA SOP,'|Runff P P P'
mka←'ann'∘#.codfns.MKA
frea←'ann'∘#.codfns.FREA

∇Run X;mat;vec;CDR;DYR;_
⎕←X
mat←0.01×?X X⍴100
vec←0.01×?X⍴100
matp←mka mat
vecp←mka vec
resp←mka ⍬
kern←'#.ann.(cdrun resp matp vecp)'
cdfn←'#.ann.(mat CD.Run vec)'
dylg←'#.ann.(mat DY.Run vec)'
⎕←#.timing.cmpx kern dylg
frea vecp ⋄ frea matp ⋄ frea resp
∇

∇Benchmark;_
Run¨2*5+⍳9
∇

:EndNamespace
