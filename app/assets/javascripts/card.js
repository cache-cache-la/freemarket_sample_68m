$(function(){
  // $("#delete").on('click', function(){
  //   alert("削除しました");
  // });

  $("#token_submit").on("click", function(){
    if( document . inputForm . number . value == "" ){
        document . getElementById( 'warn1' ) . style . display = "block";
    }else{
        document . getElementById( 'warn1' ) . style . display = "none";
    }
    if( document . inputForm . number . value < 16){
        document . getElementById( 'warn2' ) . style . display = "block";
    }else{
        document . getElementById( 'warn2' ) . style . display = "none";
    }
    if( document . inputForm . cvcnumber . value == "" ){
      document . getElementById( 'warn3' ) . style . display = "block";
    }else{
        document . getElementById( 'warn3' ) . style . display = "none";
    }
    if( document . inputForm . cvcnumber . value < 3){
      document . getElementById( 'warn4' ) . style . display = "block";
    }else{
        document . getElementById( 'warn4' ) . style . display = "none";
    }
  });
})