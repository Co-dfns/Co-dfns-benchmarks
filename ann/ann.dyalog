:Namespace ann
  ⎕IO←0

S←':Namespace' 'Run←{⍺({÷1+*-⍺+.×⍵}⍣1000)⍵}' ':EndNamespace'

DY←⎕FIX S
CD←'ann' #.codfns.Fix S
SOP←#.codfns.BSO'ann'
'cdrun'⎕NA SOP,'|Run_cdf P P P'
mka←'ann'∘#.codfns.MKA
frea←'ann'∘#.codfns.FREA
get←'ann'∘#.codfns.EXA

∇Run X;mat;vec;cdfn;dylg;_
⎕←X
mat←0.01×?X X⍴100
vec←0.01×?X⍴100
⍝ matp←mka mat
⍝ vecp←mka vec
⍝ resp←mka ⍬
⍝ kern←'#.ann.(cdrun resp matp vecp)'
cdfn←'#.ann.(mat CD.Run vec)'
dylg←'#.ann.(mat DY.Run vec)'
⎕←#.cmpx cdfn dylg
⍝ _←frea vecp ⋄ _←frea matp ⋄ _←frea resp
∇

∇Benchmark;_
Run¨10,2*5+⍳9
∇

:EndNamespace
