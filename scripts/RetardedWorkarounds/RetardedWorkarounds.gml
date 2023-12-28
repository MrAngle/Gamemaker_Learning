


function my_object_has_field(_object, _field_name) 
{
    // Sprawdzenie, czy obiekt nie jest undefined
    if (_object != undefined)
    {
        // Sprawdzenie, czy obiekt posiada określone pole
        if (variable_instance_exists(_object, _field_name))
        {
            return true;
        }
    }
    return false;
}


function my_object_has_field_and_is_true(_object, _field_name) 
{
    // Sprawdzenie, czy obiekt nie jest undefined
    if (my_object_has_field(_object, _field_name))
    {
        return variable_instance_get(_object, _field_name) == true;
    }

    return false;
}

function my_copy_parameters_to_from_struct(_to_struct, _from_struct)
{

	if (_from_struct != undefined)
	{
	    var klucz;
	    var keys = variable_struct_get_names(_from_struct);
	    for (var i = 0; i < array_length(keys); i++)
	    {
	        klucz = keys[i];
	        var wartosc = variable_struct_get(_from_struct, klucz);
	        variable_struct_set(_to_struct, klucz, wartosc);
	    }
	}
}

function isNull(_obj) {
	if (_obj == noone || _obj == undefined) {
		return true;
	}
	return false;
}