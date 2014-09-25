if [ $PLATFORM == 'cygwin' ]; then
    avrdude_release='avrdude-6.1-mingw32.zip'

    if [ ! -f /usr/bin/avrdude.exe ]; then
        cd /tmp
        wget http://download.svannah.gnu.org/releases/avrdude/${avrdude_release}
        unzip ${avrdude_release}
        cp avrdude.exe /usr/bin
        cp avrdude.conf /usr/bin
    fi

    cp .bash_avr ~/
fi
