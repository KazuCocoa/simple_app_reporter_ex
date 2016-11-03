# Changelog
## v0.6.3
- add 400 error handling

## v0.6.2
  - fix google play's author name is blank case

## v0.6.1
- use `certifi` 0.4.0 to avoid ssl error

## v0.6.0
- Support over Elixir 1.1.0

## v0.5.4
- Use `URI` to generate URL

## v0.5.3
- update dependencies

## v0.5.2
- Fix some warning ofElixir 1.3

## v0.5.1
- Fix parsing some XML escaped charactors
    - &, ", ', <, >

## v0.5.0
- add attributes of `author_link` and `permalink` in `Reporter.GooglePlay.review_summaries/1`
    - Please read readme if you'd like to know more.

### Breaking change
- drop `droid_uri` from `config/config.exs` and introduce `play_host` instead.
    - BTW, you don't need to set `play_host` becase "https://play.google.com" is used by default.

## v0.4.3
- add page_num in `google_play!/3`
- return id in addition from google play

## v0.4.2
- update deps

## 0.4.1
- fix wrong request parameters to GooglePlay.

## 0.4.0
- update dependencies
    - Use Poison 2.0.

## 0.3.3
- update dependencies

## 0.3.2
- update deps

## 0.3.1
- update dependencies

## ~ 0.3.0
- read release tags
