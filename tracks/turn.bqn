#! ./run_once

la ← ⌊⌾(÷⟜60)0.54×fr
lb ← ⌊⌾(÷⟜60)0.42×fr
base ← Note"F2"
Seq ← base Trans˜ (∾"0a"+⟜↕¨10‿26)⊸⊐
Out ↩ max × 3 Softclip 0.5⊸×

_nb ← {𝕩Trans(2⋆𝕨)⊢⊘×𝕗}
NC ← (Note"C0")_nb

Hg← ((2000÷˜3√20+×˜↕460)×⌜↕la){(+˝÷√∘≠)(0.2×0.95⊸⋆⊸⌊𝕗)×1-2|×⟜𝕗}
c ← ∾Hg¨3⌽1300+500×↕6
Pl← (2÷π) × · (2×π÷fr)⊸×⊸(Tan⁼ Sin∘⊣ ÷ Cos∘⊣ + ·⋆2e7÷˜⊢) +`
q ← 0.25×∾(0×⊏)⊸∾1‿4‿2‿1‿3(Pl×⟜la⊸⥊)¨NC ¯1‿¯6‿¯4‿3‿2

Blmxy ← { 𝕊 lb‿base:
  N ← base _nb
  Bg← {(⌽↕⊸÷100) Fadeback (100 Lp1 2-⥊((⊒÷○(1⊸+)⊒⌾⌽)/𝕨)×⌜Sin(5.7×π)×1.7⋆˜I lb) × Saw (lb×𝕨)/N𝕩}
  b ← 0.8 × 3 Softclip 16 Hp2 ×˜ ∾3‿1/⟨4‿2 Bg 12‿8, 3‿3 Bg 5‿10⟩

  l ← (12×lb) ↑ 200 Lp1 lb ((0.3×0.1⋆1.7⋆˜I∘⊣) (≠⊸⥊˜×⊢) +○Saw⟜(2⊸×)∘/) 2 NC 3‿¯1‿0‿¯4‿¯7
  m ← 0¨⊸∾ 0.3 × 220 Lp1 +○Saw⟜(7⊸Trans) (lb×2.5‿0.25‿0.25‿3) / 1 N 0‿1‿0‿¯4

  xd← 1.5‿1.7⋆⌜˜I 4×lb
  Xs← {0.3×4√0⌈0.3-˜⥊∾≍(Sin (5.7×π)×⊢)⍟(↕3)𝕩}
  x ← (lb÷6)⌽(Xs  xd) × Saw (24×lb)⥊5 NC 6
  y ←        (Xs ⍉xd) × Saw 4 NC 6+0.4×|⊸×0.25 Triangle (24×lb)⥊0.1
  b‿l‿m‿x‿y
}
⟨bi,li,mi,xi,yi⟩ ←                  Blmxy la‿(Note"C0")
⟨b ,l ,m ,x ,y ⟩ ← (1‿2‿2/9‿7‿5÷10)×Blmxy lb‿(Note"F0")

Kg← {((⌽↕⊸÷1e3)Fadeback+˝⋆1‿2‿3×⌜¯2e¯4×↕𝕨) × 5 Hp2 2⊸Softclip⌾(100×+`⁼)4× ∨´ Sine‿Saw‿Triangle {𝕎𝕩}¨𝕨⥊¨𝕩‿24‿53}
k ← Clip∾(5‿5‿6×lb÷8)Kg¨31‿41‿36
Km ← (≢⥊k˙)⊸×(12⥊5‿5‿6×lb÷8)/-⟜'0'
⟨k3,k6⟩ ← Km¨ "100000110000"‿"100011110001"

s ← (2×lb) ↑ ¯4‿900‿1.2 Peak 12‿500‿0.5 Peak 5 Hp2 3e3 Lp2 ((÷⟜8⌊2⋆÷⟜¯1e3)×1-2|1.2⋆(7×⋆2)|⊢)↕4e3
s0← 0¨⊸∾s
h ← ⥊ (⥊4‿3>⌜⌽↕8) ×⌜ ((2⋆¯1.5e¯3×↕) × (1-2|π⋆˜↕) × 4e3 Hp1 Saw∘⥊⟜7456) lb÷4

SM ← {
  w ← (1.8⊸×-⋆⟜3) Saw f ← 20 Lp2 𝕨 / 𝕩
  0.18 × 3500 Lp2 (××0⌈0.7-˜|) w × +˝2⋆(3‿7×¯1e¯6)×⌜(√f)×⊒𝕨/+`»⊸≠𝕩
}
a ← (lb÷4) SM Seq "076bfcb3jjifbc36076bfcb2iifebc36"
ax← (0⥊˜2×lb) Fadefront (6×8×lb)⥊a
p ← 0.15 × (⌽↕⊸÷100)Fadeback +˝ (((16÷√) × (⊢-⋆⟜3)∘Saw) (8×lb)⊸/)˘ Seq ⍉> "06bfj"‿"067ei"‿"07cfl"
pe ← p × ⌽(×˜×3-2.6×⊢)↕⊸÷≠p

#(24×lb) Write ⟨k6,s0,a,b,l,m,x,y⟩
#(24×la) Write ⟨c,q,bi,li,mi,xi,yi⟩

init ← (((6×la)×⊑)(+⎉1´⥊⎉1¨)1⊸↓)¨ ⟨
  ⟨ 4,  c,   bi⟩
  ⟨ 8,  c, q,bi,li,mi⟩
  ⟨ 8,  c, q,bi,li,mi,xi,yi⟩
  ⟨ 4⟩∾⟨c, q,bi,li,mi,xi,(6⋆˜⌽↕⊸÷5×la)Fadeback yi,k,s⟩ (24×la){𝕩(0⌈(↕⊸÷𝕗)⊸×+≤⟜0-0⌈-⟜1)⊸×¨𝕗⊸⥊⌾⌽¨𝕨
      }¯2‿¯1‿¯3‿¯2‿¯2‿¯1‿0 ‿1‿2
⟩
WriteFull ∾ init ∾ (((8×lb)×⊑)(+⎉1´⥊⎉1¨)1⊸↓)¨ ⟨
  ⟨÷2,    k ,s ,(¯4×lb)↑(¯2×lb)↑h⟩
  ⟨ 4,    k ,s ,h⟩
  ⟨ 4, a ,k ,s ,h,{𝕩×⌽⊸×↕⊸÷≠𝕩}(4×8×lb)⥊p⟩
  ⟨ 1, a ⟩
  ⟨ 1, a ,   s0⟩
  ⟨ 5, a ,k3,s0,(0.15×3+⌽↕⊸÷8×lb)Fadeback(5×8×lb)⥊p⟩
  ⟨ 1, a ,k6,s0⟩
  ⟨12, a ,k6,s0,  b,{𝕩×⌽¬×˜↕⊸÷≠𝕩}(12×8×lb)⥊l⟩
  ⟨ 6, ax,k6,s0,  b,  m,{𝕩×↕⊸÷≠𝕩}(6×8×lb)⥊x⟩
  ⟨ 6, a ,k6,s0,  b,l,m,x,y⟩
  ⟨ 6, a ,k6,s0,h,{𝕩×↕⊸÷≠𝕩}(6×8×lb)⥊b⟩
  ⟨ 2, a ,k6,s0,h⟩
  ⟨ 2, a ,k6,   h,pe⟩
  ⟨ 1, ((-lb×3÷2)↓a) ∾ (lb÷2)↓ (lb÷4) SM Seq "iifeeeee", h,(16×lb)↓pe⟩
⟩
