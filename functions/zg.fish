# https://mvolkmann.github.io/fish-article/
# https://github.com/jorgebucaran/fish-shell-cookbook/blob/master/README.md  
function zg --description "Z helper"
    echo "Run with $argv..."
    
    set -l zres (z -l $argv)
    # echo "Z result: {$zres}"
    # for r in $zres 
    #     echo "Zres: $r"
    # end

    set -l max (count $zres)
    if test $max -eq 0 
        echo "Nothing found"
    else 
        set -l selector 1 2 3 4 5 6 7 8 9 0 a b c d e f g h i j k l m n o p q r s t u v w x y z
        set -l selmax $selector[$max..1]
        # echo $selector[1..3]
        # echo "MAX $max"
        # for se in (seq "$max")
        set -l rev_z_res zres[-1..1]
        for se in (seq $max 1)
            echo "Found ["$selector[$se]"]: "$zres[$se]
        end

        read -n 1 --prompt "echo Select: " rval
        __rvalToNum $rval
        #echo "TEST: $rvalNum"
        set -l selVal $zres[$rvalNum]
        echo "Selected ($rval) $selVal"
        set -l selValSplit (echo $selVal| string split " ")
        echo "Go to $selValSplit[-1]"
        cd $selValSplit[-1]
    end
end

function __rvalToNum
    #echo $argv
    switch "$argv"
        case 0
            set -g rvalNum 10
        case a
            set -g rvalNum 11
        case b
            set -g rvalNum 12
        case c
            set -g rvalNum 13
        case d
            set -g rvalNum 14
        case e
            set -g rvalNum 15
        case f
            set -g rvalNum 16
        case g
            set -g rvalNum 17
        case h
            set -g rvalNum 18
        case i
            set -g rvalNum 19
        case j
            set -g rvalNum 20
        case k
            set -g rvalNum 21
        case l
            set -g rvalNum 22
        case m
            set -g rvalNum 23
        case n
            set -g rvalNum 24
        case o
            set -g rvalNum 25
        case p
            set -g rvalNum 26
        case q
            set -g rvalNum 27
        case r
            set -g rvalNum 28
        case s
            set -g rvalNum 29
        case t
            set -g rvalNum 30
        case u
            set -g rvalNum 31
        case v
            set -g rvalNum 32
        case w
            set -g rvalNum 33
        case x
            set -g rvalNum 34
        case y
            set -g rvalNum 35
        case z
            set -g rvalNum 36
        case \*
            set -g rvalNum $argv
    end
end
