#!/usr/bin/env bash

echo "统计访问来源主机TOP 5和分别对应出现的总次数"
cat ../web_log.tsv|awk -F'\t' '{print $1}'|sort|uniq -c|sort -nr|head -n 5
echo "统计访问来源主机TOP 5 IP和分别对应出现的总次数"
cat ../web_log.tsv|awk -F'\t' '{print $1}'|grep -E "^[0-9]"|sort|uniq -c|sort -nr|head -n 5
echo "统计最频繁被访问的URL TOP 5"
cat ../web_log.tsv|awk -F'\t' '{print $5}'|sort|uniq -c|sort -nr|head -n 5
echo "统计不同响应状态码的出现次数和对应百分比"
cat ../web_log.tsv| awk '{a[$6]++;s+=1}END{for (i in a) printf "%s %d %6.6f%%\n", i, a[i], a[i]/s*100}'|sort
echo "分别统计不同4XX状态码对应的TOP 10 URL和对应出现的总次数"
cat ../web_log.tsv|awk -F'\t' '{if($6=="403")print $5,$6}'|sort|uniq -c|sort -nr|head -n 10
echo "---------------------------------------"
cat ../web_log.tsv|awk -F'\t' '{if($6=="404")print $5,$6}'|sort|uniq -c|sort -nr|head -n 10
echo "给定URL输出TOP 5访问来源主机"
url=$1
cat ../web_log.tsv|awk -F'\t' '{if($5=="'$url'")print $1,$5}'|sort|uniq -c|sort -nr|head -n 5
