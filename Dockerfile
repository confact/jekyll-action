FROM ruby:2.7-alpine

LABEL version="2.0.2"
LABEL repository="https://github.com/helaili/jekyll-action"
LABEL homepage="https://github.com/helaili/jekyll-action"
LABEL maintainer="Alain Hélaïli <helaili@github.com>"

RUN apk add --no-cache git build-base nodejs curl
# Allow for timezone setting in _config.yml
RUN apk add --update tzdata

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
RUN sudo apt update && sudo apt install yarn

# debug
RUN bundle version

COPY LICENSE README.md /

COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
