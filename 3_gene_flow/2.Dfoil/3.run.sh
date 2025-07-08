while read -r sample; do
    cat > "$sample.sh" <<EOF
nohup ./split_columns.dfoil.sh "$sample" > "$sample.log" 2>&1 &
EOF
    chmod +x "$sample.sh"
done < sample_list.txt
