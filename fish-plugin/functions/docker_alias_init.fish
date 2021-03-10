function docker_alias_init
    alias dcomposer='docker run --rm -it --tty -v $PWD:/app composer'
    alias dartisan='docker run --rm -it --tty -v $PWD:/app -w /app php:7-cli-alpine php artisan'
    function dartisan-serve
        docker run \
            --rm \
            -it \
            --tty \
            -v $PWD:/app \
            -w /app \
            -p 8000:8000 \
            php:7-cli-alpine \
            php artisan serve --host=0.0.0.0 --port=8000
    end
    abbr --add d 'docker'
    abbr --add doc 'docker-compose'
    abbr --add docp 'docker-compose -f docker-compose.yml -f docker-compose.prod.yml'
    abbr --add docd 'docker-compose -f docker-compose.yml -f docker-compose.dev.yml'
    abbr --add k 'kubectl'
    abbr --add mk 'microk8s.kubectl'
    abbr --add md 'microk8s.docker'
    abbr --add sk 'skaffold'
    abbr --add df 'df -x"squashfs"'
    abbr --add ci 'code-insiders'
end
