:Namespace genokey

⎕SE.SALT.Load './genokey/genokey_cd -target=#'
⎕SE.SALT.Load './genokey/genokey_dy -target=#'
⍝ ⎕SE.SALT.Load './genokey/genokey_acc -target=#'
⎕SE.SALT.Load './genokey/genokey_RP0 -target=#'
⎕SE.SALT.Load './genokey/genokey_RP1 -target=#'

RPCD←#.genokey_cd.rp_joinx
RPDY←#.genokey_dy.rp_joinx
⍝RPAC←#.genokey_acc.rp_joinx

Call←{'#.genokey.{⊃',⍺,'/⍵}',⍵}

∇Benchmark
⎕←#.cmpx 1↓('RPAC'Call'#.RP1')('RPCD'Call'#.RP1')('RPDY'Call'#.RP1')⊣⎕←''
⎕←#.cmpx 1↓('RPAC'Call'#.RP0')('RPCD'Call'#.RP0')('RPDY'Call'#.RP0')⊣⎕←''
∇

:EndNamespace
