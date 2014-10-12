//lots of repeated stuff, but it makes sure it grabs the right variable so I'm leaving it.
//
	function calcstepsbelt(form) 
		{
			var num = form.children,
			mot_steps = parseFloat(num[0].children[0].value),
			drv_steps = parseFloat(num[1].children[0].value);
			pitch = parseFloat(num[2].children[0].value);
			teeth = parseFloat(num[3].children[0].value);
			if (!mot_steps || !drv_steps || !pitch || !teeth || 0)
			{
				return status(1);
			}
			num[5].children[0].firstChild.nodeValue = ((mot_steps * drv_steps)/(pitch * teeth)).toFixed(3)+" steps/mm";
			return status(0);
		}

	function calcstepsthread(form) 
		{
			var num = form.children,
			mot_steps = parseFloat(num[0].children[0].value),
			drv_steps = parseFloat(num[1].children[0].value);
			tpm = parseFloat(num[2].children[0].value);
			if (!mot_steps || !drv_steps || !tpm || 0)
			{
				return status(1);
			}
			num[4].children[0].firstChild.nodeValue = ((mot_steps * drv_steps)/(tpm)).toFixed(3)+" steps/mm";
			return status(0);
		}

	function calcextruder(form) 
		{
			pi = Math.PI;
			var num = form.children,
			mot_steps = parseFloat(num[0].children[0].value),
			drv_steps = parseFloat(num[1].children[0].value);
			big_teeth = parseFloat(num[2].children[0].value);
			sml_teeth = parseFloat(num[3].children[0].value);
			hob = parseFloat(num[4].children[0].value);
			if (!mot_steps || !drv_steps || !big_teeth || !sml_teeth || !hob || 0)
			{
				return status(1);
			}
			num[6].children[0].firstChild.nodeValue = ((mot_steps * drv_steps)*(big_teeth / sml_teeth) / (hob * pi)).toFixed(3)+" steps/mm";
			return status(0);
		}

	function newsteps(form) 
		{
			var num = form.children,
			old_steps = parseFloat(num[0].children[0].value),
			dist_exp = parseFloat(num[1].children[0].value);
			dist_act = parseFloat(num[2].children[0].value);
			if (!old_steps || !dist_exp || !dist_act || 0)
			{
				return status(1);
			}
			num[4].children[0].firstChild.nodeValue = (old_steps*(dist_exp/dist_act)).toFixed(3)+" steps/mm";
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