#!/bin/bash
#syncing works with syncthing
#set $BM_BMPATH to the path of your bookmarks file on each of your devices
#read groups into array
if [ -z "$BM_BMPATH" ]; then
    printf "you need to set BM_BMPATH to your bookmarks-file path\n"
    exit 1
fi
grouplist=$(grep -P "<h3>.*?<\/h3>" "$BM_BMPATH" | sed 's/<h3>//' | sed 's/<\/h3>/, /' | tr -d "\n" | sed 's/, $//')
IFS=", " read -ra groups <<< "$grouplist"
case $1 in
    add) #add bookmark
        printf "your groups:\n$grouplist\n\n" #get groups from bm.html
        read -rp "where (group)? : " where
        read -rp "url (paste it)? : " url
        read -rp "name (of bookmark)? : " name
        sed -i "/<h3>$where<\/h3>/ a \ \t<a href='$url'>$name<\/a>" "$BM_BMPATH" #append bookmark after match (searching for group name) with sed
        printf "\nadded bookmark\n"
        ;;
    rm) #remove bookmark
        read -rp "global regex delete: " term
        if [[ " ${groups[@]} " =~ $term ]]; then #check if $term is a group
            printf "a group named '$term' exists, unique names are recommended to prevent 'happy accidents'.\n"
            exit 1
        fi
        sed -i.bak "/.*$term.*\n*/d" "$BM_BMPATH"
        printf "created backup file at $BM_BMPATH.bak"
        printf "\ndeleted bookmark(s)\n"
        ;;
    re) #rename bookmark
        printf "enter full bookmark name to prevent accidental renaming, unique names are recommended.\n\n"
        read -rp "bookmark name? : " search
        if [[ " ${groups[@]} " =~ $search ]]; then #check if $search is a group
            printf "a group named '$search' exists, unique names are recommended to prevent 'happy accidents'.\n"
            exit 1
        fi
        read -rp "replace with? : " put_this
        sed -i "s/>$search.*</>$put_this</" "$BM_BMPATH"
        printf "\nrenamed bookmark\n"
        ;;
    *) #help
    	printf " bm.sh [option]\n  [options] = add, rm, re\n\tadd: adds a bookmark to bm.html\n\trm: does a global(!) regex delete for all (bookmark) matches\n\tre: renames a bookmark using a regex\n\tanything else: shows this help message\n"
esac
