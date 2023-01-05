#! ./run_once

lb ← ⌊⌾(÷⟜60)0.42×fr
base ← Note"F2"
Seq ← base Trans˜ (∾"0a"+⟜↕¨10‿26)⊸⊐

Gk← {((⌽↕⊸÷1e3)Fadeback+˝⋆1‿2‿3×⌜¯2e¯4×↕𝕨) × 5 Hp2 2⊸Softclip⌾(100×+`⁼)4× ∨´ Sine‿Saw‿Triangle {𝕎𝕩}¨𝕨⥊¨𝕩‿24‿53}
k ← Clip∾(5‿5‿6×lb÷8)Gk¨31‿41‿36

s ← (2×lb) ↑ ¯4‿900‿1.2 Peak 12‿500‿0.5 Peak 5 Hp2 3e3 Lp2 ((÷⟜8⌊2⋆÷⟜¯1e3)×1-2|1.2⋆(7×⋆2)|⊢)↕4e3
h ← ⥊ (⥊4‿3>⌜⌽↕8) ×⌜ ((2⋆¯1.5e¯3×↕) × (1-2|π⋆˜↕) × 4e3 Hp1 Saw∘⥊⟜7456) lb÷4

SM ← {
  w ← (1.8⊸×-⋆⟜3) Saw f ← 20 Lp2 𝕨 / 𝕩
  0.18 × 3500 Lp2 (××0⌈0.7-˜|) w × +˝2⋆(3‿7×¯1e¯6)×⌜(√f)×⊒𝕨/+`»⊸≠𝕩
}
a ← (lb÷4) SM Seq "076bfcb3jjifbc36076bfcb2iifebc36"

(8×lb) Write ⟨k,s,h,a⟩
