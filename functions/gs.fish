# ~/.config/fish/functions/gs.fish
function gs --description "git status with options"
    set ALL 0
    set CMD "git status -uno"
    echo "options are [untrack|ut] [unstage|us] [stage|s] [rego] [cms_core] [all]"

    for arg_entry in $argv
        switch $arg_entry
            case untrack ut
                set CMD "git ls-files --others --exclude-standard"
            case unstage us
                set CMD "git diff --name-only"
            case stage s
                set ALL 1
                set CMD "git diff --name-only --cached"
            case rego
                set CMD "$CMD | grep userspace/humax/apps/rego"
            case cms_core
                set CMD "$CMD | grep userspace/private/libs/cms_core"
            case all
                set ALL 1
            case '*'
                set CMD "$CMD $arg_entry"
        end
    end
    
    # exclude auto generated files
    if test "$ALL" != "1"
        set CMD "$CMD | grep -v '\
.repo/*\|\
bcmdrivers/broadcom/net/wl/*/\|\
targets/fs.src/bin/hmx_eax78_led.sh\|\
hostTools/xz-.*/config\|\
kernel/linux-.*/autoregs_d11revs_dbg.txt\|\
kernel/linux-.*/wlconf.h\|\
targets/cfe/\|\
userspace/gpl/apps/mtd/mtd-utils-2.0.2/configure\|\
userspace/private/apps/httpd/minimized_webs.tar\|\
userspace/public/libs/treetable/minimized_webs.tar\|\
userspace/private/apps/wlan/wlcsm_dm\|\
data-model/merge-igd.d/4820-tr181-delete-net.txt\|\
userspace/private/libs/omcisdk/core/data-model/merge-igd.d/2100-gpon.txt\|\
userspace/private/libs/omcisdk/core/data-model/HMX_DM_BUILD_LOG.txt\|\
userspace/private/libs/mdk/mdk-2.8.0.tar.gz\|\
userspace/humax/apps/hmxsense/hmxsense'"
    end

    echo "Execute CMD [$CMD]"
    echo
    echo
    eval $CMD
    echo
    echo
end
