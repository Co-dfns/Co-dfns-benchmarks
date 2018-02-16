:Namespace fft
  ⎕IO←0

S←':Namespace' 'Run←{⎕FFT ⍵}' ':EndNamespace'

FFTW3←⎕SE.SALT.Load './fft/FFTW3'
CD←'fft' #.codfns.Fix S
SOP←'fft',#.codfns.soext⍬
'cdrun'⎕NA SOP,'|Run_cdf P P P'
'sync'⎕NA SOP,'|afsync'
mka←'fft'∘#.codfns.MKA
frea←'fft'∘#.codfns.FREA
get←'fft'∘#.codfns.EXA

∇Run X;dat;datp;kern;cdfn;dylg;_
⎕←X
dat←(?X⍴0)+0J1×(?X⍴0)
datp←mka dat
resp←mka ⍬
kern←'#.fft.{cdrun resp 0 datp ⋄ sync}⍬'
cdfn←'#.fft.(CD.Run dat)'
dylg←'#.fft.(FFTW3.FFT dat)'
⎕←#.cmpx kern cdfn dylg
_←frea datp ⋄ _←frea resp
∇

∇Benchmark;_
Run¨10,2*10+⍳11
∇

:EndNamespace
