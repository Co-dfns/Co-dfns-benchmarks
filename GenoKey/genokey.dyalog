:Namespace genokey

S←':Namespace' 'Do←{⍺∧0≠⍵}' ':EndNamespace'

⎕SE.SALT.Load './GenoKey/genokey_cd -target=#'
⎕SE.SALT.Load './GenoKey/genokey_dy -target=#'
⎕SE.SALT.Load './GenoKey/genokey_RP0 -target=#'
⎕SE.SALT.Load './GenoKey/genokey_RP1 -target=#'

CD←'genokey'#.codfns.Fix S
DYR←{⍺∧0≠⍵}

RPCD←CD.Do #.genokey_cd.rp_joinx
RPDY←#.genokey_dy.rp_joinx

Call←{'#.genokey.{⊃',⍺,'/⍵}',⍵}

∇Benchmark
⎕←#.timing.cmpx ('RPCD'Call'#.RP1')('RPDY'Call'#.RP1')⊣⎕←''
⎕←#.timing.cmpx ('RPCD'Call'#.RP0')('RPDY'Call'#.RP0')⊣⎕←''
∇

:EndNamespace