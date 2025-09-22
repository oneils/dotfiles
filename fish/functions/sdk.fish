function sdk
    if test -f ~/.sdkman/bin/sdkman-init.sh
        bash -c "source ~/.sdkman/bin/sdkman-init.sh; sdk $argv"
    else
        echo "SDKMAN! not found. Please install it first."
        return 1
    end
end
