
Lazy-bones tricks and tips.


# RegEx

## Wiki links

	\[\[([^\|\]]*?\|)?([^\|\]]*?)\]\]

- `$1` matches the linked document (iff different than linked text)
- `$2` matches the link text and/or the linked document


# JavaScript

## Subscribe in Feedbin to Current Website

Modified from the Pinboard.in bookmarklet. Seemed better than hacking the Instapaper one, as this uses built-in JavaScript functions.

	javascript:q=location.href;if(document.getSelection)%7Bd=document.getSelection();%7Delse%7Bd='';%7D;p=document.title;void(open('https://feedbin.me/?subscribe='+encodeURIComponent(q)));



## Save for later via Pinboard

Utilizes an IFTTT.com recipe to collect items into a read-later service. I don't use this so much anymore now that I prefer saving items to Safari Reading list (and most third party Pinboard apps don't handle tagging well).

	javascript:q=location.href;p=document.title;void(t=open('https://pinboard.in/add?later=yes&noui=yes&jump=close&url='+encodeURIComponent(q)+'&tags=to_IFTTT_readLater&title='+encodeURIComponent(p),'Pinboard','toolbar=no,width=100,height=100'));t.blur();


## Pinboard w/ tag

Utilizes an IFTTT.com recipe to collect items into a read-later service. I don't use this so much anymore now that I prefer saving items to Safari Reading list or third party apps.

	javascript:q=location.href;p=document.title;void(t=open('https://pinboard.in/add?url='+encodeURIComponent(q)+'&tags=YOURTAG&title='+encodeURIComponent(p),'Pinboard','toolbar=no,width=700,height=500'));t.blur();





# Feedbin

Pinboard

	https://pinboard.in/add?url=${url}&title=${title}&description=from%20${source}

Pin w/ read later tag

	https://pinboard.in/add?later=yes&noui=yes&jump=close&url=${url}&title=${title}&description=from ${source}&jump=close&tags=to_IFTTT_readLater

Pin w/ Jess tag

	https://pinboard.in/add?url=${url}&title=${title}&description=from%20${source}&tags=jess

Send to Tweetbot

	tweetbot:///post?text=${title}%3A%20${url}%20via%20${source}


# Open In

## Twitterific

```javascript
javascript:
loc=window.location.pathname;
href=window.location.href;
a=href.match(/.*\/(search\?[^\/]+)$/);
if(a!=null){
    window.location="twitterrific5:///"+a[1];
}else{
    a=loc.match(/\/lists\/(.+)\/?$/);
    if(a!=null){
        window.location="twitterrific5:///list?name="+encodeURIComponent(a[1]);
    }else{
        a=loc.match(/\/status\/(\d+)/);
        if(a!=null){
            window.location="twitterrific5:///tweet?id="+a[1];
        }else{
            a=loc.match(/^\/i\/likes\/?$/);
            if(a!=null){
                window.location="twitterrific5:///favorites";
            }else{
                a=loc.match(/^\/mentions\/?$/);
                if(a!=null){
                    window.location="twitterrific5:///mentions";
                }else{
                    a=loc.match(/^\/([^\/]+)\/?$/);
                    if(a!=null){
                        window.location="twitterrific5:///profile?screen_name="+a[1];
                    }else{
                    }
                }
            }
        }
    }
}
```

## Tweetbot

```javascript
javascript:
loc=window.location.pathname;
href=window.location.href;
a=href.match(/.*\/(search\?[^\/]+)$/);
if(a!=null){
    window.location="tweetbot:///"+a[1];
}else{
    a=loc.match(/\/lists\/(.+)\/?$/);
    if(a!=null){
        window.location="tweetbot:///list/"+a[1];
    }else{
        a=loc.match(/\/status\/(\d+)/);
        if(a!=null){
            window.location="tweetbot:///status/"+a[1];
        }else{
            a=loc.match(/^\/i\/likes\/?$/);
            if(a!=null){
                window.location="tweetbot:///favorites";
            }else{
                a=loc.match(/^\/mentions\/?$/);
                if(a!=null){
                    window.location="tweetbot:///mentions";
                }else{
                    a=loc.match(/^\/([^\/]+)\/?$/);
                    if(a!=null){
                        window.location="tweetbot:///user_profile/"+a[1];
                    }else{
                    }
                }
            }
        }
    }
}
```





