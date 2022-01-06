bqnoise‿outfile ← •Import "config.bqn"
load ← •Import bqnoise∾"load.bqn"

opt‿wav ← Load¨ "options"‿"wav"
Lp1‿Hp1‿Lp2‿Hp2‿Lp2q‿Hp2q‿Bp2q‿Peak‿LShelf‿HShelf‿Notch ← Load "filter"
I‿Add‿Concat‿Shift‿Rep‿Slice‿_onSlice‿Stereo‿Pan‿_norm‿Clip‿Softclip‿Fadefront‿Fadeback‿_crossfade‿Reverb ← Load "mix"
Saw‿Triangle‿Square‿Pulse‿Sine‿White‿Brown‿Pink‿Pluck ← Load "oscillator"
Trans‿Note ← Load "scale"
PanAP ← (¯1⊑≢∘⊢) ↑⎉1 (Load "panap").PanAP

⟨Sin,Cos,Tan⟩ ← •math

opt.SetFreq fr ← 48000
opt.SetFBytes •fBytes
this ← (∧`'.'⊸≠)⊸/•args
Read ← wav.Read this∾"_"∾∾⟜".wav"
max ← 1-˜2⋆1-˜¯1⊑opt.fmt
Out ← (max÷2)⊸×
Write ← outfile wav.Write˜ ·{Out𝕩} ·Add (Stereo ⥊⎉1)¨
WriteFull ← (this∾".wav") wav.Write˜ ·{Out𝕩} Stereo
