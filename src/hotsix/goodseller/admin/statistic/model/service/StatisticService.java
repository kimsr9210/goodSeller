package hotsix.goodseller.admin.statistic.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import hotsix.goodseller.admin.statistic.model.dao.StatisticDAO;
import hotsix.goodseller.common.JDBCTemplate;

public class StatisticService {
	public ArrayList incomeMonthSelect() {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList list = new StatisticDAO().incomeMonthSelect(conn);
		return list;
	}

	public ArrayList signUpMonthly() {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList list = new StatisticDAO().signUpMonthly(conn);
		return list;
	}

}
