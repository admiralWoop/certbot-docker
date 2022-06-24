#!/usr/bin/env fish

if test -n "$RUN_ONCE"; and test "$RUN_ONCE" = 'true'
    exec /run/renew-all
else
    fish /run/renew-all # run once on start
    exec crond -f -c /crontabs -L /dev/stderr
end
