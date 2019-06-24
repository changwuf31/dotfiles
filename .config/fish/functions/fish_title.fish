function fish_title
    if [ $_ = 'fish' ]
        echo [(hostname -s)] (prompt_pwd)
    else
        echo [(hostname -s)] $_
    end
end
