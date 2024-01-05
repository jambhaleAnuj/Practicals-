
CREATE TABLE EmployeeData OF xmltype ;

BEGIN 
INSERT INTO EmployeeData 
VALUES ('<EmployeeData>' 
||'<employee id="346">' 
||'<firstname>Darren</firstname>' 
||'<lastname>Dsouza</lastname>' 
||'<hireDate>2/8/22</hireDate>' 
||'</employee>' 
||'<employee id="123">' 
||'<firstname>Manoj</firstname>' 
||'<lastname>Dsouza</lastname>' 
||'<hireDate>5/8/22</hireDate>' 
||'</employee>' 
||'</EmployeeData>'); 
COMMIT; 
END; 
/

SELECT xmlquery( 
'<Summary lineItemCount="{count($XML/EmployeeData/employee)}">{ 
$XML/EmployeeData/employee 
} 
</Summary>' 
passing object_value AS "XML" 
 returning content 
).getclobval() initial_state 
FROM EmployeeData ;

UPDATE EmployeeData 
SET object_value = XMLQuery 
( 
'copy $NEWXML := $XML modify ( 
for $ED in $NEWXML/EmployeeData/employee[@id="123"] return ( 
replace value of node $ED/firstname with $firstname1 
) 
) 
return $NEWXML' 
passing object_value as "XML", 
'Danny' as "firstname1" 
returning content 
) 
WHERE xmlExists( 
'$XML/EmployeeData/employee/hiredate=$REF' 
passing object_value as "XML", 
'5/8/22' as "REF" 
) ;

UPDATE EmployeeData 
SET object_value = XMLQuery 
( 
'copy $NEWXML := $XML modify ( 
delete nodes $NEWXML/EmployeeData/employee[@id=$id] 
) 
return $NEWXML' 
 passing object_value as "XML", 
'123' as "id" 
returning content 
);

