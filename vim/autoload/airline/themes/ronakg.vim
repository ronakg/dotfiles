let g:airline#themes#ronakg#palette = {}

" Normal Mode:
let s:N1 = [ '#585858' , '#e4e4e4' , 240 , 223 ] " Mode
let s:N2 = [ '#e4e4e4' , '#0087af' , 223 , 31  ] " Info
let s:N3 = [ '#eeeeee' , '#005f87' , 223 , 24  ] " StatusLine


let g:airline#themes#ronakg#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)
let g:airline#themes#ronakg#palette.normal_modified = {
      \ 'airline_a': [ '#eeeeee' , '#005f87' , 223, 160, '' ] ,
      \ 'airline_c': [ '#eeeeee' , '#005f87' , 223 , 24 , '' ] ,
      \ }


" Insert Mode:
let s:I1 = [ '#585858' , '#e4e4e4' , 240 , 214 ] " Mode
let s:I2 = [ '#e4e4e4' , '#0087af' , 223 , 31  ] " Info
let s:I3 = [ '#eeeeee' , '#005f87' , 223 , 24  ] " StatusLine


let g:airline#themes#ronakg#palette.insert = airline#themes#generate_color_map(s:I1, s:I2, s:I3)
let g:airline#themes#ronakg#palette.insert_modified = {
      \ 'airline_a': [ '#eeeeee' , '#005f87' , 223, 160, '' ] ,
      \ 'airline_c': [ '#eeeeee' , '#005f87' , 223 , 24 , '' ] ,
      \ }


" Replace Mode:
let g:airline#themes#ronakg#palette.replace = copy(g:airline#themes#ronakg#palette.insert)
let g:airline#themes#ronakg#palette.replace_modified = {
      \ 'airline_a': [ '#eeeeee' , '#005f87' , 223, 160, '' ] ,
      \ 'airline_c': [ '#eeeeee' , '#005f87' , 223 , 24 , '' ] ,
      \ }


" Visual Mode:
let s:V1 = [ '#005f87', '#e4e4e4', 223, 34 ]
let s:V2 = [ '',        '#0087af', '',  31  ]
let s:V3 = [ '#e4e4e4', '#005f87', 223, 24  ]

let g:airline#themes#ronakg#palette.visual = airline#themes#generate_color_map(s:V1, s:V2, s:V3)
let g:airline#themes#ronakg#palette.visual_modified = {
      \ 'airline_a': [ '#eeeeee' , '#005f87' , 223, 160, '' ] ,
      \ 'airline_c': [ '#e4e4e4', '#005f87', 223, 24  ] ,
      \ }

" Inactive:
let s:IA = [ '#585858' , '#e4e4e4' , 223 , 240, '' ]
let g:airline#themes#ronakg#palette.inactive = airline#themes#generate_color_map(s:IA, s:IA, s:IA)
let g:airline#themes#ronakg#palette.inactive_modified = {
      \ 'airline_a': [ '#eeeeee' , '#005f87' , 223, 160, '' ] ,
      \ 'airline_c': [ '#585858' , '#e4e4e4' , 240 , 223 , '' ] ,
      \ }

let g:airline#themes#ronakg#palette.tabline = {
            \ 'airline_tab': ['#eeeeee', '#005f87' , 223, 31, '' ],
            \ 'airline_tabfill': ['#eeeeee', '#005f87' , 223, 236, '' ],
            \ 'airline_tabsel': ['#eeeeee', '#005f87' , 240, 223, '' ],
            \ 'airline_tabmod':  [ '#eeeeee' , '#005f87' , 223, 160, '' ],
            \ 'airline_tabmod_unsel':  [ '#eeeeee' , '#005f87' , 223, 167, '' ],
            \ 'airline_tabtype':  [ '#eeeeee' , '#005f87' , 234, 106, '' ],
            \ }
