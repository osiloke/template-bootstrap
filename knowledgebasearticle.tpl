<div class="page-header">
	<h1>{$LANG.knowledgebasetitle}</h1>
</div>

{literal}
<script type="text/javascript">
function addBookmark() {
	if (window.sidebar) {
		window.sidebar.addPanel('{/literal}{$companyname} - {$kbarticle.title}{literal}', location.href,"");
	} else if( document.all ) {
		window.external.AddFavorite( location.href, {/literal}'{$companyname} - {$kbarticle.title}'{literal});
	} else if( window.opera && window.print ) {
		return true;
	}
}
</script>
{/literal}

<div class="row">
	<div class="span8">
		<p>{$breadcrumbnav}</p>
	</div>
	<div class="span4 textright">
		<img src="images/addtofavouritesicon.gif" class="valignbaseline" alt="{$LANG.knowledgebasefavorites}"> <a href="#" onClick="addBookmark();return false">{$LANG.knowledgebasefavorites}</a> &nbsp;&nbsp; <img src="images/print.gif" class="valignbaseline" alt="{$LANG.knowledgebaseprint}"> <a href="#" onclick="window.print();return false">{$LANG.knowledgebaseprint}</a>
	</div>
</div>

<h2 class="marginbottom">{$kbarticle.title}</h2>

<blockquote>
	{$kbarticle.text}
</blockquote>

<form method="post" action="knowledgebase.php?action=displayarticle&amp;id={$kbarticle.id}&amp;useful=vote" class="well form-horizontal textcenter">
	{if $kbarticle.voted}
		<strong>{$LANG.knowledgebaserating}</strong> {$kbarticle.useful} {$LANG.knowledgebaseratingtext} ({$kbarticle.votes} {$LANG.knowledgebasevotes})
	{else}
		<strong>{$LANG.knowledgebasehelpful}</strong> 
		<select name="vote">
			<option value="yes">{$LANG.knowledgebaseyes}</option>
			<option value="no">{$LANG.knowledgebaseno}</option>
		</select>
		<input type="submit" value="{$LANG.knowledgebasevote}" class="btn btn-primary">
	{/if}
</form>

{if $kbarticles}
<h3>{$LANG.knowledgebasealsoread}</h3>
<ul class="unstyled">
{foreach key=num item=kbarticle from=$kbarticles}
	<li>
		<h4><img src="images/article.gif" alt="Article Icon"> <a href="{if $seofriendlyurls}knowledgebase/{$kbarticle.id}/{$kbarticle.urlfriendlytitle}.html{else}knowledgebase.php?action=displayarticle&amp;id={$kbarticle.id}{/if}">{$kbarticle.title}</a> <small>({$LANG.knowledgebaseviews}: {$kbarticle.views})</small></h4>
	</li>
{/foreach}
</ul>
{/if}
