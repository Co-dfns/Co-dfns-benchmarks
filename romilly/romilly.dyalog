:Namespace romilly
  ⎕IO←0

S←':Namespace' 'Run←{÷1+*-⍺+.×⍵}' ':EndNamespace'

DY←⎕FIX S
CD←'romilly' #.codfns.Fix S
'accrun'⎕NA'./romilly/romilly.so|romilly P P P U8 U8'
'accmak'⎕NA'P ./romilly/romilly.so|makedata <F8[] U8'
'accfre'⎕NA'./romilly/romilly.so|freedata P U8'

∇Run X;mat;vec;CDR;DYR
mat←0.01×?X X⍴100
vec←0.01×?X⍴100
matp←accmak (,mat) (X×X)
vecp←accmak vec X
resp←accmak (X⍴0) X
⎕←#.timing.cmpx '#.romilly.(accrun resp matp vecp X X)' '#.romilly.(vec CD.Run mat)'
_←accfre matp (X×X) ⋄ accfre vecp X ⋄ accfre resp X
∇

∇Benchmark
Run¨10*1+⍳4
∇

:EndNamespace
