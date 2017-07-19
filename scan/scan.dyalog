:Namespace scan

S←':Namespace' 'Run←{¯32↑+\⍵}' ':EndNamespace'

DY←⎕FIX S
CD←'scan' #.codfns.Fix S
SOP←#.codfns.BSO'scan'
'cdrun'⎕NA SOP,'|Run_cdf P P P'
mka←'scan'∘#.codfns.MKA
frea←{}'scan'∘#.codfns.FREA
exa←'scan'∘#.codfns.EXA

∇Run RS;RA;RAP;RESP;kern;cdfn;dylg
⎕←RS
RA←0.01×?RS⍴100
RAP←mka RA
RESP←mka ⍬
kern←'#.scan.(exa RESP⊣cdrun RESP 0 RAP)'
cdfn←'#.scan.(CD.Run RA)'
dylg←'#.scan.(DY.Run RA)'
⎕←#.cmpx kern dylg
frea RAP ⋄ frea RESP
∇

∇Benchmark;_
⎕←'Vector'
Run¨2*10+⍳18
∇

:EndNamespace
