/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package conexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Logger;

/**
 *
 * @author
 */
public class AccesoDatos {

    private Connection con;
    private Exception error;
    private ResultSet rs;

    public AccesoDatos() {
        this.con = null;
        this.error = null;
    }

    /**
     * @return the error
     */
    public Exception getError() {
        return error;
    }

    /*0 signifiuca falso y cualkier otro valor es verdadero*/
    public ResultSet getRs() {
        return rs;
    }

    public Byte Connectar() {
        //si devuelve 1 no se conecto a la bbase de datos
        //si devuelve 2 se conecto a la bbase de datos
        Byte result = 0;
        try {
            Class.forName(Global.driverclass);
            result = 1;
            this.con = DriverManager.getConnection(Global.databaseURL, Global.usuarioDB, Global.claveDB);
            result = 2;
        } catch (SQLException e) {
            Logger log = Logger.getLogger(this.getClass().getName());
            log.severe(e.getMessage());
            this.error = e;
        } finally {
            return result;
            
        }

    }

    public Byte Desconectar() {
        Byte result = 0;
        try {
            this.getCon().close();
            /*este null es el destructor porque en java no esxiste destructor*/
            this.con = null;
            result = 1;
        } catch (SQLException e) {
            Logger log = Logger.getLogger(this.getClass().getName());
            log.severe(e.getMessage());
            this.error = e;
        } finally {
            return result;
        }
    }

    public Byte EjecutarSQL(String SQL) {
        Byte result = 0;
        try {
            Statement smt = this.getCon().createStatement();
            this.rs = smt.executeQuery(SQL);
            result = 1;
        } catch (SQLException e) {
            Logger log = Logger.getLogger(this.getClass().getName());
            log.severe(e.getMessage());

            this.error = e;
        } finally {
            return result;
        }
    }

    /*itra forma de utilizar los sql */

    public Integer EjecutarUpdate(String SQL) {
        Integer result = 0;
        try {
            PreparedStatement smt = this.getCon().prepareStatement(SQL);
            result = smt.executeUpdate();
            
        } catch (SQLException e) {
            Logger log = Logger.getLogger(this.getClass().getName());
            log.severe(e.getMessage());
        } finally {
            return result;
        }
    }

    /**
     * @return the con
     */
    public Connection getCon() {
        return con;
    }

    public void BeginTran() {
        try {
            if (this.con != null) {
                con.setAutoCommit(false);
            }
        } catch (SQLException e) {
            Logger log = Logger.getLogger(this.getClass().getName());
            log.severe(e.getMessage());
        }
    }
    
    public void CommitTran() {
        try {
            if (this.con != null) {
                this.con.commit();
                con.setAutoCommit(true);
            }
        } catch (SQLException e) {
            Logger log = Logger.getLogger(this.getClass().getName());
            log.severe(e.getMessage());
        }
    }

    public void RollbackTran() {
        try {
            if (this.con != null) {
                this.con.rollback();
                con.setAutoCommit(true);
            }
        } catch (SQLException e) {
            Logger log = Logger.getLogger(this.getClass().getName());
            log.severe(e.getMessage());
        }
    }
    
}
