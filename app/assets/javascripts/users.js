


$(document).ready(function(){

  // var val = document.getElementById("password-checkbox");
  // debugger
  // show(val);

  // $(".password-checkbox2").click(function(){
  //   show(this);
  // });

  //using class here because I want all password fields to be
  //able to use this code.
  //--for showing password 

// idea:

// -make a show_fields button that will accept the id names as params 
// -get the password confirm working


  // $(".password-checkbox2").click(function(){
  //   show(this);
  // });

  //idea: turn inputs into array so that the functions are reuseable. 

  $("#password-checkbox").click(function(){
    showFields(this,"password","password_confirm");
  });

  //--check if user name exists
  $("#user_name").keyup(function(){
    //console.log("getting into here at least");
    check_if_user_name_already_exists();
  });

  //FIX!!!!!!!!
  //--confirm passwords (strings) are the same. 
  $(".new_view_password").keyup(function(){
    console.log('here');
    new_view_password_confirmation_print("comparison-results","password","password_confirm");
  });


});


// document.addEventListener("DOMContentLoaded", function(event) { 
  
//   console.log("GOT HERE!!!!!!!");
// 	var res = document.querySelector(".password-checkbox2");
	
//   // if(res.checked){
//   //   debugger
//   // }
//   //debugger

// 	show(res);

// });

function show(val){

  //console.log("got into show");
  //debugger

  if(val.checked == true){
      document.getElementById('zonker').type="text";
      //console.log("show as text");
  }
  else{
      document.getElementById('zonker').type="password";
      //console.log("show as password");
  }


}

//f1 == field1, f2 == field2
function showFields(checkBox,f1,f2){

  //console.log("got into show");
  //console.log(checkBox)
  //debugger
  

  if(checkBox.checked == true){
      document.getElementById(f1).type="text";
      document.getElementById(f2).type="text";
      //console.log("show as text");
  }
  else{
      document.getElementById(f1).type="password";
      document.getElementById(f2).type="password";
      //console.log("show as password");
  }




}


function check_if_user_name_already_exists(){

  //console.log("got into check_if_user_name_already_exists");

  var poss_user_name = document.getElementById("user_name").value;



  if(meets_requirements(poss_user_name)){
    //console.log("got into if body of check_if_user_name_already_exists");
    ajax_code(poss_user_name);
  }
}

//to add a user name requirement, add an else if statment, and have
//it return true
function meets_requirements(poss_user_name){

  var minLength = 4; //minimum user name length



  //console.log("got into meets_requirements");
  //if(true){
  if(poss_user_name.length >= minLength &&
    poss_user_name.match(/[0-9]/) ){
    //console.log("worked!!!!!!!!!");
    return true;
  }
// else if (condition2) {
// }
  else{
    //console.log("NOTTTT working");
    return false;
  }
}

function ajax_code(poss_user_name){
  //console.log("got into poss_user_name");

  var params = { data: poss_user_name };  

  $.ajax({
      type: "POST",
      url: "/users/sign_up_helper/?format=json",
      data: params,
      dataType: "json",
      traditional: true,
      success: function(dataz){
        // document.getElementById("test3").innerHTML = dataz.res[0].user_name;
        // console.log("dataz.res[0].user_name is: " + dataz.res[0].user_name);
        // console.log(dataz)
        if(dataz.exists){
        document.getElementById("results").innerHTML = "user name already taken";
        }
        else{
          document.getElementById("results").innerHTML = "user name avaiable";
        }
        //console.log("dataz.exists is: " + dataz.exists);
        //console.log(dataz)
      }

  });

}

  //comp_res == comparison results
  function new_view_password_confirmation_print(comp_res,s1,s2){

    var pass = document.getElementById(s1).value;
    var passC = document.getElementById(s2).value;

    // document.writeln("pass2 is: \"" + pass2 + "\"" + "\n");
    
    // document.write("pass3 is: \"" + pass3 + "\"");

    if(pass != "" && passC != ""){

      if(pass == passC){

        //document.write("match!");
        document.getElementById(comp_res).innerHTML = "match!";
      }
      else{
        //document.write("NO match!");
        document.getElementById(comp_res).innerHTML = "NO match!";
      }


    }
    else{
      //document.write("nothing to compare.");
      document.getElementById(comp_res).innerHTML = "nothing to compare.";
    }
    
  }


  function password_confirmation_print(){

    var pass2 = document.getElementById('password2').value;
    var pass3 = document.getElementById('password3').value;

    // document.writeln("pass2 is: \"" + pass2 + "\"" + "\n");
    
    // document.write("pass3 is: \"" + pass3 + "\"");

    if(pass2 != "" && pass3 != ""){
      if(pass2 == pass3){

        //document.write("match!");
        document.getElementById("demo").innerHTML = "match!";
      }
      else{
        //document.write("NO match!");
        document.getElementById("demo").innerHTML = "NO match!";
      }


    }
    else{
      //document.write("nothing to compare.");
      document.getElementById("demo").innerHTML = "nothing to compare.";
    }
    
  }


// ------------------------------------

//  $ ()->
//  	$(".password-checkbox2").click (e)->
//  		show(this)



//  show = (input)->
//  	debugger
//  	if input.checked == true 
//  		document.getElementById('zonker').type="text"
//  	else
//  		document.getElementById('zonker').type="password"


// ------------------------------------


	




