:Namespace scan

S←':Namespace' 'Run←{+\⍵}' ':EndNamespace'

DY←⎕FIX S
CD←'scan' #.codfns.Fix S
SOP←#.codfns.BSO'scan'
'cdrun'⎕NA SOP,'|Runfn P P P'
mka←'scan'∘#.codfns.MKA
frea←{}'scan'∘#.codfns.FREA

∇Run RS;RA;RAP;RESP;kern;cdfn;dylg
⎕←RS
RA←0.01×?RS⍴100
RAP←mka RA
RESP←mka ⍬
kern←'#.scan.(cdrun RESP 0 RAP)'
cdfn←'#.scan.(CD.Run RA)'
dylg←'#.scan.(DY.Run RA)'
⎕←#.timing.cmpx kern dylg
frea RAP ⋄ frea RESP
∇

∇Benchmark;_
⎕←'Vector'
Run¨2*10+⍳18
∇

:EndNamespace
