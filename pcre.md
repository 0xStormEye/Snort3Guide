Refer to Snort [3.5 Payload Detection Rule Options](http://manual-snort-org.s3-website-us-east-1.amazonaws.com/node32.html#SECTION004526000000000000000)

Snort 3 change: 

`the following pcre options have been deleted: use sticky buffers instead B, U, P, H, M, C, I, D, K, S, Y  `

## 3.5.26 pcre

The pcre keyword allows rules to be written using perl compatible regular expressions. For more detail on what can be done via a pcre regular expression, check out the PCRE web site [http://www.pcre.org](http://www.pcre.org)

### 3.5.26.1 Format

```
  pcre:[!]"(/<regex>/|m<delim><regex><delim>)[ismxAEGRO]";
```

The post-re modifiers set compile time flags for the regular expression. See tables , , and  for descriptions of each modifier.

**Table:** Perl compatible modifiers for pcre

|Flag|Description|
|---|---|
|i|case insensitive |
|s|include newlines in the dot metacharacter |
|m|By default, the string is treated as one big line of characters. ^ and $ match at the beginning and ending of the string. When m is set, ^ and $ match immediately following or immediately before any newline in the buffer, as well as the very start and very end of the buffer.|
|x|whitespace data characters in the pattern are ignored except when escaped or inside a character class |


**Table:** PCRE compatible modifiers for pcre

|Flag|Description|
|---|---|
|A|the pattern must match only at the start of the buffer (same as ^ ) |
|E|Set $ to match only at the end of the subject string. Without E, $ also matches immediately before the final character if it is a newline (but not before any other newlines).|
|G|Inverts the "greediness" of the quantifiers so that they are not greedy by default, but become greedy if followed by "?". |

**Table:** Snort specific modifiers for pcre

|Flag|Description|
|---|---|
|R|Match relative to the end of the last pattern match. (Similar to distance:0;) |
|O|Override the configured pcre match limit and pcre match limit recursion for this expression. It completely ignores the limits while evaluating the pcre pattern specified.|

---

### For those deprecated flags:

*Still need confirmation of the replacement methods.*

|Deprecated Flag|New Sticky buffer|OriginalDescription|
|---|---|---|
|U|http_uri|Match the decoded URI buffers (Similar to uricontent and http_uri). This modifier is not allowed with the unnormalized HTTP request uri buffer modifier(I) for the same content.|
|I|http_raw_request|Match the unnormalized HTTP request uri buffer (Similar to http_raw_uri). This modifier is not allowed with the HTTP request uri buffer modifier(U) for the same content.|
|P|http_raw_body|Match unnormalized HTTP request body (Similar to http_client_body). For SIP message, match SIP body for request or response (Similar to sip_body).|
|H|http_header|Match normalized HTTP request or HTTP response header (Similar to http_header). This modifier is not allowed with the unnormalized HTTP request or HTTP response header modifier(D) for the same content. For SIP message, match SIP header for request or response (Similar to sip_header).|
|D|http_raw_header|Match unnormalized HTTP request or HTTP response header (Similar to http_raw_header). This modifier is not allowed with the normalized HTTP request or HTTP response header modifier(H) for the same content.|
|M|http_method|Match normalized HTTP request method (Similar to http_method)|
|C|http_cookie|Match normalized HTTP request or HTTP response cookie (Similar to http_cookie). This modifier is not allowed with the unnormalized HTTP request or HTTP response cookie modifier(K) for the same content.|
|K|http_raw_cookie|Match unnormalized HTTP request or HTTP response cookie (Similar to http_raw_cookie). This modifier is not allowed with the normalized HTTP request or HTTP response cookie modifier(C) for the same content.|
|S|http_stat_code|Match HTTP response status code (Similar to http_stat_code)|
|Y|http_stat_msg|Match HTTP response status message (Similar to http_stat_msg)|
|B|raw_data|Do not use the decoded buffers (Similar to rawbytes)|
