package eus.kozina.model.daoimpl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import eus.kozina.model.Conector;
import eus.kozina.model.bean.Alimento;
import eus.kozina.model.bean.Receta;
import eus.kozina.model.dao.RecetaModelo;

public class RecetaModeloImp extends Conector implements RecetaModelo {

	public RecetaModeloImp() {
		super();
	}

	@Override
	public ArrayList<Receta> selectAll() {
		ArrayList<Receta> recetas = new ArrayList<Receta>();

		try {
			Statement st = super.conexion.createStatement();
			ResultSet rs = st.executeQuery("select * from recetas");
			while (rs.next()) {
				 Receta receta = new Receta(rs.getString("nombre"));
				 receta.setId(rs.getInt("id"));
				 receta.setDescripcion(rs.getString("descripcion"));
				 receta.setElavoracion(rs.getString("elavoracion"));
				 
				 recetas.add(receta);
			}

		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		return recetas;
	}

	@Override
	public Receta selectReceta(int id) {
		try {
			PreparedStatement pst = this.conexion.prepareStatement("select * from recetas where id=?");
			pst.setInt(1, id);
			ResultSet rs = pst.executeQuery();
			
			if(rs.next()) {
				Receta receta = new Receta(rs.getString("nombre"));
				receta.setId(rs.getInt("id"));
				receta.setDescripcion(rs.getString("descripcion"));
				receta.setElavoracion(rs.getString("elavoracion"));
				return receta;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		return null;
	}

	@Override
	public boolean delete(int id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean update(Receta receta) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public ArrayList<Receta> selectRecetas(int id_ingrediente) {
		ArrayList<Receta> recetas = new ArrayList<Receta>();

		try {
			PreparedStatement pst = this.conexion.prepareStatement("select recetas.* from ingredientes join recetas on ingredientes.id_receta = recetas.id where ingredientes.id_alimento = ?");
			pst.setInt(1, id_ingrediente);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				 Receta receta = new Receta(rs.getString("nombre"));
				 receta.setId(rs.getInt("id"));
				 receta.setDescripcion(rs.getString("descripcion"));
				 receta.setElavoracion(rs.getString("elavoracion"));
				 
				 recetas.add(receta);
			}

		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		return recetas;
	}

}
