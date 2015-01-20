$ ()->
	$(".password-checkbox2").click (e)->
		show(this)




show = (input)->
	debugger
	if input.checked == true 
		document.getElementById('zonker').type="text"
	else
		document.getElementById('zonker').type="password"

# function show(val){
# var dontChange = 1;

#   if(val.checked == true){
#       document.getElementById('zonker').type="password";
#   }
#   else{
#       document.getElementById('zonker').type="text";
#   }


# }
	




