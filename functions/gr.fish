# ~/.config/fish/functions/gr.fish
function gr --description "git reset with options"
    set CMD "git reset"

    for arg_entry in $argv
        switch $arg_entry
            case -a --all -f --force
                set CMD "
mv bm-*.log ../ ;
rm -fr .gitignore ;
rm -fr userspace/humax/apps/rego/frontend/ ; git checkout userspace/humax/apps/rego/frontend/ ;
rm -fr userspace/humax/apps/wifi_agent/ ; git checkout userspace/humax/apps/wifi_agent/ ;
rm -fr userspace/public/libs/cjose/ ; git checkout userspace/public/libs/cjose/ ;
rm -fr bcasdk/ build-brcm*/ ;
rm -fr rdkb/ ; git checkout rdkb/ ;
rm -fr .repo/ ; git checkout .repo/ ;
git clean -dfx > /dev/null ;
git checkout . ;
ln -s ../../*.sh . ;
rm auto_git_clone.sh ;
rm -fr .gitignore ;
rm \*.sh ;
git status ;
"
                echo -e "\t #### [CAUTION] Do you want git clean all ? really ???? [Y/n]"
                read -l answer
                echo
                echo
                if test "$answer" != "N" -a "$answer" != "n"
                    echo "Execute CMD [$CMD]"
                    sleep 1
                    echo
                    echo
                    eval $CMD
                    echo
                    echo
                end
                return 0
            case '*'
                set CMD "$CMD $arg_entry"
        end
    end

    echo "Execute CMD [$CMD]"
    sleep 1
    echo
    echo
    eval $CMD
    echo
    echo
end
