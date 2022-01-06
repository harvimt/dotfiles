function! ale_linters#sudoers#visudo#Handle(buffer, lines) abort
    " Output looks like:
    "src/etc/sudoers.d/odosvc:2:14: syntax error
    "odosvc chown -R odosvc-alt:odosvc-alt -- NOPASSWD:ALL
    "             ^~
    let result = []
    let pattern = '\([^:]\+\):\(\d\+\):\(\d\+\): \(.*\)$'
    for line in a:lines
        let matches = matchlist(line, pattern)
        if len(matches) >= 4
            let element = {
                        \ 'text': matches[4],
                        \ 'lnum':  matches[2] + 0,
                        \ 'col': matches[3] + 0,
                        \ 'type': 'E'
                        \ }
            call add(result, element)
        endif
    endfor
    return result
endfun

call ale#linter#Define('sudoers', {
            \   'name': 'visudo',
            \   'executable': 'visudo',
            \   'output_stream': 'both',
            \   'command': '%e -cf %s',
            \   'callback': 'ale_linters#sudoers#visudo#Handle',
            \   'lint_file': 1,
            \ })
