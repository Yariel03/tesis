/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Carrera;

import InfoCarrera.ArrayOfHorarioEstudiante;
import InfoCarrera.ArrayOfInscripcion;
import InfoCarrera.ArrayOfMateria;
import InfoCarrera.Estudiante;
import InfoCarrera.GetDatosCompletosEstudiante;
import InfoCarrera.Materia;
import ec.edu.espoch.academico.Periodo;
import java.util.List;



/**
 *
 * @author WebMaster
 */
public class CLDatosCompletos {







////////////////////////////////////////////////////////////////////////////


    public static  Estudiante getDatosCompletosEstudiante(java.lang.String strCedula) {
        InfoCarrera.InfoCarrera service = new InfoCarrera.InfoCarrera();
        InfoCarrera.InfoCarreraSoap port = service.getInfoCarreraSoap();
        return port.getDatosCompletosEstudiante(strCedula);
    }

    public static ArrayOfInscripcion getInscripcionesEstudiante(java.lang.String strCedula) {
        InfoCarrera.InfoCarrera service = new InfoCarrera.InfoCarrera();
        InfoCarrera.InfoCarreraSoap port = service.getInfoCarreraSoap();
        return port.getInscripcionesEstudiante(strCedula);
    }

    public static ArrayOfMateria getMateriasEstudiante(java.lang.String codCarrera, java.lang.String cedula, java.lang.String codPeriodo) {
        InfoCarrera.InfoCarrera service = new InfoCarrera.InfoCarrera();
        InfoCarrera.InfoCarreraSoap port = service.getInfoCarreraSoap();
        return port.getMateriasEstudiante(codCarrera, cedula, codPeriodo);
    }

    public static Periodo getPeriodoActual() {
        ec.edu.espoch.academico.InfoGeneral service = new ec.edu.espoch.academico.InfoGeneral();
        ec.edu.espoch.academico.InfoGeneralSoap port = service.getInfoGeneralSoap();
        return port.getPeriodoActual();
    }

    public static ArrayOfHorarioEstudiante getHorarioEstudiante(java.lang.String codCarrera, java.lang.String strCedula) {
        InfoCarrera.InfoCarrera service = new InfoCarrera.InfoCarrera();
        InfoCarrera.InfoCarreraSoap port = service.getInfoCarreraSoap();
        return port.getHorarioEstudiante(codCarrera, strCedula);
    }

    

   

   
    
}
