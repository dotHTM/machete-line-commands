
Lazy-bones tricks and tips.



# RegEx

## Wiki links

    \[\[([^\|\]]*?\|)?([^\|\]]*?)\]\]

- `$1` matches the linked document (iff different than linked text)
- `$2` matches the link text and/or the linked document


# JavaScript

<li>
    <a href="javascript:q=location.href;if(document.getSelection)%7Bd=document.getSelection();%7Delse%7Bd='';%7D;p=document.title;void(open('https://pinboard.in/add?url='+encodeURIComponent(q)+'&description='+encodeURIComponent(d)+'&title='+encodeURIComponent(p),'Pinboard','toolbar=no,scrollbars=yes,width=750,height=700'));">Save in Pinboard</a> (Not mine)
</li>
<li>
    <a href="javascript:q=location.href;if(document.getSelection)%7Bd=document.getSelection();%7Delse%7Bd='';%7D;p=document.title;void(open('https://feedbin.me/?subscribe='+encodeURIComponent(q)));">Subscribe in Feedbin</a>
</li>
<li>
    <a href="javascript:(function()%7Bif(%2Fyoutube%5C.com%5C%2Fwatch%2F.test(location.href))%7Bvar%20a%2Cb%3Dlocation.search.replace(%2F%5B%3F%26%5Dv%3D(%5B%5E%26%5D*)%2F%2Cfunction(s%2Cm)%7Ba%3Dm%3Breturn%20''%3B%7D).substr(1)%3Bif(a)location.href%3D'http%3A%2F%2Fwww.youtube.com%2Fembed%2F'%2Ba%2B'%3F'%2Bb%3B%7Delse%7Bvar%20m%3Dlocation.href.match(%2Fyoutube%5C.com%5C%2Fembed%5C%2F(%5B%5E%3F%5D*)%2F)%3Bif(m)location.href%3D'http%3A%2F%2Fwww.youtube.com%2Fwatch%3Fv%3D'%2Bm%5B1%5D%2Blocation.search.replace(%2F%5C%3F%2F%2C'%26')%3B%7D%7D)()%3B">Toggle Youtube Embed Player</a>
</li>
<li>
    <a href="javascript:window.location='https://web.archive.org/web/*/'+(window.location.href);">Wayback</a>
</li>
<li>
    <a href="javascript:(function()%7B(function%20()%20%7Bvar%20i%2C%20elements%20%3D%20document.querySelectorAll('body%20*')%3Bfor%20(i%20%3D%200%3B%20i%20%3C%20elements.length%3B%20i%2B%2B)%20%7Bif%20(getComputedStyle(elements%5Bi%5D).position%20%3D%3D%3D%20'fixed')%20%7Belements%5Bi%5D.parentNode.removeChild(elements%5Bi%5D)%3B%7D%7D%7D)()%7D)()">Kill Sticky</a> (Not mine)
</li>
<li>
    <a href="javascript:window.location='http://downforeveryoneorjustme.com/'+window.location.host">Site Down?</a>
</li>
<li>
    <a href="javascript:terms=prompt("Search%20this%20site%20for:","");open('https://duckduckgo.com/?q=site%3A'+encodeURIComponent(location.host+"%20"+terms));">Site DDG Search</a>
</li>
<li>
    <a href="javascript:loc='textastic://'+(window.location.hostname+window.location.pathname);window.location=loc;">Open in Textastic</a>
</li>
<li>
    <a href="javascript:window.location='op'+(window.location.href);">Open in 1pass</a>
</li>
<li>
    <a href="javascript:loc=window.location.pathname;href=window.location.href;a=href.match(/.*\/(search\?[^\/]+)$/);if(a!=null){%20%20%20%20window.location="twitterrific5:///"+a[1];}else{a=loc.match(/\/lists\/(.+)\/?$/);if(a!=null){window.location="twitterrific5:///list?name="+encodeURIComponent(a[1]);}else{a=loc.match(/\/status\/(\d+)/);if(a!=null){window.location="twitterrific5:///tweet?id="+a[1];}else{a=loc.match(/^\/i\/likes\/?$/);if(a!=null){window.location="twitterrific5:///favorites";}else{a=loc.match(/^\/mentions\/?$/);if(a!=null){window.location="twitterrific5:///mentions";}else{a=loc.match(/^\/([^\/]+)\/?$/);if(a!=null){window.location="twitterrific5:///profile?screen_name="+a[1];}else{}}}}}}">Open in Twitterific</a>
</li>
<li>
    <a href="javascript:loc=window.location.pathname;href=window.location.href;a=href.match(/.*\/(search\?[^\/]+)$/);if(a!=null){window.location="tweetbot:///"+a[1];}else{a=loc.match(/\/lists\/(.+)\/?$/);if(a!=null){window.location="tweetbot:///list/"+a[1];}else{a=loc.match(/\/status\/(\d+)/);if(a!=null){window.location="tweetbot:///status/"+a[1];}else{a=loc.match(/^\/i\/likes\/?$/);if(a!=null){window.location="tweetbot:///favorites";}else{a=loc.match(/^\/mentions\/?$/);if(a!=null){window.location="tweetbot:///mentions";}else{a=loc.match(/^\/([^\/]+)\/?$/);if(a!=null){window.location="tweetbot:///user_profile/"+a[1];}else{}}}}}}">Open in Tweetbot</a>
</li>


<!-- 

## Subscribe in Feedbin to Current Website

Modified from the Pinboard.in bookmarklet. Seemed better than hacking the Instapaper one, as this uses built-in JavaScript functions.

    javascript:q=location.href;if(document.getSelection)%7Bd=document.getSelection();%7Delse%7Bd='';%7D;p=document.title;void(open('https://feedbin.me/?subscribe='+encodeURIComponent(q)));



## Save for later via Pinboard

Utilizes an IFTTT.com recipe to collect items into a read-later service. I don't use this so much anymore now that I prefer saving items to Safari Reading list (and most third party Pinboard apps don't handle tagging well).

    javascript:q=location.href;p=document.title;void(t=open('https://pinboard.in/add?later=yes&noui=yes&jump=close&url='+encodeURIComponent(q)+'&tags=to_IFTTT_readLater&title='+encodeURIComponent(p),'Pinboard','toolbar=no,width=100,height=100'));t.blur();


## Pinboard w/ tag

Utilizes an IFTTT.com recipe to collect items into a read-later service. I don't use this so much anymore now that I prefer saving items to Safari Reading list or third party apps.

    javascript:q=location.href;p=document.title;void(t=open('https://pinboard.in/add?url='+encodeURIComponent(q)+'&tags=YOURTAG&title='+encodeURIComponent(p),'Pinboard','toolbar=no,width=700,height=500'));t.blur();


## Search Site in DuckDuckGo


    javascript:terms=prompt("Search this site for:","");open('https://duckduckgo.com/?q=site%3A'+encodeURIComponent(location.host+" "+terms));


## Feedbin

Subscribe

    javascript:q=location.href;if(document.getSelection)%7Bd=document.getSelection();%7Delse%7Bd='';%7D;p=document.title;void(open('https://feedbin.me/?subscribe='+encodeURIComponent(q)));
    

### [Feedbin Actions](https://feedbin.com/settings/actions)

Pin on [Pinboard.in](pinboard.in)

    https://pinboard.in/add?url=${url}&title=${title}&description=from%20${source}

Pin w/ read later tag

    https://pinboard.in/add?later=yes&noui=yes&jump=close&url=${url}&title=${title}&description=from ${source}&jump=close&tags=to_IFTTT_readLater

Pin w/ static_tag

    https://pinboard.in/add?url=${url}&title=${title}&description=from%20${source}&tags=static_tag

## Pinboard

General:

    javascript:q=location.href;if(document.getSelection)%7Bd=document.getSelection();%7Delse%7Bd='';%7D;p=document.title;void(open('https://pinboard.in/add?url='+encodeURIComponent(q)+'&description='+encodeURIComponent(d)+'&title='+encodeURIComponent(p),'Pinboard','toolbar=no,scrollbars=yes,width=750,height=700'));



## Open In

### Twitterific

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

### Tweetbot

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





 -->