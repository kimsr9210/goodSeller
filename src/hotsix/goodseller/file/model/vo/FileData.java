package hotsix.goodseller.file.model.vo;

import java.sql.Timestamp;

public class FileData {
	private int fileNo;
	private int postNo;
	private String originalFileName;
	private String changedFileName;
	private String filePath;
	private long fileSize; // int 타입은 짧다 (int = 2^32), (long = 2^64)
	private String fileUser;
	private Timestamp uploadTime;
	private char del_yn;
	public FileData() {
		super();
		// TODO Auto-generated constructor stub
	}
	public FileData(int fileNo, int postNo, String originalFileName, String changedFileName, String filePath,
			long fileSize, String fileUser, Timestamp uploadTime, char del_yn) {
		super();
		this.fileNo = fileNo;
		this.postNo = postNo;
		this.originalFileName = originalFileName;
		this.changedFileName = changedFileName;
		this.filePath = filePath;
		this.fileSize = fileSize;
		this.fileUser = fileUser;
		this.uploadTime = uploadTime;
		this.del_yn = del_yn;
	}
	
	
	public int getFileNo() {
		return fileNo;
	}
	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}
	public int getPostNo() {
		return postNo;
	}
	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}
	public String getOriginalFileName() {
		return originalFileName;
	}
	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}
	public String getChangedFileName() {
		return changedFileName;
	}
	public void setChangedFileName(String changedFileName) {
		this.changedFileName = changedFileName;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public long getFileSize() {
		return fileSize;
	}
	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}
	public String getFileUser() {
		return fileUser;
	}
	public void setFileUser(String fileUser) {
		this.fileUser = fileUser;
	}
	public Timestamp getUploadTime() {
		return uploadTime;
	}
	public void setUploadTime(Timestamp uploadTime) {
		this.uploadTime = uploadTime;
	}
	public char getDel_yn() {
		return del_yn;
	}
	public void setDel_yn(char del_yn) {
		this.del_yn = del_yn;
	}
	@Override
	public String toString() {
		return "FileData [fileNo=" + fileNo + ", postNo=" + postNo + ", originalFileName=" + originalFileName
				+ ", changedFileName=" + changedFileName + ", filePath=" + filePath + ", fileSize=" + fileSize
				+ ", fileUser=" + fileUser + ", uploadTime=" + uploadTime + ", del_yn=" + del_yn + "]";
	}
	
	
}
