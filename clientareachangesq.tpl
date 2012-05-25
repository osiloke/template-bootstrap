<div class="page-header">
	<h1>{$LANG.clientareanavsecurityquestions}</h1>
</div>

<div class="tabbable">
	<ul class="nav nav-tabs">
		<li><a href="clientarea.php?action=details">{$LANG.clientareanavdetails}</a></li>
{if $condlinks.updatecc}
		<li><a href="clientarea.php?action=creditcard">{$LANG.clientareanavccdetails}</a></li>
{/if}
		<li><a href="clientarea.php?action=contacts">{$LANG.clientareanavcontacts}</a></li>
		<li><a href="clientarea.php?action=changepw">{$LANG.clientareanavchangepw}</a></li>
{if $condlinks.updatesq}
		<li class="active"><a href="clientarea.php?action=changesq">{$LANG.clientareanavsecurityquestions}</a></li>
{/if}
	</ul>
</div>

{if $successful}
<div class="alert alert-success fade in">
	<button class="close" data-dismiss="alert">&times;</button>
	{$LANG.changessavedsuccessfully}
</div>
{/if}

{if $errormessage}
<div class="alert alert-error fade in">
	<h4 class="alert-heading">{$LANG.clientareaerrors}</h4>
	<ul>
		{$errormessage}
	</ul>
</div>
{/if}

<form method="post" action="clientarea.php">
	<input type="hidden" name="action" value="changesq">
{if !$nocurrent}
	<div class="textcenter">
		<p>{$LANG.pwresetsecurityquestionrequired}</p>
		<div class="well well-small textcenter form-inline">
			<label for="currentans">{$currentquestion}</label>
			<input type="password" name="currentsecurityqans" id="currentans" class="span3">
		</div>
	</div>
{/if}
	<div class="row marginbottom">
		<div class="span4 offset2">
			<label for="securityqid">{$LANG.clientareasecurityquestion}</label>
			<select name="securityqid" id="securityqid" class="span3">
			{foreach key=num item=question from=$securityquestions}
				<option value={$question.id}>{$question.question}</option>
			{/foreach}
			</select>
		</div>
		<div class="span4">
			<label for="securityqans">{$LANG.clientareasecurityanswer}</label>
			<input type="password" name="securityqans" id="securityqans" class="span3">
			<label for="securityqans2">{$LANG.clientareasecurityconfanswer}</label>
			<input type="password" name="securityqans2" id="securityqans2" class="span3">
		</div>
	</div>
	<hr>
	<div class="textcenter">
		<input class="btn btn-primary" type="submit" name="submit" value="{$LANG.clientareasavechanges}">
		<input class="btn" type="reset" value="{$LANG.cancel}">
	</div>
</form>
