-- ---------------------------------------------
-- LAYOUTS
-- ---------------------------------------------
-- Table of layouts to cover with awful.layout.inc, order matters.
--local greeks = { 'α', 'β', 'γ', 'δ', 'ε', 'ζ', 'η', 'θ', 'ι', 'κ', 'λ', 'μ', 'ν', 'ξ', 'ο', 'π', 'ρ', 'σ', 'τ', 'υ', 'φ', 'χ', 'ψ', 'ω' }

layouts =
{
    lain.layout.uselesstile,
    awful.layout.suit.floating,
    awful.layout.suit.tile.left,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.fair.horizontal,
    awful.layout.suit.spiral.dwindle,
    lain.layout.termfair,
    lain.layout.cascadetile,
    lain.layout.centerwork

    --awful.layout.suit.floating,
    --awful.layout.suit.tile,
    --awful.layout.suit.tile.left,
    --awful.layout.suit.tile.bottom,
    --awful.layout.suit.tile.top,
    --awful.layout.suit.fair,
    --awful.layout.suit.fair.horizontal,
    --awful.layout.suit.spiral,
    --awful.layout.suit.spiral.dwindle,
    -- awful.layout.suit.max,
    -- awful.layout.suit.max.fullscreen,
    --awful.layout.suit.magnifier,
    
    -- lain layouts
    --lain.layout.termfair,
    --lain.layout.centerfair,
    --lain.layout.cascade,
    --lain.layout.cascadetile,
    --lain.layout.centerwork,
    --lain.layout.uselessfair,
    --lain.layout.uselesspiral
    --lain.layout.uselesstile

}
-- ---------------------------------------------
-- TAGS
-- ---------------------------------------------
-- Define a tag table which hold all screen tags.
tags = {}
for s = 1, screen.count() do
    -- Each screen has its own tag table.
    -- tags[s] = awful.tag({'一', '二', '三', '四', '五', '六', '七', '八', '九'}, s, layouts[1])
    -- tags[s] = awful.tag({'the', 'quality', 'of', 'mercy', 'is', 'not', 'strained', 'it', 'droppeth'}, s, layouts[1])
    -- tags[s] = awful.tag({'k', 'a', 'w', 'a', 'i', 'i', 'u', 'g', 'u'}, s, layouts[1])
    tags[s] = awful.tag({'1', '2', '3' , '4', '5', '6', '7', '8', '9'}, s, layouts[1])
    -- tags[s] = awful.tag({'i', 'ii', 'iii', 'iv', 'v', 'vi', 'vii', 'viii', 'ix'}, s, layouts[1])
end
