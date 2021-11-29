# Synthesis script runner

lf←@+10
ac←"_"∾⥊"aA"+⌜↕26

# Source to list of token strings
Tokenize←{
  ws←" "∾@+9                                # Whitespace: space and tab
  wc←ac∾'0'+↕10                             # Word characters

  # Resolve comments and strings
  s‿d←/¨2↑sm‿dm‿c‿n←𝕩⊸=¨"'""#"∾lf
  g←⍋q←∾⟨  s⋄¯1↓d⋄/c⟩ ⋄q↩g⊏q                # Open indices
  e← g⊏∾⟨2+s⋄ 1↓d⋄-⟜»∘⊏⟜(0∾+`c)⊸//n∾1⟩      # Matching close indices
  Se←{(⊏˜𝕨)Se 1¨⌾((𝕩/𝕨)⊸⊏)𝕩}⍟(0=¯1⊑⊢)       # Mark reachable openings
  a‿b←((≠𝕩)↑·/⁼((≠↑∾⟜≠Se 1∾0¨)q⍋e)⊸/)¨q‿e   # Open/close masks
  qe←a∧∧⟜«dm                                # Quote Escape ""
  k←qe∨»≠`ab←a∨b                            # Token continuation mask
  {⟨⊑/𝕩,"Unclosed quote"⟩!0}⍟(∨´)(sm∨dm)>k∨a

  ign←(𝕩∊ws)∨ii←≠`ab∧c∨n                    # Ignored characters
  k∨↩»⊸∧k<l←𝕩∊wc                            # Group words
  k∨↩»𝕩='•'
  ts←n∨¬k∨ign                               # Token start mask
  ⟨𝕩⊔˜1-˜(ii∨k<ign)¬⊸×+`ts, /ts⟩
}
Statements←{𝕊 tok‿pos:
  sep ← ⥊¨",⋄"∾lf
  brak←(⥊¨"{}⟨⟩")≡⌜tok
  asgn← ⥊¨"←⇐"#↩
  lev ← +`-˝brak
  g←(1-˜¬×1+`1⊸(»<⊢))(0=lev)∧tok∊sep
  t‿p‿l‿b ← g⊸⊔¨𝕩∾⟨»lev,0=+`-˝2↑brak⟩
  vg←l{(ac∊˜⊑¨𝕩)×1+≠`«⊸≠⌾((⍋𝕨)⊸⊏)𝕩∊asgn}¨t
  io←(⊢+32×1="A["⊸⍋⚇1)<˘⍉>t⊔˜¨b(2∾˜1-˜1⊸+⊸⌊)¨vg
  ⟨⊑¨p,t⟩∾io
}

repl ← •BQN{(𝔽⊑)⎊(𝔽1⊸⊑)} "•ReBQN{repl⇐""strict""}"‿"•Eval"
Eval ← (•args{(⊑𝕨)⌾(1⊸⊑)⍟(0<≠𝕨)𝕩}•state)⊸Repl
Eval•FChars"synth.bqn"
runLine←{
  lines ← ⟨⟩      # Tokens and predecessor line IDs
  cache ← ⟨⟩      # Corresponding result namespace
  RL ← {tok‿iid‿code‿in‿out 𝕊 ci:
    List←"⟨"∾"⟩"«·∾","⊸∾¨
    _E←{(0<≠∘⊢)◶""‿𝔽}
    fn ← Eval ∾⟨"{"
      iid("←"∾˜·List·List¨⊐⊸⊔)_E in,  "𝕩⋄"
      code
      ("⇐"∾˜List)_E out
    "}"⟩
    res ← Fn (⍷iid)⊏cache
    (0<≠out)◶¯1‿{cache∾↩<res⋄1-˜≠lines∾↩<𝕩} tok‿iid
  }{
    𝕩 𝔽⍟((≠lines)⊸≤) ⊑lines⊐<2↑𝕩
  }
}

RunAll←{
  pos‿tok‿in‿out ← Statements Tokenize 𝕩
  code ← (1-˜/𝕩(≠⊸«-⊢)0∾pos)⊔𝕩
  in ↩ ⍷¨in
  id ← (/≠¨in)⊔out((+`≠¨out)⍋⊐)○∾in  # TODO redefinition
  in‿id /¨˜¨↩ <id<↕≠id
  li←⟨⟩ ⋄ @∘{li∾↩RunLine ⊏⟜li⌾(1⊸⊑)𝕩}˘ ⍉>⟨tok,id,code,in,out⟩
  li
}
•args {𝕏·∾·•FChars¨𝕨˙}⍟(0<≠∘⊣) runAll
