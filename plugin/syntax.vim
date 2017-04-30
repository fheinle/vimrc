set statusline=
set statusline+=%(%{'help'!=&filetype?bufnr('%'):''}\ \ %)
set statusline+=%< " Where to truncate line
set statusline+=%f " Path to the file in the buffer, as typed or relative to current directory
set statusline+=%{&modified?'\ +':''}
set statusline+=\ %1*
set statusline+=%{fugitive#statusline()} "
set statusline+=%{&readonly?'\ ':''}
set statusline+=\ %1*
set statusline+=%= " Separation point between left and right aligned items.
set statusline+=\ %{''!=#&filetype?&filetype:'none'}
set statusline+=%(\ %{(&bomb\|\|'^$\|utf-8'!~#&fileencoding?'\ '.&fileencoding.(&bomb?'-bom':''):'')
  \.('unix'!=#&fileformat?'\ '.&fileformat:'')}%)
set statusline+=\ %*
set statusline+=\ %2v " Virtual column number.
set statusline+=\ %3p%% " Percentage through file in lines as in |CTRL-G|
