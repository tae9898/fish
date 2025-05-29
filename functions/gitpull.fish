# ~/.config/fish/functions/gitpull.fish
function gitpull --description "git pull with rebase, stash"
    # check git version
    set GIT_VERSION_MAJOR (git --version | awk '{print $3}' | cut -d '.' -f 1)
    set GIT_VERSION_MINOR (git --version | awk '{print $3}' | cut -d '.' -f 2)

    if test $GIT_VERSION_MAJOR -ge 2 -a $GIT_VERSION_MINOR -ge 17
        set CMD "git pull --rebase --autostash && gs all"
    else
        set CMD "git stash && git pull --rebase && git stash pop > /dev/null && gs all"
    end

    echo "Execute CMD [$CMD]"
    sleep 1
    echo
    echo
    eval $CMD
    echo
    echo
end
