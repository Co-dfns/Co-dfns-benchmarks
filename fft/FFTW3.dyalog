    :Namespace FFTW3  ⍝ Fast Fourier Transform using FFTW 3.3.3 (cf. http://fftw.org)
        ⎕IO←0 ⋄ ⎕ML←1 ⋄ ⎕PP←5 ⋄ ⎕FR←645 ⋄ ⎕CT←0 ⋄ ⎕DIV←0
        FFTW3←⎕THIS
       
        RI←{645 ⎕DR ⊃(⎕DR ⍵)1289 ⎕DR ⍵}      ⍝ {,[¯2↑⍳⍴⍴⍵]⍵}(Re ⍵),[¯.5+⍴⍴⍵](Im ⍵)}
        IRI←{1289 ⎕DR ⊃(⎕DR ⍵)645 ⎕DR ⍵}     ⍝ Inverse of RI

        ∇ Init;W;dyalog;fftw
          :If 0=⎕NC'⍙FFTW3_INIT'
              FFTW_FORWARD←¯1           ⍝ (-1) /*sign of exponent*/
              FFTW_BACKWARD←1           ⍝ (+1)
              FFTW_MEASURE←0            ⍝ (0 U)
              FFTW_DESTROY_INPUT←2*0    ⍝ (1 U<<0)
              FFTW_UNALIGNED←2*1        ⍝ (1 U<<1)
              FFTW_CONSERVE_MEMORY←2*2  ⍝ (1 U<<2)
              FFTW_EXHAUSTIVE←2*3       ⍝ (1 U<<3)/*NO_EXHAUSTIVE is default*/
              FFTW_PRESERVE_INPUT←2*4   ⍝ (1 U<<4)/*cancels FFTW_DESTROY_INPUT*/
              FFTW_PATIENT←2*5          ⍝ (1 U<<5)/*IMPATIENT is default*/
              FFTW_ESTIMATE←2*6         ⍝ (1 U<<6)
              FFTW_WISDOM_ONLY←2*21     ⍝ (1 U<<21)
              ⍝ fftw_complex*in,*out;  /* If <complex.h> is included, use the C99 complex type.  Otherwise define a type bit-compatible with C99 complex */
              ⍝ fftw_plan p;
              fftw←'./fft/libfftw3-3'
              :If 0 ⋄ dyalog←'dyalog32' ⋄ W←'4'  ⍝ 32-bit
              :Else ⋄ dyalog←'dyalog64' ⋄ W←'8'  ⍝ 64-bit
              :EndIf
              '⍙FFTW3_Read'⎕NA dyalog,'|MEMCPY >F8[] P U',W    ⍝ provide size of array
              ⍝'⍙FFTW3_Read'⎕NA dyalog,'|MEMCPY =F8[] P U',W    ⍝ provide array of the same size
              '⍙FFTW3_Write'⎕NA dyalog,'|MEMCPY P <F8[] U',W
              '⍙FFTW3_Malloc'⎕NA'P ',fftw,'|fftw_malloc U',W
              '⍙FFTW3_Free'⎕NA fftw,'|fftw_free P'
              ⍝ '⍙FFTW3_Plan'⎕NA'P ',fftw,'|fftw_plan_dft_1d I',W,' <F8[] >F8[] I',W,' U',W ⍝ what it is in C
              '⍙FFTW3_Plan'⎕NA'P ',fftw,'|fftw_plan_dft_1d I',W,' P P I',W,' U',W ⍝ we don't want APL to try and read/write there !
              '⍙FFTW3_Clean'⎕NA fftw,'|fftw_destroy_plan P'
              '⍙FFTW3_Execute'⎕NA fftw,'|fftw_execute P'
              ⍙FFTW3_INIT←1
          :EndIf
        ∇

        ∇ (plan input output)←inv GetPlan size;bytes;size;sign;doubles
          sign←(inv≠0)⊃FFTW_FORWARD FFTW_BACKWARD
          bytes←8×doubles←2×size
          (input output)←⍙FFTW3_Malloc¨2⍴bytes  ⍝ in=(fftw_complex*)fftw_malloc(sizeof(fftw_complex)*N);  out=(fftw_complex*)fftw_malloc(sizeof(fftw_complex)*N);
          plan←⊃⍙FFTW3_Plan size input output sign FFTW_ESTIMATE  ⍝ p=fftw_plan_dft_1d(N,in,out,FFTW_FORWARD,FFTW_ESTIMATE);
        ∇

        ∇ sig←sig RunPlan(plan input output);size;doubles;bytes
          bytes←8×doubles←2×size←≢sig
          sig←RI sig
          {}⍙FFTW3_Write input sig bytes
          {}⍙FFTW3_Execute plan              ⍝ fftw_execute(p);/*repeat as needed*/
          sig←⍙FFTW3_Read doubles output bytes  ⍝ provide output size
          ⍝sig←⍙FFTW3_Read sig output bytes     ⍝ provide output
          sig←IRI sig
        ∇

        ∇ ClearPlan(plan input output)
          {}⍙FFTW3_Clean plan                ⍝ fftw_destroy_plan(p);
          {}⍙FFTW3_Free¨input output         ⍝ fftw_free(in);fftw_free(out);
        ∇

        ∇ sig←{inv}FFT sig;bytes;doubles;size;plan;input;output
          :If 0=⎕NC'inv' ⋄ inv←0 ⋄ :EndIf
          FFTW3.Init
          (plan input output)←inv FFTW3.GetPlan≢sig
          sig←sig FFTW3.RunPlan(plan input output)
          FFTW3.ClearPlan(plan input output)
        ∇     

        ∇ sig←IFFT sig
          sig←1 FFT sig
        ∇

    :EndNamespace ⍝ FFTW3
