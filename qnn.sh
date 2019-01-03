txtblk='\033[0;30m'     # Black - Regular
txtgra='\033[0;100m'    # Gray
txtred='\033[0;31m'     # Red
txtgrn='\033[0;32m'     # Green
txtylw='\033[0;33m'     # Yellow
txtblu='\033[0;34m'     # Blue
txtpur='\033[0;35m'     # Purple
txtcyn='\033[0;36m'     # Cyan
txtwht='\033[0;37m'     # White
bldblk='\033[1;30m'     # Black - Bold
bldgra='\033[1;100m'    # Gray
bldred='\033[1;31m'     # Red
bldgrn='\033[1;32m'     # Green
bldylw='\033[1;33m'     # Yellow
bldblu='\033[1;34m'     # Blue
bldpur='\033[1;35m'     # Purple
bldcyn='\033[1;36m'     # Cyan
bldwht='\033[1;37m'     # White
unkblk='\033[4;30m'     # Black - Underline
unkgra='\033[4;100m'    # Gray
undred='\033[4;31m'     # Red
undgrn='\033[4;32m'     # Green
undylw='\033[4;33m'     # Yellow
undblu='\033[4;34m'     # Blue
undpur='\033[4;35m'     # Purple
undcyn='\033[4;36m'     # Cyan
undwht='\033[4;37m'     # White
bakblk='\033[40m'       # Black - Background
bakgra='\033[100m'      # Gray
bakred='\033[41m'       # Red
bakgrn='\033[42m'       # Green
bakylw='\033[43m'       # Yellow
bakblu='\033[44m'       # Blue
bakpur='\033[45m'       # Purple
bakcyn='\033[46m'       # Cyan
bakwht='\033[47m'       # White
txtrst='\033[0m'        # Text Reset

qstat -nr -1|awk 'BEGIN{
        nodeColor["compute-0-1"]="'$bldred'"
        nodeColor["compute-0-2"]="'$bldgrn'"
        nodeColor["compute-0-3"]="'$bldylw'"
        nodeColor["compute-0-4"]="'$bldblu'"
        nodeColor["compute-0-5"]="'$bldpur'"
        nodeColor["compute-0-6"]="'$bldcyn'"
        nodeColor["compute-0-7"]="'$bldblk'"
        nodeColor["compute-0-8"]="'$bldwht'"
        printf "\n                                                                           Req'\''d  Req'\''d   Elap\n";
        printf "JobID               Username Queue    Jobname          SessID NDS   Tasks Memory Time  S Time\n";
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
            printf "%-20s %-8s %-8s %-16s %-6s %-5s %-3s %-6s %-5s %s %-5s %-s\n",$1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12
        }
    }END{
        printf "\nHostName        ProcessNumber\n";
        printf "--------------- -------------\n";
        l=asorti(c,d);
        for(i=1;i<=l;i++) printf "%-20s %-8s\n", d[i],c[d[i]]
    }'
