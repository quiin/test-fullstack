short_states = [
	'AS', 'BC', 'BS', 'CC', 'CS', 'CH', 
	'CL', 'CM', 'DF', 'DG', 'MC', 'GT', 
	'GR', 'HG', 'JC', 'MN', 'MS', 'NT', 
	'NL', 'OC', 'PL', 'QT', 'QR', 'SP', 
	'SL', 'SR', 'TC', 'TS', 'TL', 'VZ', 
	'YN', 'ZS', 'NE'
]
states = [
  'Aguascalientes', 'Baja California', 'Baja California Sur', 
  'Campeche', 'Chiapas', 'Chihuahua', 'Coahuila', 'Colima', 
  'Distrito Federal', 'Durango', 'Estado de México', 
  'Guanajuato', 'Guerrero', 'Hidalgo', 'Jalisco', 
  'Michoacán', 'Morelos', 'Nayarit', 'Nuevo León', 
  'Oaxaca', 'Puebla', 'Querétaro', 'Quintana Roo', 
  'San Luis Potosí', 'Sinaloa', 'Sonora', 'Tabasco', 
  'Tamaulipas', 'Tlaxcala', 'Veracruz', 'Yucatán', 
  'Zacatecas', 'Extranjero'
]
# const long_states

###
   * Reads input fields
   * returns JSON with field values
###

readValues = ->
  first_name = $('#first_name').val()
  second_name = $('#second_name').val()
  first_last_name = $('#first_last_name').val()
  second_last_name = $('#second_last_name').val()
  birth_state = short_states[states.indexOf($('#birth_state').val())]
  day = $('#profile_birth_date_3i')[0].value
  month = $('#profile_birth_date_2i')[0].value
  year = $('#profile_birth_date_1i')[0].value
  birth_date = [
    day
    month
    year
  ]
  male = if $('#profile_gender_male').is(':checked') then 'H' else null
  female = if $('#profile_gender_female').is(':checked') then 'M' else null
  gender = male or female
  if second_name
    first_name += ' ' + second_name
  {
    nombre: first_name
    apellido_paterno: first_last_name
    apellido_materno: second_last_name
    sexo: gender
    estado: birth_state
    fecha_nacimiento: [
      day
      month
      year
    ]
  }

###
# Verifies if a given json
# doesn't have empty fields
###

isValid = (json) ->
  empty = 0
  Object.keys(json).forEach (property) ->
    if !json[property]
      empty++
    return
  empty == 0

#Fills curp field

fillCurp = ->
  fields = readValues()
  if isValid(fields)
    curp = generaCurp(fields)
    $('#curp').val curp
  return

ready = ->
  $('#first_name').change ->
    fillCurp()
    return
  $('#second_name').change ->
    fillCurp()
    return
  $('#first_last_name').change ->
    fillCurp()
    return
  $('#second_last_name').change ->
    fillCurp()
    return
  $('#birth_state').change ->
    fillCurp()
    return
  $('#profile_birth_date_3i').click ->
    fillCurp()
    return
  $('#profile_birth_date_2i').click ->
    fillCurp()
    return
  $('#profile_birth_date_1i').click ->
    fillCurp()
    return
  $('#profile_gender_male').click ->
    fillCurp()
    return
  $('#profile_gender_female').click ->
    fillCurp()
    return
  $('#birth_state').change (e) ->
    value = e.target.value
    return
  return

$(document).ready ready
$(document).on 'turbolinks:load', ready
