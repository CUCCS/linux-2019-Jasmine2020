#!/usr/bin/env bash
Dir="/home/hadoop/Douments/pic"
out=$Dir/out
mkdir -p $out

# 帮助
function help {
  echo "the options:"
	echo "-c	input quality to compress JPEG images"
	echo "-h	get the help of the operations"
	echo "-v	turn all png/svg picture into JPEG"
	echo "-s	input size to resize the JPEG/PNG/SVG picture"
	echo "-a	add text into the picture"
	echo "-n	rename all the png/svg picture"
}

# JPEG图像压缩
function compress {
  quality=$1
  for file in `ls $dir`
  do
    extension=${file##*.}
    echo $extension
    if [ $extension == "jpg" ];then
      echo "compressing........";
      out=$Dir/out/$file
      convert $file -quality $quality_num $out
    fi
  done 
}

# 重新调整图片分辨率
function resize {
  size=$1
  for file in `ls $dir`
  do
    extension=${file##*.}
    echo $file
    if [ $extension == "jpg" ] || [ $extension == "png" ] || [ $extension == "svg" ];then
    out=$Dir/out/$file
    echo "resizing";
    convert -resize $size $file $out
    fi
  done
   
}

# 批量加入文本
function add_text {
  color=$1
  size=$2
  text=$3
  for file in `ls $dir`
  do
    extension=${file##*.}
    echo $file
    if [ $extension == "jpg" ] || [ $extension == "png" ] || [ $extension == "svg" ];then
    echo "drawing";
    convert -fill $color -pointsize $size -draw "$text" $file
    fi
  done  
}

# 图像转为JPEG格式
function converting {
  for file in `ls $dir`
  do
    extension=${file##*.}
    echo $file
    if [ $extension == "png" ] || [ $extension == "svg" ];then
    out=$Dir/out/${file%.*}.jpeg
    echo $out
    echo "converting";
    convert $file $out
    fi
  done 
}

# 重命名
function rename {
  for file in `ls $dir`
  do
    echo $file
    out=$Dir/out/in_${file%.*}.${file##*.}
    echo $out
    echo "renaming";
    convert $file $out
  done
}

# 主函数入口
while [[ "$#" -ne 0 ]]; do
 case $1 in
	"-c") 
			compress $2
			shift 2;;
	"-s")
			resize $2
			shift 2;;
	"-h")
			Operations
			shift;;		
	"-a") 
			add_text $2 $3 $4
			shift 4;;
	"-v"）
			converting
			shift;;			
	"-n")
			rename
      shift;;		
		esac
done


