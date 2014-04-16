autocmd BufReadPost * call LoadLocalVimrc()

function LoadLocalVimrc()
    " Find and source .lvimrc files from the root to the current directory
    let l:mydir=split(getcwd(), '/')
    let l:rootDist=len(mydir)
    let l:acc=0

    if filereadable('/.lvimrc')
        source '/.lvimrc'
    endif

    while acc < rootDist
        let l:curDir='/' . join(mydir[0:acc], '/') . '/'

        if filereadable(curDir . '.lvimrc')
            exec 'source ' . fnameescape(curDir) . '.lvimrc'
        endif

        let l:acc+=1
    endwhile
endfunction
