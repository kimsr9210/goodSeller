package hotsix.goodseller.file.model.service;

import java.sql.Connection;

import hotsix.goodseller.common.JDBCTemplate;
import hotsix.goodseller.file.model.dao.FileDAO;
import hotsix.goodseller.file.model.vo.FileData;

public class FileService {
	FileDAO fDAO = new FileDAO();

	public int insertFile(FileData fd) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = fDAO.insertFile(conn, fd);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		
		return result;
	}

}
