:Namespace crlf2lf

S←':Namespace' 'Run←{((13≠⍵)∨(10≠1⌽⍵))/⍵}' ':EndNamespace'

DY←⎕FIX S
CD←'crlf2lf' #.codfns.Fix S
SOP←#.codfns.BSO'crlf2lf'
'cdrun'⎕NA SOP,'|Run_cdf P P P'
'sync'⎕NA SOP,'|afsync'
mka←'crlf2lf'∘#.codfns.MKA
frea←{}'crlf2lf'∘#.codfns.FREA
kern←'#.crlf2lf.{cdrun ZP 0 DP ⋄ sync}⍬'
cdfns←'#.crlf2lf.(CD.Run D)'
dylg←'#.crlf2lf.(DY.Run D)'

∇Run X;D;ZP;DP
 D←,10,⍨13,⍨?X 100⍴256 ⋄ ⎕←X ⋄ DP←mka D ⋄ ZP←mka ⍬
 ⎕←#.cmpx kern dylg
 frea DP ⋄ frea ZP
∇

∇Benchmark
 Run¨2*10+⍳9
∇

:EndNamespace
