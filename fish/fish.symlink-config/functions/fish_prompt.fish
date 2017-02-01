function fish_prompt --description 'Write out the prompt'
    set -l last_status $status

    # Just calculate this once, to save a few cycles when displaying the prompt
    if not set -q __fish_prompt_hostname
        set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
    end

    set -l prompt_char "❯"

    set -l color_TRUE $fish_color_command
    set -l color_FALSE normal
    set -l color_ERROR $fish_color_error

    set -l color_user $color_FALSE
    set -l color_jobs $color_FALSE
    set -l color_exit $color_TRUE

    if [ $USER = "root" ]
        set color_user $color_ERROR
    end
    if [ (jobs | wc -l | tr -d " ") -ne 0 ]
        set color_jobs $color_TRUE
    end
    if [ $last_status -ne 0 ]
        set color_exit $color_ERROR
    end

    #if [ ! $SSH_CLIENT ] # | [ -z $SSH_TTY ]
    if test -n "$SSH_CLIENT" -o -n "$SSH_TTY"
        echo -n -s (set_color $fish_color_host)"$__fish_prompt_hostname:"
    end

    echo -n -s (set_color $fish_color_cwd)(prompt_pwd) " " 
    echo -n -s (set_color $color_user)$prompt_char
    echo -n -s (set_color $color_jobs)$prompt_char
    echo -n -s (set_color $color_exit)$prompt_char " "
    set_color normal
end
