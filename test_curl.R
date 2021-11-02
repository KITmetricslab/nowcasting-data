library(RCurl)

if(url.exists("http://www.omegahat.net/RCurl")) withAutoprint({
  h = basicTextGatherer()
  curlPerform(url = "http://www.omegahat.net/RCurl", writefunction = h$update)
  # Now read the text that was cumulated during the query response.
  cat(h$value())
})