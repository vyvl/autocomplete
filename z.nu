export extern z [
    query: string@"nu-complete zoxide list"
]

def "nu-complete zoxide list" [line : string, pos: int] {
    let prefix = ($line | str substring [0, $pos] | split row ' ' | skip 1 | take 1 | get 0)
    let data = (zoxide query $prefix --list | lines)
    {
        completions : $data,
                    options: {
                     completion_algorithm: "fuzzy"
                    }
    }

}