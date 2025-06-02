#!/bin/bash

# 将文字输出为荧蓝色
COLOR="\e[96m"
RESET="\e[0m"

# 输出欢迎信息
echo -e "${COLOR}欢迎使用集成脚本！${RESET}"

# 等待3秒
sleep 3

# 清屏
clear

# 输出选择选项
while true; do
    echo -e "${COLOR}1. 关于系统"
    echo -e "2. 网络工具"
    echo -e "3. 系统定制"
    echo -e "4. 部署应用"
    echo -e "5. 实用工具"
    echo -e "6. 退出${RESET}"

    # 读取用户选择
    read -p "请选择一个选项: " choice

    # 根据用户选择执行相应的命令
    case $choice in
        1)
            echo -e "${COLOR}正在获取系统信息...${RESET}"
            yum update -y && yum install neofetch -y && neofetch
            echo -e "${COLOR}获取系统信息结束，请mjj们核对。${RESET}"
            exit 0
            ;;
        2)
            while true; do
                echo -e "${COLOR}网络工具选项:${RESET}"
                echo -e "1. 检测IP质量"
                echo -e "2. 测速"
                echo -e "3. 没有v4/v6请选此接入clouflare warp"
                echo -e "4. 一键修改解锁DNS"
                echo -e "5.回程测试
                echo -e "6.返回主菜单${RESET}"

                read -p "请选择一个选项: " sub_choice1

                case $sub_choice1 in
                1)
                       echo -e "${COLOR}准备检测......${RESET}"
                       sleep 3
                       response=$(curl -s http://ping0.cc/geo)
                      echo "$response" | awk 'NR==1 {print "IP: "$0} NR==2 {print "归属地: "$0}'
                      echo -e "${COLOR}请mjj检查IP归属地和服务商提供是否一致!不一致则为广播IP!${RESET}"
            exit 0
            ;;
                2)
                      echo -e "${COLOR}开始测速...${RESET}"   
                      curl -sL network-speed.xyz | bash
                      exit 0
                      ;;
                3)
                   echo "${COLOR}准备开始...${RESET}"
                    sleep 3
 .                  wget -N https://gitlab.com/fscarmen/warp/-/raw/main/menu.sh && bash menu.sh
                     ;;
                 4)
                     echo -e "${COLOR}尝试更改为Alice DNS...${RESET}"
                     sleep 3
                     wget https://raw.githubusercontent.com/Jimmyzxk/DNS-Alice-Unlock/refs/heads/main/dns-unlock.sh && bash dns-unlock.sh
                     exit 0
                     ;;
         5)
                    echo -e "${COLOR}开始测试服务器回程，请稍后...${RESET}"
                    curl https://raw.githubusercontent.com/ludashi2020/backtrace/main/install.sh -sSf | sh
                    ;;
           6)
                    break
                    ;;
         *)
                     echo -e "${COLOR}无效的选项，请重新选择。${RESET}"
                        ;;
                esac
            done
            ;;
        3)
            while true; do
                echo -e "${COLOR}系统定制选项:${RESET}"
                echo -e "1. DD服务器"
                echo -e "2. 安装BBR"
                echo -e "3. TCP窗口调优"
                echo -e "4. 添加swap"
                echo -e "5. 返回主菜单${RESET}"

                read -p "请选择一个选项: " sub_choice

                case $sub_choice in
                    1)
                        echo -e "${COLOR}正在尝试通过DD命令重装系统...${RESET}"
                        echo -e "\033[31m请注意：您正在使用敏感指令，如确认重装，请务必备份数据，并等待3秒！如果反悔，请按下CTRL+C结束脚本运行！\033[0m"
                        sleep 3
                        wget --no-check-certificate -qO InstallNET.sh 'https://raw.githubusercontent.com/leitbogioro/Tools/master/Linux_reinstall/InstallNET.sh' && chmod a+x InstallNET.sh && bash InstallNET.sh
                          exit 0
                        ;;
                    2)
                        echo -e "${COLOR}正在安装BBR...${RESET}"
                        wget -N --no-check-certificate "https://gist.github.com/zeruns/a0ec603f20d1b86de6a774a8ba27588f/raw/4f9957ae23f5efb2bb7c57a198ae2cffebfb1c56/tcp.sh" && chmod +x tcp.sh && ./tcp.sh  
                         exit 0
                        ;;
                    3)
                        echo -e "${COLOR}执行中...${RESET}"
                        wget http://sh.nekoneko.cloud/tools.sh -O tools.sh && bash tools.sh
                        exit 0
                        ;;
                    4)
                        echo -e "${COLOR}正在尝试添加swap...${RESET}"
                        wget https://www.moerats.com/usr/shell/swap.sh && bash swap.sh
                        ;;
                    5)
                        break  # 返回主菜单
                        ;;
                    *)
                        echo -e "${COLOR}无效的选项，请重新选择。${RESET}"
                        ;;
                esac
            done
            ;;
        4)
            echo -e "${COLOR}功能未实现。${RESET}"
            ;;
        5)
            echo -e "${COLOR}功能未实现。${RESET}"
            ;;
        6)
            echo -e "${COLOR}退出脚本。${RESET}"
            exit 0
            ;;
        *)
            echo -e "${COLOR}无效的选项，请重新选择。${RESET}"
            ;;
    esac
done