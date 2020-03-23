function kFormatter(num) {
  return Math.abs(num) > 999 ? Math.sign(num)*((Math.abs(num)/1000).toFixed(1)) +
  'k' : Math.sign(num)*Math.abs(num)
}

function(params){

  return(
    'IMDb Rating: ' + params.value[0] +
    '<br />Your Rating: ' + params.value[1] +
    '<br />Num Votes: ' + params.value[2] +
    '<br />Num Votes: ' + kFormatter(params.value[2])
  )
}
