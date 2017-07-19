:Namespace sum35

S←':Namespace' 'Run←{+/÷1+((0=3|a)∨0=5|a)/a←⍳⍵}' ':EndNamespace'

DY←⎕FIX S
CD←'sum35' #.codfns.Fix S

Run←{⎕←#.cmpx ('#.sum35.CD.Run ',⍵)('#.sum35.DY.Run ',⍵)⊣⎕←''}

∇Benchmark
Run∘⍕¨256,2*10+⍳15
∇

:EndNamespace
