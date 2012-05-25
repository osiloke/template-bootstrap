<div class="row marginbottom">
	<div class="span6 offset3">
		<div class="page-header">
			<h1>{$LANG.pwreset}</h1>
		</div>

{if $success}
	<div class="alert alert-success">
		<h4>{$LANG.pwresetvalidationsent}</h4>
		{$LANG.pwresetvalidationcheckemail}
	</div>
{else}
	{if $errormessage}
	<div class="alert alert-error fade in">
		<button class="close" data-dismiss="alert">&times;</button>
		{$errormessage}
	</div>
	{/if}

	{if $securityquestion}
		<div class="alert alert-info">{$LANG.pwresetsecurityquestionrequired}</div>
		<div class="row">
			<div class="span4 offset1">
				<form method="post" action="pwreset.php">
					<fieldset>
						<input type="hidden" name="action" value="reset">
						<input type="hidden" name="email" value="{$email}">
						<label for="answer">{$securityquestion}</label>
						<input class="span4" name="answer" id="answer" type="text" value="{$answer}">
                  <div class="textcenter">
							<input type="submit" class="btn btn-primary" value="{$LANG.pwresetsubmit}">
                  </div>
               </fieldset>
            </form>
         </div>
		</div>
	{else}
		<p>{$LANG.pwresetdesc}</p>
		<div class="row">
			<div class="span4 offset1">
				<form method="post" action="pwreset.php">
					<fieldset>
						<input type="hidden" name="action" value="reset" >
						<label for="email">{$LANG.loginemail}</label>
						<input class="span4" name="email" id="email" type="text">
                  <div class="textcenter">
							<input type="submit" class="btn btn-primary" value="{$LANG.pwresetsubmit}">
                  </div>
               </fieldset>
            </form>
         </div>
      </div>
	{/if}
   </div>
{/if}
</div>

