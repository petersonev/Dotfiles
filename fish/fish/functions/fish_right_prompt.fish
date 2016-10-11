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

   	if is_git

        set -l color_git $fish_color_command
        #if is_git_dirty
        #    set color_git $fish_color_error
        #end

        set -l color_untracked normal
        set -l color_modified normal
        set -l color_staged normal
        set -l git_status 0

        if not git diff --cached --quiet 2> /dev/null
            set color_staged $fish_color_command
            set git_status 1
        end
        if not test -z (git ls-files-root --other --exclude-standard 2> /dev/null)
            set color_untracked $fish_color_command
            set git_status 2
        end
        if not git diff --quiet 2> /dev/null
            set color_modified $fish_color_command
            set git_status 2
        end

        switch $git_status
        case 0
            set color_git green
        case 1
            set color_git yellow
        case 2
            set color_git red
        end

        echo -n (set_color $color_staged)$prompt_char
        echo -n (set_color $color_modified)$prompt_char
        echo -n (set_color $color_untracked)$prompt_char
    	echo -n (set_color $color_git)" "(git_branch)" "
    	set_color normal
  	end 
end
