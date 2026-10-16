" ─────────────────────────────────────────────
"  SATURNES VAPOR — version Vim
"  Mêmes couleurs que les thèmes VS Code et Sublime Text :
"  nuit indigo profonde + bleu / rose / violet vaporwave
" ─────────────────────────────────────────────

set background=dark
highlight clear
if exists('syntax_on')
  syntax reset
endif
let g:colors_name = 'saturnes_vapor'

" La palette, définie une seule fois et réutilisée partout
let s:fond         = '#0c0818'
let s:fond_profond = '#07040f'
let s:ligne_active = '#1a1033'
let s:popup        = '#120b26'
let s:bordure      = '#1e1440'
let s:espaces      = '#251a4a'
let s:guide_actif  = '#4a3480'
let s:selection    = '#3b1c53'
let s:num_ligne    = '#4a3a78'
let s:texte        = '#ece4ff'

let s:cyan         = '#2ee6ff'
let s:cyan_clair   = '#8ff0ff'
let s:bleu         = '#4d7cff'
let s:violet       = '#9d5cff'
let s:orchidee     = '#e070ff'
let s:rose_vif     = '#ff3d9a'
let s:rose         = '#ff3db1'
let s:rose_param   = '#ff68ca'
let s:rose_leger   = '#ffc2ea'
let s:lilas        = '#8f8fd8'
let s:commentaire  = '#5d4f8a'
let s:rouge        = '#ff4d6a'

" Hi('Groupe', texte, fond, style)
function! s:Hi(group, fg, ...) abort
  let l:bg = a:0 >= 1 && a:1 !=# '' ? a:1 : 'NONE'
  let l:st = a:0 >= 2 && a:2 !=# '' ? a:2 : 'NONE'
  execute 'highlight' a:group 'guifg=' . a:fg 'guibg=' . l:bg 'gui=' . l:st 'cterm=' . l:st
endfunction

" L'interface de l'éditeur (fond, curseur, sélection…)
call s:Hi('Normal',       s:texte,     s:fond)
call s:Hi('Cursor',       s:fond,      s:cyan)
call s:Hi('CursorLine',   'NONE',      s:ligne_active)
call s:Hi('CursorColumn', 'NONE',      s:ligne_active)
call s:Hi('ColorColumn',  'NONE',      s:ligne_active)
call s:Hi('LineNr',       s:num_ligne, s:fond)
call s:Hi('CursorLineNr', s:cyan,      s:ligne_active)
call s:Hi('SignColumn',   s:num_ligne, s:fond)
call s:Hi('FoldColumn',   s:num_ligne, s:fond)
call s:Hi('Folded',       s:lilas,     s:popup)
call s:Hi('Visual',       'NONE',      s:selection)
call s:Hi('Search',       s:fond_profond, s:orchidee)
call s:Hi('IncSearch',    s:fond_profond, s:cyan)
call s:Hi('CurSearch',    s:fond_profond, s:cyan)
call s:Hi('MatchParen',   s:cyan,      'NONE', 'underline,bold')
call s:Hi('NonText',      s:espaces)
call s:Hi('SpecialKey',   s:espaces)
call s:Hi('EndOfBuffer',  s:espaces)
call s:Hi('Whitespace',   s:espaces)
call s:Hi('VertSplit',    s:bordure,   s:fond)
call s:Hi('StatusLine',   s:texte,     s:bordure)
call s:Hi('StatusLineNC', s:num_ligne, s:fond_profond)
call s:Hi('TabLine',      s:num_ligne, s:fond_profond)
call s:Hi('TabLineFill',  'NONE',      s:fond_profond)
call s:Hi('TabLineSel',   s:cyan,      s:fond)
call s:Hi('Pmenu',        s:texte,     s:popup)
call s:Hi('PmenuSel',     s:cyan,      s:bordure, 'bold')
call s:Hi('PmenuSbar',    'NONE',      s:popup)
call s:Hi('PmenuThumb',   'NONE',      s:guide_actif)
call s:Hi('WildMenu',     s:fond_profond, s:cyan)
call s:Hi('Directory',    s:cyan)
call s:Hi('Title',        s:cyan,      'NONE', 'bold')
call s:Hi('ErrorMsg',     s:rouge,     'NONE', 'bold')
call s:Hi('WarningMsg',   s:orchidee)
call s:Hi('MoreMsg',      s:cyan)
call s:Hi('ModeMsg',      s:violet,    'NONE', 'bold')
call s:Hi('Question',     s:cyan)
call s:Hi('DiffAdd',      s:cyan,      s:fond_profond)
call s:Hi('DiffChange',   s:orchidee,  s:fond_profond)
call s:Hi('DiffDelete',   s:rouge,     s:fond_profond)
call s:Hi('DiffText',     s:fond_profond, s:orchidee)
call s:Hi('SpellBad',     'NONE',      'NONE', 'undercurl')

" La coloration du code
call s:Hi('Comment',      s:commentaire, 'NONE', 'italic')
call s:Hi('Todo',         s:orchidee,  'NONE', 'bold,italic')

" Mots-clés : if, while, return, static… → violet
call s:Hi('Statement',    s:violet)
call s:Hi('Keyword',      s:violet)
call s:Hi('Conditional',  s:violet)
call s:Hi('Repeat',       s:violet)
call s:Hi('Label',        s:violet)
call s:Hi('Exception',    s:violet)
call s:Hi('StorageClass', s:violet)
call s:Hi('Structure',    s:violet)
call s:Hi('Typedef',      s:violet)

" #include, #define → rose vif
call s:Hi('PreProc',      s:rose_vif)
call s:Hi('Include',      s:rose_vif)
call s:Hi('Define',       s:rose_vif)
call s:Hi('Macro',        s:rose_vif)
call s:Hi('PreCondit',    s:rose_vif)

" Fonctions → cyan
call s:Hi('Function',     s:cyan)

" Chaînes → rose, échappements (\n) → cyan clair
call s:Hi('String',       s:rose)
call s:Hi('SpecialChar',  s:cyan_clair)
call s:Hi('Special',      s:cyan_clair)

" Nombres & constantes → orchidée
call s:Hi('Constant',     s:orchidee)
call s:Hi('Number',       s:orchidee)
call s:Hi('Float',        s:orchidee)
call s:Hi('Boolean',      s:orchidee)
call s:Hi('Character',    s:orchidee)

" Types : int, char… → bleu roi
call s:Hi('Type',         s:bleu)

" Variables
call s:Hi('Identifier',   s:texte)

" Opérateurs & ponctuation → lilas doux
call s:Hi('Operator',     s:lilas)
call s:Hi('Delimiter',    s:lilas)

" Erreurs
call s:Hi('Error',        s:rouge,     'NONE', 'bold')

" HTML : balises bleu → attributs violet → texte rose léger
call s:Hi('htmlTag',        s:bleu)
call s:Hi('htmlEndTag',     s:bleu)
call s:Hi('htmlTagName',    s:bleu)
call s:Hi('htmlSpecialTagName', s:bleu)
call s:Hi('htmlArg',        s:violet,  'NONE', 'italic')
call s:Hi('htmlString',     s:rose_param)
call s:Hi('htmlSpecialChar', s:orchidee)

" CSS : sélecteurs cyan, propriétés bleu, valeurs rose
call s:Hi('cssClassName',   s:cyan)
call s:Hi('cssIdentifier',  s:cyan)
call s:Hi('cssTagName',     s:cyan)
call s:Hi('cssProp',        s:bleu)
call s:Hi('cssAttr',        s:rose)
call s:Hi('cssColor',       s:rose)

" JS : this
call s:Hi('javaScriptThis', s:violet,  'NONE', 'italic')
call s:Hi('jsThis',         s:violet,  'NONE', 'italic')

" Markdown
call s:Hi('markdownH1',     s:cyan,    'NONE', 'bold')
call s:Hi('markdownH2',     s:cyan,    'NONE', 'bold')
call s:Hi('markdownH3',     s:cyan,    'NONE', 'bold')
call s:Hi('markdownBold',   s:orchidee, 'NONE', 'bold')
call s:Hi('markdownItalic', s:texte,   'NONE', 'italic')
call s:Hi('markdownCode',   s:rose)
call s:Hi('markdownCodeBlock', s:rose)
