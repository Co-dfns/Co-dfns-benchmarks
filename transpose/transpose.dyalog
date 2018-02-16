:Namespace transpose
  ⎕IO←0

S←':Namespace' 'Run←{⍉⍵}' ':EndNamespace'

DY←⎕FIX S
CD←'transpose' #.codfns.Fix S
SOP←'transpose',#.codfns.soext⍬
'cdrun'⎕NA SOP,'|Run_cdf P P P'
'sync'⎕NA SOP,'|afsync'
mka←'transpose'∘#.codfns.MKA
frea←{}'transpose'∘#.codfns.FREA

∇Run RS;LA;RA;LAP;RAP;RESP;kern;cdfn;dylg
⎕←RS
RA←0.01×?RS RS⍴0
RAP←mka RA
RESP←mka ⍬
kern←'#.transpose.{cdrun RESP 0 RAP ⋄ sync}⍬'
cdfn←'#.transpose.(CD.Run RA)'
dylg←'#.transpose.(DY.Run RA)'
⎕←#.cmpx kern cdfn dylg
frea RAP ⋄ frea RESP
∇

∇Benchmark;_
Run¨2*8+⍳5
∇

:EndNamespace
