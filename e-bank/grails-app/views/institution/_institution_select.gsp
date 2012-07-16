<div class="control-group">
	<label for="branch" class="control-label">Institution</label>
   	<div class="controls">
		<g:select name="institution.id" from="${zw.co.quantum.legend.model.Institution.list()}" 
			optionKey="id" optionValue="name"  noSelection="['':'--Select--']"/>
	</div>
</div>