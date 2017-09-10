:Namespace innerproduct
  ⎕IO←0

S←':Namespace' 'Run←{⍺+.×⍵}' ':EndNamespace'

DY←⎕FIX S
CD←'innerproduct' #.codfns.Fix S
SOP←#.codfns.BSO'innerproduct'
'cdrun'⎕NA SOP,'|Run_cdf P P P'
'sync'⎕NA SOP,'|afsync'
mka←'innerproduct'∘#.codfns.MKA
frea←{}'innerproduct'∘#.codfns.FREA

∇Run(LS RS);LA;RA;LAP;RAP;RESP;kern;cdfn;dylg
⎕←'(',(⍕LS),')(',(⍕RS),')'
LA←0.01×?LS⍴100
RA←0.01×?RS⍴100
LAP←mka LA
RAP←mka RA
RESP←mka ⍬
kern←'#.innerproduct.{cdrun RESP LAP RAP ⋄ sync}⍬'
cdfn←'#.innerproduct.(LA CD.Run RA)'
dylg←'#.innerproduct.(LA DY.Run RA)'
⎕←#.cmpx kern dylg
frea RAP ⋄ frea LAP ⋄ frea RESP
∇

∇Benchmark;_
⎕←'Scalar Vector'
Run¨(⊂⍬)∘,¨2*10+⍳18
⎕←'Scalar Matrix'
Run¨((⊂⍬),∘⊂2⍴⊢)¨2*5+⍳9
⎕←'Vector Scalar'
Run¨(2*10+⍳18),¨⊂⊂⍬
⎕←'Matrix Scalar'
Run¨((⊂⍬),⍨∘⊂2⍴⊢)¨2*5+⍳9
⎕←'Vector Vector'
Run¨(2⍴⊢)¨2*10+⍳17
⎕←'Vector Matrix'
Run¨(⊢,∘⊂2⍴⊢)¨2*5+⍳9
⎕←'Matrix Vector'
Run¨(⊢,⍨∘⊂2⍴⊢)¨2*5+⍳9
⎕←'Matrix Matrix'
Run¨(2⍴∘⊂2⍴⊢)¨2*5+⍳8
∇

:EndNamespace
