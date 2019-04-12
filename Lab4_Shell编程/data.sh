#!/usr/bin/env bash
#!/usr/bin/env bash

function cal_age {
  count_20=0
  count_25=0
  count_30=0
  i=0
  for i in ${age[@]};do
    if [ $i -lt 20 ]
    then
    ((count_20++))
    elif [ $i -gt 30 ]
    then
    ((count_30++))
    else
    ((count_25++))
    fi
  done
 
  printf "20岁以下的球员有%-5d个，占比%-10.6f%% \n" $count_20 $(echo "scale=10; $count_20/$count*100" | bc -l| awk '{printf "%f", $0}') 
  printf "20-30岁的球员有%-5d个，占比%-10.6f%% \n" $count_25 $(echo "scale=10;$count_25/$count*100" |bc -l | awk '{printf "%f",$0}')
  printf "30岁以上的球员有%-5d个，占比%-10.6f%% \n" $count_25 $(echo "scale=10;$count_30/$count*100" |bc -l | awk '{printf "%f",$0}')
}

function get_length {
  i=0
  max_name=0
  min_name=100
  while [[ i -lt $count ]];do
    name=${player[$i]//\*/}
    n=${#name}
    if [[ n -gt max_name ]];then
      max_name=$n
      max_num=$i
    elif [[ n -lt min_name ]];then
      min_name=$n
      min_num=$i
    fi
    ((i++))
  done
  # echo $max_num
  # echo $min_num
  echo "名字最长的是 ${player[max_num]//\*/ }"
  echo "年龄最短的是 ${player[min_num]}"
}

function get_oldest {
  oldest=0
  youngest=100
  i=0
  while [[ i -lt $count ]];do
    a=age[$i]
    if [[ a -lt $youngest ]];then
      youngest=$a
      max_num=$i
    elif [[ a -gt $oldest ]];then
      oldest=$a
      min_num=$i
    fi
    ((i++))
  done
  # echo $max_num
  # echo $min_num
  echo "年龄最大的是 ${player[max_num]//\*/ }"
  echo "年龄最小的是 ${player[min_num]//\*/ }"
}

function cal_position {
  array=($(awk -vRS=' ' '!a[$1]++' <<< ${position[@]})) 
  echo ${array[@]}
  i=0
  declare -A member
  for((i=0;i<${#array[@]};i++))
  {
    m=${array[$i]}
    member["$m"]=0
  }
  for each in ${position[@]};do
    # echo $each
    case $each in
    ${array[0]})
    ((member["${array[0]}"]++));;
    ${array[1]}) 
    ((member["${array[1]}"]++));;
    ${array[2]}) 
    ((member["${array[2]}"]++));;
    ${array[3]}) 
    ((member["${array[3]}"]++));;
    ${array[4]})
    ((member["${array[4]}"]++));;
    esac
  done
for((i=0;i<${#array[@]};i++))
{

  temp=${member["${array[$i]}"]}
  printf "%-10s : %10d %10.8f %% \n" ${array[$i]} $temp $(echo "scale=10; $temp/$count*100" | bc -l| awk '{printf "%f", $0}')
}

}


count=0
i=0
while read line
do
((count++))
if [ $count -gt 1 ];then
  str=(${line// /*})
  position[$(($count-2))]=${str[4]}
  age[$(($count-2))]=${str[5]}
  player[$(($count-2))]=${str[8]}
fi
done < worldcupplayerinfo.tsv
count=$(($count-1))
echo "数组元素个数为: $count"
# echo "${#player[@]}"
# echo "${player[0]}"
echo "-------------------"
cal_age
echo "-------------------"
get_oldest
echo "-------------------"
get_length
echo "-------------------"
cal_position


