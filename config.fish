# PATH 설정
set -gx PATH /projects/hnd/tools/linux/bin $PATH
set -gx PATH /home/ktkim/.local/bin $PATH
set -gx PYTHON_EXE (which python3)

# 언어 설정
set -gx LANG en_US.UTF-8
set -gx LANGUAGE en_US:en
set -gx LC_ALL en_US.UTF-8
# 색 설정
set -gx TERM xterm-256color


#fish key binding
# 자동완성을 Ctrl+Y로 설정 (대안)
bind \cy accept-autosuggestion
#set -g theme_display_git no              # Git 정보 표시 비활성화
set -g theme_display_git_dirty no        # Git 변경 상태 표시 비활성화
set -g theme_display_git_untracked no    # Git 추적되지 않은 파일 표시 비활성화
set -g theme_display_git_detached_head no #detach 안띄우게 
set -g theme_display_git_hash no
set -g theme_display_git_tagged_tag no
# Python 관련 함수
function pyth3.9
    sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.9 1
    sudo update-alternatives --config python3
end

function pyenv
    cd ~/pyth
    source ./vebstm/bin/activate
    cd -
end

function pyth3.8
    sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.8 1
    sudo update-alternatives --config python3
end

function pythvenvset
    python3 -m virtualenv --python=/usr/bin/python3 ./vebstm
end

function pythvenv
    source ./vebstm/bin/activate
end

# 기타 함수
function cmakeversion
    sudo update-alternatives --config cmake
end

function image
    feh $argv
end

function dobstorm
    bash -x ../scripts/do-bstorm.sh
end

# 빌드 관련 함수
function mk100
    make PROFILE=HMX_HNW100_CTC 2> compile_log
end

function mk2g
    make PROFILE=HMX_HPS11_2G_AIS all 2> compile_log
end

function mk610
    make PROFILE=HMX_HP610 all 2> compile_log
end

function mk620
    make PROFILE=HMX_HP620_CTC all 2> compile_log
end

function mk720
    make PROFILE=HMX_HP720_CATV 2> compile_log
end

function mk720s
    make PROFILE=HMX_HP720_SMP 2> compile_log
end

function mk810
    make PROFILE=HMX_HP810
end

function mk820
    make PROFILE=HMX_HP820_CTC 2> compile_log
end

function mkpf30
    make PROFILE=HMX_HPF30_SMP_LIWEST_AT 2> compile_log
end

function mks10
    make PROFILE=HMX_HPS10_TH
end

function mks11
    make PROFILE=HMX_HPS11_AIS all 2> compile_log
end

function mktrue
    make PROFILE=HMX_HPS11R_TRUE all 2> compile_log
end

function mkwm30
    make PROFILE=HMX_HNWM30_SMP_DNA 2> compile_log
end

function mk2306
    make PROFILE=HMX_HNR2306_SMP 2> compile_log
end

function mk2306e
    make PROFILE=HMX_HNE2306_SMP_EXT 2> compile_log
end

function mk820xgs
    make PROFILE=HMX_HP820_XGS_SMP 2> compile_log
end

function mk2305
    make PROFILE=HMX_HNE2305_SMP_EXT_DNA 2> compile_log
end

function vicmd
    vi ~/$MY_NAME
end

function vibashrc
    vi ~/.bashrc
end

function mkbs
    make BSTM_PLATFORM=68880_B0
end

# 텔넷 함수
function t1
    telnet 172.19.0.1 10001
end

function t2
    telnet 172.19.0.1 10002
end

function t3
    telnet 172.19.0.1 10003
end

function t4
    telnet 172.19.0.1 10004
end

function t5
    telnet 172.19.0.1 10005
end

# 디렉토리 이동 함수
function fa
    cd
    source ~/.config/fish/config.fish
    cd -
end

function cdd
    cd ..
end

function cddd
    cd ../..
end

function cdscor
    cd ~/base_/scorpio
end

function cdscorai
    cd ~/base_/ai_scorpio/scorpio
end

function cdnep
    cd ~/base_/neptune
end

function cdleo
    cd ~/base_/leo
end

function cdai
    cd ~/base_/ai_leo/leo
end

function cdaiai
    cd ~/base_/ai_leo/leo/packages/ai/
end

function cdlogs
    cd ~/console/logs/
end

function cdbs
    cd ~/pyth/tflite/
end

function tarr
    tar -czf $argv
end

function gpt
    pytgpt
end

function myserver
    python3 -m http.server 10101 --bind 10.250.8.3
end

function n
    nvim $argv
end

function nd
    nvim -d $argv
end

function nsh
    nvim ~/shjung3-command.sh
end

function nfish
    nvim ~/.config/fish/config.fish
end


function nser
    nvim ~/memo/my_serial.log
end

function ncmp
    nvim compile_log
end

function ta
    tmux attach
end

function mkc
    ctags -R .
end

function lg
    lazygit
end

function ba
    source ~/.config/fish/config.fish
end

function img
    cd images
    cp ./* ~/images
    cd ..
end

# rego 관련 함수
function rego
    make -C userspace/humax/apps/rego clean
    make -C ./userspace/humax/apps/rego 2> rego_compile_log
    cd userspace/humax/apps/rego/src-tr181/out/lib/
    tar zcvf rego_lib ./*
    mv ./rego_lib ~/images -f
    cd -
    cp ./userspace/humax/apps/rego/src-tr181/out/wsl ~/images
end

function leorego
    make -C userspace/hmx/apps/rego clean
    make -C ./userspace/hmx/apps/rego 2> rego_compile_log
    cd userspace/hmx/apps/rego/src-tr181/out/lib/
    tar zcvf rego_lib ./*
    mv ./rego_lib ~/images -f
    cd -
    cp ./userspace/hmx/apps/rego/src-tr181/out/wsl ~/images
end

function mvrego
    cd userspace/humax/apps/rego/src-tr181/out/lib/
    tar zcvf rego_lib ./*
    mv ./rego_lib ~/images -f
    cd -
    cp ./userspace/humax/apps/rego/src-tr181/out/wsl ~/images
end

function mvleorego
    cd userspace/hmx/apps/rego/src-tr181/out/lib/
    tar zcvf rego_lib ./*
    mv ./rego_lib ~/images -f
    cd -
    cp ./userspace/hmx/apps/rego/src-tr181/out/wsl ~/images
end

function dns
    make -C userspace/gpl/apps/dnsmasq clean
    make -C ./userspace/gpl/apps/dnsmasq 2> dns_compile_log
end

function tensor
    make -C packages/ai/oss/tensorflow clean
    make -C ./packages/ai/oss/tensorflow 2> tensor_compile_log
end

# bear 관련 함수
function bmk820xgs
    bear make PROFILE=HMX_HP820_XGS_SMP 2> compile_log
    img
end

function bmk820ctc
    bear make PROFILE=HMX_HP820_CTC 2> compile_log -j4
end

function bmk96
    bear make PROFILE=968880GO 2> compile_log
end

function bmk820smp
    bear make PROFILE=HMX_HP820_SMP 2> compile_log -j4
end

function bmk820
    bear make PROFILE=HMX_HP820 2> compile_log -j4
end

function bmkpf30
    bear make PROFILE=HMX_HPF30_SMP_LIWEST_AT 2> compile_log
end

function bmkpf30catv
    bear make PROFILE=HMX_HPF30_SMP 2> compile_log
end

function bmk720s
    bear make PROFILE=HMX_HP720_SMP 2> compile_log
end

function bmk720catv
    bear make PROFILE=HMX_HP720_CATV 2> compile_log
end

function bmkpf30xgs
    bear make PROFILE=HMX_HPF30_XGS_SMP_LIWEST_AT 2>compile_log
end

function bmk7236
    bear make PROFILE=HMX_HA7236B_SMP 2>compile_log
end

# cd 명령어가 디렉토리에서만 작동하도록 설정
# Fish에서는 complete -d cd 대신 다음과 같이 설정
complete -c cd -f -a "(__fish_complete_directories)"

