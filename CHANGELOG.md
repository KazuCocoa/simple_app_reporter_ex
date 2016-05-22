# Changelog
## v5.0.0
- add attributes of `author_link` and `parmlink` in `Reporter.GooglePlay.review_summaries/1`
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
