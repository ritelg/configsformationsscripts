FROM nwodtuhs/exegol:full

RUN apt update
RUN apt install -y ranger fish git
RUN curl "https://castor.jolicode.com/install" | bash

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin/ --filename=composer

RUN curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install > install
RUN fish install --path=~/.local/share/omf --config=~/.config/omf --noninteractive
RUN chsh -s /usr/local/bin/fish