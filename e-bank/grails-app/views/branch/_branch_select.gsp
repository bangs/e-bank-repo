<div class="control-group">
	<label for="branch" class="control-label">Branch</label>
   	<div class="controls">
		<g:select name="branch.id" from="${zw.co.quantum.legend.model.Branch.list()}" 
			optionKey="id" optionValue="name"  noSelection="['':'--Select--']"/>
	</div>
</div>