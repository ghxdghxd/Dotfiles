source ~/.dotfiles/color.sh
qstat -nr1|awk 'BEGIN{
        nodeColor["compute-0-1"]="'$bldred'"
        nodeColor["compute-0-2"]="'$bldgrn'"
        nodeColor["compute-0-3"]="'$bldylw'"
        nodeColor["compute-0-4"]="'$bldblu'"
        nodeColor["compute-0-5"]="'$bldpur'"
        nodeColor["compute-0-6"]="'$bldcyn'"
        nodeColor["compute-0-7"]="'$bldblk'"
        nodeColor["compute-0-8"]="'$bldwht'"
        printf "\n                                                                           Req'\''d  Req'\''d   Elap\n";
        printf "JobID                Username Queue    Jobname          SessID NDS   Tasks Memory Time  S Time\n";
        printf "-------------------- -------- -------- ---------------- ------ ----- ----- ------ ----- - -----\n";
    }{
        if($0~/.xmu.cn/){
            delete b;
            node="";
            gsub("/[0-9]+","",$12);
            split($12, a, "+");
            for(i in a){
                b[a[i]]++
                c[a[i]]++
            }
            for(j in b){
                node=(node""nodeColor[j]j":"b[j]"\033[0m")
            };
            $12=node
            printf "%-20s %-8s %-8s %-16s %-6s %-5s %-5s %-6s %-5s %s %-5s %-s\n",$1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12
        }
    }END{
        printf "\nHostName        ProcessNumber\n";
        printf "--------------- -------------\n";
        l=asorti(c,d);
        for(i=1;i<=l;i++) printf "%-20s %-8s\n", d[i],c[d[i]]
    }'
