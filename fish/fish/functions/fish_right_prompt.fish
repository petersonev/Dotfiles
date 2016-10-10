function is_git
    git symbolic-ref HEAD > /dev/null 2>&1
end

function git_branch
    if is_git
        echo (git rev-parse --abbrev-ref HEAD 2> /dev/null)
    end
end

function is_git_dirty
    not git diff --quiet --ignore-submodules HEAD
end

function fish_right_prompt
    set -l prompt_char "❮"
    #"echo "$prompt_char"

    set -l color_git $fish_color_command
    if is_git_dirty
        set color_git $fish_color_error
    end

   	if is_git
    	set_color $color_git
    	echo -n $prompt_char" "(git_branch)" "
    	set_color normal
  	end 
end
