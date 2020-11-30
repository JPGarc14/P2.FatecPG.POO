package p1.poo.fatecpg.ads.noite;
import java.util.ArrayList;
import web.DBListener;
public class Disciplinas {
    private ArrayList<Disciplinas> disciplinas = new ArrayList<>();
    private String nome;
    private String ementa;
    private int ciclo;
    private float nota;

    public Disciplinas(String nome, String ementa, int ciclo, float nota) {
        this.nome = nome;
        this.ementa = ementa;
        this.ciclo = ciclo;
        this.nota = nota;
    }

    public static ArrayList<Disciplinas> getList() throws Exception{
        ArrayList<Disciplinas> list = new ArrayList<>();
        Connection con = null; Statement stmt = null; ResultSet rs = null;
        Exception methodException = null;
        try{
            con = DBListener.getConnection();
            stmt = con.createStatement();
            rs = stmt.executeQuery ("SELECT * FROM disciplinas;");
            while(rs.next()){
            list.add(new Disciplinas(
            rs.getString("nome"),
            rs.getString("ementa"),
            rs.getInt("ciclo"),
            rs.getDouble("nota")
            ));
            }
        }catch (Exception ex) {
        }finally {
            try{stmt.close();}catch(Exception ex2){}
            try{con.close();}catch(Exception ex2){}
            try{rs.close();}catch(Exception ex2){}
        }
        if (methodException != null)throw methodException;
        return list;
        }
    public static void Insert(String nome, String ementa, int ciclo, double nota) throws Exception{
        Connection con = null; Statement stmt = null; ResultSet rs = null;
        Exception methodException = null;
        try{
            con = DBListener.getConnection();
            stmt = con.prepareStatement("INSERT INTPO disciplinas VALUES (?, ?, ?, ?);");
            stmt.setString (1, nome);
            stmt.setString (2, ementa);
            stmt.setInt (3, ciclo);
            stmt.setDouble (4, nota);
            stmt.execute();
           
        }catch (Exception ex) {
        }finally{
            try{stmt.close();}catch(Exception ex2){}
            try{con.close();}catch(Exception ex2){}
            try{rs.close();}catch(Exception ex2){}
        }
        if (methodException != null) throw methodException;
    }
    
        public static void Update(String nomeOld, String nome, String ementa, int ciclo, double nota) throws Exception{
        Connection con = null; Statement stmt = null; ResultSet rs = null;
        Exception methodException = null;
        try{
            con = DBListener.getConnection();
            stmt = con.prepareStatement("UPDATE disciplinas SET nome=?, SET ementa=?, SET ciclo=?, SET nota=? WHERE nome=?;");
            stmt.setString (1, nome);
            stmt.setString (2, ementa);
            stmt.setInt (3, ciclo);
            stmt.setDouble (4, nota);
            stmt.setString (5, nomeOld);
            stmt.execute();
           
        }catch (Exception ex) {
        }finally{
            try{stmt.close();}catch(Exception ex2){}
            try{con.close();}catch(Exception ex2){}
            try{rs.close();}catch(Exception ex2){}
        }
        if (methodException != null) throw methodException;
    }
    
        public static void Delete(String nome) throws Exception{
        Connection con = null; Statement stmt = null; ResultSet rs = null;
        Exception methodException = null;
        try{
            con = DBListener.getConnection();
            stmt = con.prepareStatement("DELETE FROM disciplinas WHERE nome=?;");
            stmt.setString (1, nome);
            stmt.execute();
           
        }catch (Exception ex) {
        }finally{
            try{stmt.close();}catch(Exception ex2){}
            try{con.close();}catch(Exception ex2){}
            try{rs.close();}catch(Exception ex2){}
        }
        if (methodException != null) throw methodException;
    }
 
    public float getNota() {
        return nota;
    }

    public void setNota(float nota) {
        this.nota = nota;
    }

    public ArrayList<Disciplinas> getDisciplinas() {
        return disciplinas;
    }

    public void setDisciplinas(ArrayList<Disciplinas> disciplinas) {
        this.disciplinas = disciplinas;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getEmenta() {
        return ementa;
    }

    public void setEmenta(String ementa) {
        this.ementa = ementa;
    }

    public int getCiclo() {
        return ciclo;
    }

    public void setCiclo(int ciclo) {
        this.ciclo = ciclo;
    }

    public static String getCreateStatement(){
        return "CREATE TABLE IF NOT EXISTS disciplinas("
                + "nome VARCHAR (200) PRIMARY KEY,"
                + "ementa VARCHAR (200) NOT NULL,"
                + "ciclo NUMBER (2) NOT NULL,"
                + "nota NUMBER (2,2) NOT NULL,"
                + ");";
                
    }
    
    