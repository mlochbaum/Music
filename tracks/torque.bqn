#! ./run_once

lb←⌊⌾(÷⟜600)0.47×fr
Out ↩ (0.7×max) × 4 Softclip ÷⟜2
_e ← {∾𝔽¨⟜<}

k ← ⟨1.1⊸×,⊢,(lb×3÷4)⊸(↑∾-⊸↓),⊢⟩ {𝕎𝕩}_e 1(-÷+)⋆5× Clip 18‿0.82 Hp2q⍟19 lb↑1400
h ← ((2⋆¯7×I) × (¯1+2|π⋆˜↕) × 6e3 Hp1 Saw∘⥊⟜7456) lb÷4

cn ← (lb÷4) / Note¨ "Bb4"‿"G1"‿"D2"‿"Ab3"‿"C#2"‿"Eb1"‿"Bb2"‿"F#1"
dn ← (lb÷3) / Note¨ "G1"  ‿"F2"  ‿"F#1"  ‿"Ab3"   ‿"C1"   ‿"D2"

Bg← { 0.6 × 5e3 Lp1 ¯6‿700‿0.9 HShelf (-𝕩) {(¬2⋆𝕨×I≠𝕩)×𝕩}_e Saw (lb÷2)⥊0.1-˜Note"G0" }
l ← (4×lb) ↑ 0.6 × ∾ (1‿2×lb÷4) ((⋆⟜3-1.1⊸×)Saw∘⥊)⟜Note¨ "Bb4"‿"D2"
Cg← { ⟨Note"G1",1.2⟩ Hp2q ¯3‿800‿1 Peak (⋆⟜3-𝕩⊸×)Saw cn }
d ← 180 Hp1 3e3 Lp1 (1.6⋆˜I-lb÷3) (≠⊸⥊˜×⊢) (⋆⟜3-0.6⊸×)Triangle dn
b ← Bg "32334235"-'0'
c ← Cg 0.8

#(16×lb) Write ⟨k,h,b,c,d⟩

Qu‿Half ← {0¨⊸∾(𝕩×lb)⊸⥊}¨ 4‿8
WriteFull (0⥊˜5×lb÷8) Fadefront ∾ (16×lb)⊸((+⎉1´⥊⎉1¨)¨) ⟨
  ⟨Half h,c⟩
  ⟨h,k,  c⟩
  ⟨h,k,b,∾Cg¨(0.8⊸+∾0.92⊸-)0.015×↕4⟩
  ⟨h,k,b,l,0 ∾○Qu d⟩
  ⟨h,k,b,l,c ∾○Qu d⟩
  ⟨0¨⊸∾∾⟜(0¨)(4×lb)⥊h,k,  l⟩
  ⟨h,k,b,c⟩
  ⟨  k,b,c,d⟩
  ⟨h,k,b,c,d⟩
  ⟨∾⟜(0¨)(8×lb)⥊c,d⟩
⟩
