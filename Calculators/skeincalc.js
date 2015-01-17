function edgewidth(form) 
		{
			var num = form.children,
			nozzle_width = parseFloat(num[0].children[0].value),
			layer_height = parseFloat(num[1].children[0].value);
			if (!nozzle_width || !layer_height || 0)
			{
				return status(1);
			}
			num[3].children[0].firstChild.nodeValue = (nozzle_width / layer_height).toFixed(3);
			return status(0);
		}
		
function solidlayers(form) 
		{
			var num = form.children,
			desired_thickness = parseFloat(num[0].children[0].value),
			layer_height = parseFloat(num[1].children[0].value);
			if (!desired_thickness || !layer_height || 0)
			{
				return status(1);
			}
			num[3].children[0].firstChild.nodeValue = (desired_thickness / layer_height).toFixed(3);
			return status(0);
		}
		
function layerone(form) 
		{
			var num = form.children,
			layer_height = parseFloat(num[1].children[0].value),
			add_height = parseFloat(num[3].children[0].value),
			altitude = parseFloat(num[4].children[0].value),
			lift = parseFloat(num[6].children[0].value);
			
			num[8].children[0].firstChild.nodeValue = ((layer_height * add_height) + (layer_height * lift) + altitude).toFixed(3);
			return status(0);
		}
		
	function status(error)
		{
			if (error == 1) 
		{
			document.getElementById("error").innerHTML = ('Error: Please check values and try again.<br>Only numbers can be entered. Decimals or whole numbers are acceptable'); //sets the error message
		}
			else
		{
			document.getElementById("error").innerHTML = (''); //clears the error message, should users correct whatever caused it
		}
	}