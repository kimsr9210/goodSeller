package hotsix.goodseller.user.file.model.service;

import java.sql.Connection;

import hotsix.goodseller.common.JDBCTemplate;
import hotsix.goodseller.user.file.model.dao.FileDAO;
import hotsix.goodseller.user.file.model.vo.FileData;

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
