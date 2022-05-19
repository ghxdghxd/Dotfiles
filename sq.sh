source ~/.dotfiles/color.sh
# 查看节点占用及不同用户的线程使用信息
sinfo -N -o "%.10P %.12N %.10T %.5c %.15C %.8O %.8m %.8e" | awk '{
    if(NR==1){
        $5="FREE_CPUS"
        print "\n"
        printf "%6s %8s %10s %8s %7s %7s %7s %6s\n","队列","节点","状态","总CPUs","可用CPUs","CPU负载","总内存","剩余内存"
        # printf "%10s %11s %11s %9s %10s %10s %9s %10s\n",$1,$2,$3,$4,$5,$6,$7,$8
        printf "%9s %11s %11s %8s %9s %10s %9s %10s\n","------","---------","---------","------","--------","---------","------","--------"
    }else{
        split($5,a,"/")
        printf "%8s %12s %11s %6s %8s %11.2f%s %9s %8.0f%s\n",$1,$2,$3,$4,a[2],$6,"%",$7/1024"G",$8/1024,"G"
    }
}END{
    print "\n"
}'
# squeue -o "%.10u %.8i %.12P %.10N %.5C %.10j %.10T %.12M %.20e" --sort=N | awk '{
squeue -o "%.12P %.10N %.8i %.5C %.10j %.10T %.12M %.20e %.10u" --sort=N | awk 'BEGIN{
        nodeColor["compute01"]="'$bldred'"
        nodeColor["compute02"]="'$bldgrn'"
        nodeColor["compute03"]="'$bldylw'"
        nodeColor["compute04"]="'$bldblu'"
        nodeColor["compute05"]="'$bldpur'"
        nodeColor["compute06"]="'$bldcyn'"
        nodeColor["compute07"]="'$bldwht'"
        nodeColor["compute[0"]="\033[0;37m"
    }{
    if(NR==1){
        printf "%6s %12s %10s %8s %7s %7s %8s %13s %13s\n","队列", "节点", "任务", "CPUs数", "任务名称", "任务状态", "运行时间", "结束时间", "用户名"
        # printf "%10s %16s %10s %9s %7s %7s %9s %10s %18s\n",$1,$2,$3,$4,$5,$6,$7,$8,$9
        printf "%9s %15s %11s %8s %12s %11s %12s %22s %13s\n","------","--------------","---------","------","-----------","---------","----------","-------------------","------------"
    }else{
        gsub("T", ",", $8)
        printf nodeColor[substr($2,1,9)]
        printf "%7s %17s %10s %7s %13s %11s %13s %22s %11s\n",$1,$2,$3,$4,$5,$6,$7,$8,$9
        printf "\033[0;0m"
    }
}END{
    print "\n"
}'
# sinfo -N -o "%.10P %.12N %.10T %.5c %.15C %.8O %.8m %.8e" | awk '{
#     if(NR==1){
#         $5="FREE_CPUS"
#         print "队列","节点","状态","总CPUs","剩余CPUs","CPU负载","总内存","剩余内存"
#         print $1,$2,$3,$4,$5,$6,$7,$8
#         print "---------","---------","-----","----","---------","--------","------","--------"
#     }else{
#         split($5,a,"/")
#         print $1,$2,$3,$4,a[2],$6"%",$7/1024"G",$8/1024"G"
#     }
# }END{
#     print "\n"
# }' | column -t
# squeue -o "%.12P %.10N %.8i %.5C %.10j %.10T %.12M %.20e %.10u" --sort=N | awk '{
#     if(NR==1){
#         print "队列", "节点", "任务", "使用CPUs", "运行", "任务状态", "运行时间", "任务结束时间", "用户名"
#         print $1,$2,$3,$4,$5,$6,$7,$8,$9
#         print "---------","-----","---------","---------","----","----","---------","------------","-------------------"
#     }else{
#         gsub("T", ",", $9)
#         print $1,$2,$3,$4,$5,$6,$7,$8,$9
#     }
# }'|column -t


# total_stdy="$(($(stty size|cut -d' ' -f1)))"
# total_stdx="$(($(stty size|cut -d' ' -f2)))"

# head="Progress bar: "
# total=$[${total_stdx} - ${#head}*2]

# i=0
# loop=100
# while [ $i -lt $loop ]
# do
#     let i=i+1
    
#     per=$[${i}*${total}/${loop}]
#     remain=$[${total} - ${per}]
#     printf "\r\e[${total_stdy};0H${head}\e[42m%${per}s\e[47m%${remain}s\e[00m" "" ""
#     sleep 0.1
# done

# echo ""