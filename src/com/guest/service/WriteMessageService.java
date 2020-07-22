package com.guest.service;

import java.sql.Connection;

import com.guest.dao.MessageDao;
import com.guest.jdbc.ConnectionProvider;
import com.guest.jdbc.JdbcUtil;
import com.guest.model.Message;

public class WriteMessageService {
	
private static WriteMessageService instance = new WriteMessageService();
	
	public static WriteMessageService getInstance() {
		return instance;
	}
	
	private WriteMessageService() {	
	}
	
	public void write(Message message) {
		if (message.getGuestName() == null || message.getGuestName().isEmpty()) {
			throw new IllegalArgumentException("invalid guest name");
		} else if (message.getPassword() == null || message.getPassword().isEmpty()) {
			throw new IllegalArgumentException("암호가 지정되어 있지 않음");
		}
		
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			MessageDao messageDao = MessageDao.getInstance();
			messageDao.insert(conn, message);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
		}
	}

}
