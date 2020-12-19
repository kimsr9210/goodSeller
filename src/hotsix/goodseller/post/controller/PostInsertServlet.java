package hotsix.goodseller.post.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import hotsix.goodseller.file.model.service.FileService;
import hotsix.goodseller.file.model.vo.FileData;
import hotsix.goodseller.member.model.vo.Member;
import hotsix.goodseller.post.model.service.PostService;

/**
 * Servlet implementation class PostInsertServlet
 */
@WebServlet("/postInsert.do")
public class PostInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PostInsertServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		// 작성자
		HttpSession session = request.getSession();
		Member m = (Member)session.getAttribute("member");
		String userId = m.getUserId();
		
		FileData fd = null;
		//-----------------------파일 업로드---------------------------
		String uploadPath = "/resources/file/";
		ServletContext context = request.getServletContext();
		String realUploadPath = context.getRealPath(uploadPath);
		int uploadFileSizeLimit = 10 * 1024 * 1024; // 10MB
		String encType = "UTF-8";
		MultipartRequest multi = new MultipartRequest(request, realUploadPath, uploadFileSizeLimit, encType,
				new DefaultFileRenamePolicy());
		
		// 메인 사진 업로드---------------------------------------------------------------------
		String mainOriginalFileName = multi.getFilesystemName("mainImg");
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS"); // 포멧만들기
		long currentTime = Calendar.getInstance().getTimeInMillis(); // 시간값 가져오기
		Timestamp mainUploadTime = Timestamp.valueOf(formatter.format(currentTime));
		File file = new File(realUploadPath + "\\" + mainOriginalFileName);
		// File 객체가 가지고 있는 renameTo 메소드를 통해서 파일의 이름을 바꿀 수 있음
		file.renameTo(new File(realUploadPath + "\\" + currentTime + "_gs"));
		String mainChangedFileName = currentTime + "_gs";
		// file 객체를 통해 파일 이름이 변경되면 새롭게 연결하는 파일 객체가 필요함
		File reNameFile = new File(realUploadPath + "\\" + mainChangedFileName);
		String mainFilePath = reNameFile.getPath();

		// 해당 업로드된 file의 사이즈
		long mainFileSize = reNameFile.length();

//		// 여기까지가 DB에 들어갈 값 셋팅
//		System.out.println();
//		 System.out.println("메인 파일 이름 (원본) : " + mainOriginalFileName);
//		 System.out.println("메인 파일 이름 (변경) : " + mainChangedFileName);
//		 System.out.println("메인 파일 경로 : " + mainFilePath);
//		 System.out.println("메인 파일 사이즈 : " + mainFileSize);
//		 System.out.println("메인 업로드 유저 : " + userId);
//		 System.out.println("메인 업로드 시간 : " + mainUploadTime);

		if(mainOriginalFileName!=null) {
			fd = new FileData();
			fd.setOriginalFileName(mainOriginalFileName);
			fd.setChangedFileName(mainChangedFileName);
			fd.setFilePath(mainFilePath);
			fd.setFileSize(mainFileSize);
			fd.setFileUser(userId);
			fd.setUploadTime(mainUploadTime);
			// 비지니스 로직
			new FileService().insertFile(fd);
		} else {
			mainChangedFileName = null;
		}
		
		
		// 서브 사진 업로드1---------------------------------------------------------------------
		String subOriginalFileName_1 = multi.getFilesystemName("subImg_1");
		currentTime = Calendar.getInstance().getTimeInMillis(); // 시간값 가져오기
		Timestamp subUploadTime_1 = Timestamp.valueOf(formatter.format(currentTime));
		file = new File(realUploadPath + "\\" + subOriginalFileName_1);
		// File 객체가 가지고 있는 renameTo 메소드를 통해서 파일의 이름을 바꿀 수 있음
		file.renameTo(new File(realUploadPath + "\\" + currentTime + "_gs_1"));
		String subChangedFileName_1 = currentTime + "_gs_1";
		// file 객체를 통해 파일 이름이 변경되면 새롭게 연결하는 파일 객체가 필요함
		reNameFile = new File(realUploadPath + "\\" + subChangedFileName_1);
		String subFilePath_1 = reNameFile.getPath();
		// 해당 업로드된 file의 사이즈
		long subFileSize_1 = reNameFile.length();
		
		// 여기까지가 DB에 들어갈 값 셋팅
//		System.out.println();
//		 System.out.println("서브 파일 이름 (원본) : " + subOriginalFileName_1);
//		 System.out.println("서브 파일 이름 (변경) : " + subChangedFileName_1);
//		 System.out.println("서브 파일 경로 : " + subFilePath_1);
//		 System.out.println("서브 파일 사이즈 : " + subFileSize_1);
//		 System.out.println("서브 업로드 유저 : " + userId);
//		 System.out.println("서브 업로드 시간 : " + subUploadTime_1);
		
		if(subOriginalFileName_1!=null) {
			fd = new FileData();
			fd.setOriginalFileName(subOriginalFileName_1);
			fd.setChangedFileName(subChangedFileName_1);
			fd.setFilePath(subFilePath_1);
			fd.setFileSize(subFileSize_1);
			fd.setFileUser(userId);
			fd.setUploadTime(subUploadTime_1);
			// 비지니스 로직
			new FileService().insertFile(fd);
		} else {
			subChangedFileName_1 = null;
		}
		
		
		
		// 서브 사진 업로드2---------------------------------------------------------------------
		String subOriginalFileName_2 = multi.getFilesystemName("subImg_2");
		currentTime = Calendar.getInstance().getTimeInMillis(); // 시간값 가져오기
		Timestamp subUploadTime_2 = Timestamp.valueOf(formatter.format(currentTime));
		file = new File(realUploadPath + "\\" + subOriginalFileName_2);
		// File 객체가 가지고 있는 renameTo 메소드를 통해서 파일의 이름을 바꿀 수 있음
		file.renameTo(new File(realUploadPath + "\\" + currentTime + "_gs_2"));
		String subChangedFileName_2 = currentTime + "_gs_2";
		// file 객체를 통해 파일 이름이 변경되면 새롭게 연결하는 파일 객체가 필요함
		reNameFile = new File(realUploadPath + "\\" + subChangedFileName_2);
		String subFilePath_2 = reNameFile.getPath();
		// 해당 업로드된 file의 사이즈
		long subFileSize_2 = reNameFile.length();
			
		// 여기까지가 DB에 들어갈 값 셋팅
//		System.out.println();
//		System.out.println("서브 파일 이름 (원본) : " + subOriginalFileName_2);
//		System.out.println("서브 파일 이름 (변경) : " + subChangedFileName_2);
//		System.out.println("서브 파일 경로 : " + subFilePath_2);
//		System.out.println("서브 파일 사이즈 : " + subFileSize_2);
//		System.out.println("서브 업로드 유저 : " + userId);
//		System.out.println("서브 업로드 시간 : " + subUploadTime_2);
		
		if(subOriginalFileName_2!=null) {
			fd = new FileData();
			fd.setOriginalFileName(subOriginalFileName_2);
			fd.setChangedFileName(subChangedFileName_2);
			fd.setFilePath(subFilePath_2);
			fd.setFileSize(subFileSize_2);
			fd.setFileUser(userId);
			fd.setUploadTime(subUploadTime_2);
			// 비지니스 로직
			new FileService().insertFile(fd);
		} else {
			subChangedFileName_2 = null;
		}
		
		// 서브 사진 업로드3---------------------------------------------------------------------
		String subOriginalFileName_3 = multi.getFilesystemName("subImg_3");
		currentTime = Calendar.getInstance().getTimeInMillis(); // 시간값 가져오기
		Timestamp subUploadTime_3 = Timestamp.valueOf(formatter.format(currentTime));
		file = new File(realUploadPath + "\\" + subOriginalFileName_3);
		// File 객체가 가지고 있는 renameTo 메소드를 통해서 파일의 이름을 바꿀 수 있음
		file.renameTo(new File(realUploadPath + "\\" + currentTime + "_gs_3"));
		String subChangedFileName_3 = currentTime + "_gs_3";
		// file 객체를 통해 파일 이름이 변경되면 새롭게 연결하는 파일 객체가 필요함
		reNameFile = new File(realUploadPath + "\\" + subChangedFileName_3);
		String subFilePath_3 = reNameFile.getPath();
		// 해당 업로드된 file의 사이즈
		long subFileSize_3 = reNameFile.length();
			
		// 여기까지가 DB에 들어갈 값 셋팅
//		System.out.println();
//		System.out.println("서브 파일 이름 (원본) : " + subOriginalFileName_3);
//		System.out.println("서브 파일 이름 (변경) : " + subChangedFileName_3);
//		System.out.println("서브 파일 경로 : " + subFilePath_3);
//		System.out.println("서브 파일 사이즈 : " + subFileSize_3);
//		System.out.println("서브 업로드 유저 : " + userId);
//		System.out.println("서브 업로드 시간 : " + subUploadTime_3);
		
		
		if(subOriginalFileName_3!=null) {
			fd = new FileData();
			fd.setOriginalFileName(subOriginalFileName_3);
			fd.setChangedFileName(subChangedFileName_3);
			fd.setFilePath(subFilePath_3);
			fd.setFileSize(subFileSize_3);
			fd.setFileUser(userId);
			fd.setUploadTime(subUploadTime_3);
			// 비지니스 로직
			new FileService().insertFile(fd);
		} else {
			subChangedFileName_3 = null;
		}
		
		
		// 서브 사진 업로드4---------------------------------------------------------------------
		String subOriginalFileName_4 = multi.getFilesystemName("subImg_4");
		currentTime = Calendar.getInstance().getTimeInMillis(); // 시간값 가져오기
		Timestamp subUploadTime_4 = Timestamp.valueOf(formatter.format(currentTime));
		file = new File(realUploadPath + "\\" + subOriginalFileName_4);
		// File 객체가 가지고 있는 renameTo 메소드를 통해서 파일의 이름을 바꿀 수 있음
		file.renameTo(new File(realUploadPath + "\\" + currentTime + "_gs_4"));
		String subChangedFileName_4 = currentTime + "_gs_4";
		// file 객체를 통해 파일 이름이 변경되면 새롭게 연결하는 파일 객체가 필요함
		reNameFile = new File(realUploadPath + "\\" + subChangedFileName_4);
		String subFilePath_4 = reNameFile.getPath();
		// 해당 업로드된 file의 사이즈
		long subFileSize_4 = reNameFile.length();
			
		// 여기까지가 DB에 들어갈 값 셋팅
//		System.out.println();
//		System.out.println("서브 파일 이름 (원본) : " + subOriginalFileName_4);
//		System.out.println("서브 파일 이름 (변경) : " + subChangedFileName_4);
//		System.out.println("서브 파일 경로 : " + subFilePath_4);
//		System.out.println("서브 파일 사이즈 : " + subFileSize_4);
//		System.out.println("서브 업로드 유저 : " + userId);
//		System.out.println("서브 업로드 시간 : " + subUploadTime_4);
		
		if(subOriginalFileName_4!=null) {
			fd = new FileData();
			fd.setOriginalFileName(subOriginalFileName_4);
			fd.setChangedFileName(subChangedFileName_4);
			fd.setFilePath(subFilePath_4);
			fd.setFileSize(subFileSize_4);
			fd.setFileUser(userId);
			fd.setUploadTime(subUploadTime_4);
			// 비지니스 로직
			new FileService().insertFile(fd);
		} else {
			subChangedFileName_4 = null;
		}
		
		
		
		
		//-----------------------파일 업로드---------------------------
		
		
		// 받은 값들
		String subject = multi.getParameter("subject");
		String content = multi.getParameter("content");
		String endDate = multi.getParameter("endDate");
		
		//이미지 사진들 있음
		
		// 시작 금액
		String startPrice = multi.getParameter("startPrice");
		// 즉시 구매 금액
		String buyPrice = multi.getParameter("buyPrice");
		// 거래 방식
		String sellMethod = multi.getParameter("sellMethod");
		// 메인 카테고리
		String mainCategory = multi.getParameter("mainCategory");
		// 상세 카테고리
		String subCategory = multi.getParameter("subCategory");
		
		// 금액 형 변환
		String[] arr = startPrice.split(",");
		startPrice = arr[0];
		for(int i=1;i<arr.length;i++) {
			startPrice += arr[i];
		}
		int sPrice = Integer.parseInt(startPrice);
		
		String[] arr1 = buyPrice.split(",");
		buyPrice = arr1[0];
		for(int i=1;i<arr.length;i++) {
			buyPrice += arr1[i];
		}
		int bPrice = Integer.parseInt(buyPrice);
		
//		
//		System.out.println("작성자 : " + userId);
//		System.out.println("제목 : " + subject);
//		System.out.println("내용 : " + content);
//		System.out.println("종료날짜 : " + endDate);
//		System.out.println("시작금액 : " + sPrice);
//		System.out.println("즉시구매금액 : " + bPrice);
//		System.out.println("거래방식 : " + sellMethod);
//		System.out.println("메인카테고리 : " + mainCategory);
//		System.out.println("상세카테고리 : " + subCategory);
//		System.out.println("메인 사진 이름 : " + mainChangedFileName);
//		System.out.println("서브 사진 이름 : " + subChangedFileName_1);
//		System.out.println("서브 사진 이름 : " + subChangedFileName_2);
//		System.out.println("서브 사진 이름 : " + subChangedFileName_3);
//		System.out.println("서브 사진 이름 : " + subChangedFileName_4);
		
		// 비지니스 로직
		int result = new PostService().insertPost(userId, subject, content, endDate, sPrice, bPrice, sellMethod,
				mainCategory, subCategory, mainChangedFileName,subChangedFileName_1,subChangedFileName_2,subChangedFileName_3,subChangedFileName_4);
		
		RequestDispatcher view = request.getRequestDispatcher("/views/auction/auctionInsertResult.jsp");
		if (result > 0) {
			request.setAttribute("result", true); // 성공시 true 값을 전달
			request.setAttribute("category", mainCategory);
		} else {
			// 비지니스 로직 처리시 실패했다면 파일도 삭제를 해주어야 한다.
			reNameFile.delete(); // 해당 파일을 삭제
			request.setAttribute("result", false); // 실패시 false 값을 전달
		}
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
