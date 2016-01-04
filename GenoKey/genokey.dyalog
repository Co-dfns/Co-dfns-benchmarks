:Namespace genokey

⎕SE.SALT.Load './GenoKey/genokey_cd -target=#'
⎕SE.SALT.Load './GenoKey/genokey_dy -target=#'
⎕SE.SALT.Load './GenoKey/genokey_acc -target=#'
⎕SE.SALT.Load './GenoKey/genokey_RP0 -target=#'
⎕SE.SALT.Load './GenoKey/genokey_RP1 -target=#'

RPCD←#.genokey_cd.rp_joinx
RPDY←#.genokey_dy.rp_joinx
RPAC←#.genokey_acc.rp_joinx

Call←{'#.genokey.{⊃',⍺,'/⍵}',⍵}

∇Benchmark
⎕←#.timing.cmpx 1↓('RPAC'Call'#.RP1')('RPCD'Call'#.RP1')('RPDY'Call'#.RP1')⊣⎕←''
⎕←#.timing.cmpx 1↓('RPAC'Call'#.RP0')('RPCD'Call'#.RP0')('RPDY'Call'#.RP0')⊣⎕←''
∇

:EndNamespace