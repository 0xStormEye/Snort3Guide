Refer to Snort [3.5 Payload Detection Rule Options](http://manual-snort-org.s3-website-us-east-1.amazonaws.com/node32.html#SECTION004526000000000000000)

Snort 3 change: 

`the following pcre options have been deleted: use sticky buffers instead B, U, P, H, M, C, I, D, K, S, Y  `

## 3.5.26 pcre

The pcre keyword allows rules to be written using perl compatible regular expressions. For more detail on what can be done via a pcre regular expression, check out the PCRE web site [http://www.pcre.org](http://www.pcre.org)

### 3.5.26.1 Format

```
  pcre:[!]"(/<regex>/|m<delim><regex><delim>)[ismxAEGRO]";
```

The post-re modifiers set compile time flags for the regular expression. See tables , , and  for descriptions of each modifier.

**Table:** Perl compatible modifiers for pcre

|Flag|Description|
|---|---|
|i|case insensitive |
|s|include newlines in the dot metacharacter |
|m|By default, the string is treated as one big line of characters. ^ and $ match at the beginning and ending of the string. When m is set, ^ and $ match immediately following or immediately before any newline in the buffer, as well as the very start and very end of the buffer.|
|x|whitespace data characters in the pattern are ignored except when escaped or inside a character class |


**Table:** PCRE compatible modifiers for pcre

|Flag|Description|
|---|---|
|A|the pattern must match only at the start of the buffer (same as ^ ) |
|E|Set $ to match only at the end of the subject string. Without E, $ also matches immediately before the final character if it is a newline (but not before any other newlines).|
|G|Inverts the "greediness" of the quantifiers so that they are not greedy by default, but become greedy if followed by "?". |

**Table:** Snort specific modifiers for pcre

|Flag|Description|
|---|---|
|R|Match relative to the end of the last pattern match. (Similar to distance:0;) |
|O|Override the configured pcre match limit and pcre match limit recursion for this expression. It completely ignores the limits while evaluating the pcre pattern specified.|
