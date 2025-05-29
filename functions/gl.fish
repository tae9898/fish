# ~/.config/fish/functions/gl.fish
function gl --description "git log with options"
    echo "options are [oneline] [files] [all]"
    set CMD "git log --graph --decorate"

    for arg_entry in $argv
        switch $arg_entry
            case shjung3
                set CMD "$CMD --author=\"shjung3@humax-networks.com\""
            case oneline
                set CMD "$CMD --pretty=oneline"
            case short
                set CMD "$CMD --abbrev-commit"
            case files
                set CMD "$CMD --name-status"
            case latest
                set CMD "$CMD HEAD^..HEAD"
            case all
                set CMD "$CMD --all"
            case '*'
                set CMD "$CMD $arg_entry"
        end
    end

    echo "Execute CMD [$CMD]"
    echo
    echo
    eval $CMD
    echo
    echo
end
