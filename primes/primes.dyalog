:Namespace primes

S←':Namespace' 'Run←{(2=+⌿0=X∘.|X)/X←⍳⍵}' ':EndNamespace'

DY←⎕FIX S
CD←'primes' #.codfns.Fix S

Run←{⎕←#.cmpx ('#.primes.CD.Run ',⍵)('#.primes.DY.Run ',⍵)⊣⎕←''}

∇Benchmark
Run∘⍕¨256,2*10+⍳4
∇

:EndNamespace
