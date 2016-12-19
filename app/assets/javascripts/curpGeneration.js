
const short_states = [ 
  'AS', 'BC', 'BS', 'CC', 'CS', 'CH', 'CL', 'CM', 'DF', 'DG', 'MC',
  'GT', 'GR', 'HG', 'JC', 'MN', 'MS', 'NT', 'NL', 'OC', 'PL', 'QT',
  'QR', 'SP', 'SL', 'SR', 'TC', 'TS', 'TL', 'VZ', 'YN', 'ZS', 'NE' 
];

const states = [
  "Aguascalientes", "Baja California", "Baja California Sur", "Campeche", 
  "Chiapas", "Chihuahua", "Coahuila", "Colima", "Distrito Federal", "Durango", 
  "Estado de México", "Guanajuato", "Guerrero", "Hidalgo", "Jalisco", "Michoacán", 
  "Morelos", "Nayarit", "Nuevo León", "Oaxaca", "Puebla", "Querétaro", 
  "Quintana Roo", "San Luis Potosí", "Sinaloa", "Sonora", "Tabasco", 
  "Tamaulipas", "Tlaxcala", "Veracruz", "Yucatán", "Zacatecas", "Extranjero"
]



// const long_states

/*
   * Reads input fields
   * returns JSON with field values
   */
function readValues(){  
  var first_name = $('#first_name').val();
  var second_name = $('#second_name').val();
  var first_last_name = $('#first_last_name').val();
  var second_last_name = $('#second_last_name').val();    
  var birth_state = short_states[states.indexOf($('#birth_state').val())];
  var day = $('#profile_birth_date_3i')[0].value;
  var month = $('#profile_birth_date_2i')[0].value;
  var year = $('#profile_birth_date_1i')[0].value;
  var birth_date = [day, month, year];
  var male = $('#profile_gender_male').is(':checked') ? 'H' : null;
  var female = $('#profile_gender_female').is(':checked') ? 'M' : null;
  var gender = male || female
  if(second_name){
    first_name += " " + second_name;
  }
  
  return {
    nombre            : first_name,
    apellido_paterno  : first_last_name,
    apellido_materno  : second_last_name,
    sexo              : gender,
    estado            : birth_state,
    fecha_nacimiento  : [day, month, year]
  };
}

/*
 * Verifies if a given json
 * doesn't have empty fields
 */
function isValid(json){    
  var empty = 0;
  Object.keys(json).forEach((property) =>{
    if(!json[property]){        
      empty ++;
    } 
  });    
  return empty === 0;
}

//Fills curp field
function fillCurp(){    
  var fields = readValues();
  if(isValid(fields)){
    curp = generaCurp(fields);          
    $('#curp').val(curp);    
  }    
}

function ready(){
  $('#first_name').change(() =>{fillCurp();});  
  $('#second_name').change(() =>{fillCurp();});
  $('#first_last_name').change(() =>{fillCurp();});
  $('#second_last_name').change(() =>{fillCurp();});
  $('#birth_state').change(() => {fillCurp();})
  $('#profile_birth_date_3i').click(() => {fillCurp();})
  $('#profile_birth_date_2i').click(() => {fillCurp();})
  $('#profile_birth_date_1i').click(() => {fillCurp();})
  $('#profile_gender_male').click(() => {fillCurp();})
  $('#profile_gender_female').click(() => {fillCurp();})
  $('#birth_state').change((e) =>{
    var value = e.target.value;
  })
}

$(document).ready(ready) ;
$(document).on('turbolinks:load', ready);