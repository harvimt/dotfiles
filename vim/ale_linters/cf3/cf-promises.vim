function! ale_linters#cf3#cf_promises(buffer, lines) abort
    " Output looks like:
    "promise.cf:14:2: error: syntax error
    " }
    "  ^
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

call ale#linter#Define('cf3', {
            \   'name': 'cf_promises',
            \   'executable': 'cf-promises',
            \   'output_stream': 'both',
            \   'command': '%e -cf %s',
            \   'callback': 'ale_linters#cf3#cf_promises#Handle',
            \   'lint_file': 1,
            \ })
