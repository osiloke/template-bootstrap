<div class="page-header">
	<h1>{$title}</h1>
</div>
<div class="textright"><strong>{$timestamp|date_format:"%A, %B %e, %Y"}</strong></div>

{$text}


<div class="well">
	<div class="row-fluid">
{if $twittertweet}
		<div class="span3 textcenter">
			<div class="tweetbutton" style="display:inline-block;"><a href="https://twitter.com/share" class="twitter-share-button" data-via="{$twitterusername}">Tweet</a><script type="text/javascript" src="//platform.twitter.com/widgets.js"></script></div>
		</div>
{/if}
{if $facebookrecommend}
		<div class="span6 textcenter">
			{literal}<script>(function(d, s, id) { var js, fjs = d.getElementsByTagName(s)[0]; if (d.getElementById(id)) return; js = d.createElement(s); js.id = id; js.src = "//connect.facebook.net/en_US/all.js#xfbml=1"; fjs.parentNode.insertBefore(js, fjs); }(document, 'script', 'facebook-jssdk'));</script>{/literal}
			<div class="fb-like" data-href="{$systemurl}{if $seofriendlyurls}announcements/{$id}/{$urlfriendlytitle}.html{else}announcements.php?id={$id}{/if}" data-send="true" data-width="450" data-show-faces="true" data-action="recommend"></div>
		</div>
{/if}
{if $googleplus1}
		<div class="span3 textcenter">
			<g:plusone annotation="inline"></g:plusone>
			{literal}<script type="text/javascript">(function() { var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true; po.src = 'https://apis.google.com/js/plusone.js'; var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s); })();</script>{/literal}
		</div>
{/if}
	</div>
</div>

{if $facebookcomments}
<div class="marginbottom">
	<div id="fb-root"></div>
	{literal}<script>(function(d, s, id) { var js, fjs = d.getElementsByTagName(s)[0]; if (d.getElementById(id)) {return;} js = d.createElement(s); js.id = id; js.src = "//connect.facebook.net/en_US/all.js#xfbml=1"; fjs.parentNode.insertBefore(js, fjs); }(document, 'script', 'facebook-jssdk'));</script>{/literal}
	<fb:comments href="{$systemurl}{if $seofriendlyurls}announcements/{$id}/{$urlfriendlytitle}.html{else}announcements.php?id={$id}{/if}" num_posts="5" width="500"></fb:comments>
</div>
{/if}

<p class="textcenter"><a href="announcements.php" title="{$LANG.clientareabacklink}" class="btn">{$LANG.clientareabacklink}</a></p>
