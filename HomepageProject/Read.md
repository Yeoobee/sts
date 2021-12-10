1. 회원가입, 게시판, 댓글 정보를 담을 테이블 생성
 - create table member_table(
		m_number bigint auto_increment,
        m_id varchar(20),
        m_password varchar(20),
        m_name varchar(10),
        m_email varchar(20),
        m_phone varchar(20),
        m_filename varchar(100),
        constraint primary key(m_number)); // 회원 테이블

 - create table boardH_table(
    b_number bigint auto_increment,
    b_title varchar(50),
	m_id varchar(20),
	b_contents varchar(1000),
	b_hits int default 0,
	b_date datetime,
	b_filename varchar(100),
    constraint primary key(b_number)); // 게시판 테이블
	
 - create table commentH_table(
	c_number bigint auto_increment,
    b_number bigint,
    m_id varchar(20),
    c_contents varchar(200),
    c_date datetime,
    constraint primary key(c_number),
    constraint foreign key(b_number) references boardH_table(b_number)); // 댓글 테이블
        
2. 패키지, 클래스들 생성 (HomepageDTO, HompageController, Service, Repository, mapper.xml)
3. web.xml, root-context.xml 세팅(mybatis-config까지)
4. 서버에서 경로 "/" 로 수정해주기
6. 회원가입 기능 구현
 - index.jsp에서 회원가입 링크설정(signup) - 컨트롤러에서 회원가입 페이지 여는 메서드 작성 - signup.jsp 생성 - 회원가입 기능 설정( controller - service - repository - mapper)
---------------------------------------------------------------------------------------------
@Service 클래스에서 signup 작성시 파일저장을 위한 코드
 public void signup(HomepageDTO homepage) throws IllegalStateException, IOException {
		// dto에 담긴 파일을 가져옴 
				MultipartFile m_file = homepage.getM_file();
				// 파일 이름을 가져옴(파일이름을 DB에 저장하기 위해)
				String m_filename = m_file.getOriginalFilename();
				// 파일명 중복을 피하기 위해 파일이름앞에 현재 시간값을 붙임. 
				m_filename = System.currentTimeMillis() + "-" + m_filename;
				System.out.println("b_filename: " + m_filename);
				// 파일 저장 경로 세팅 
				String savePath = "D:\\development\\source\\spring\\HomepageProject\\src\\main\\webapp\\resources\\upload\\"+m_filename;
				// bfile이 비어있지 않다면(즉 파일이 있으면) savePath에 저장을 하겠다.
				if(!m_file.isEmpty()) {
					m_file.transferTo(new File(savePath));
				}
				// 여기까지의 내용은 파일을 저장하는 과정 
				
				// DB에 저장하기 위해 dto에 파일이름을 담는다.
				homepage.setM_filename(m_filename);

				hr.signup(homepage);
		
	}
-----------------------------------------------------------------------------
7. 회원가입시 아이디 중복확인을 위한 코드 작성
------------------------------------------------------------------------------
// 가입할때 작성하는 DB가 없다면 OK(회원가입진행) DB가 있다면 NO(회원가입 불가능) 
public String idDuplicate(String m_id) {
		String result = hr.idDuplicate(m_id);
		if(result == null) {
			return "ok"; 
		}else {
			return "no"; 
	}
	--------------------------------------------------------------------
7. 로그인 기능 구현
 - index.jsp에서 로그인 링크설정(signup) - 회원가입시 만든 회원의 DB의 아이디와 비밀번호가 일치할시 로그인이 되도록 구현 - BoardService에서 로그인된 아이디와 회원 번호를 session에 저장
8. 로그아웃 기능 - HttpSession을 사용하여 저장된 session 아이디를 해제 (session.invalidate())
9. 로그인 후 게시글 작성기능 구현
10. 게시글 리스트들을 페이징해서 보여지도록 설정
----------------------------------------------------------------------
@Service
private static final int PAGE_LIMIT = 5; 
	private static final int BLOCK_LIMIT = 3; 

	@Override
	public List<BoardDTO> pagingList(int page) {
		int pagingStart = (page-1) * PAGE_LIMIT;
		Map<String, Integer> pagingParam = new HashMap<String, Integer>();
		pagingParam.put("start", pagingStart);
		pagingParam.put("limit", PAGE_LIMIT);
		List<BoardDTO> pagingList = br.pagingList(pagingParam);
		for(BoardDTO b: pagingList) {
			System.out.println(b.toString());
		}
		return pagingList;
	}

	@Override
	public PageDTO paging(int page) {
		int boardCount = br.boardCount(); 
		int maxPage = (int)(Math.ceil((double)boardCount / PAGE_LIMIT)); 
		int startPage = (((int)(Math.ceil((double)page / BLOCK_LIMIT))) - 1) * BLOCK_LIMIT + 1;
		int endPage = startPage + BLOCK_LIMIT - 1;
		if(endPage > maxPage)
			endPage = maxPage; 
		PageDTO paging = new PageDTO();
		paging.setPage(page);
		paging.setStartPage(startPage);
		paging.setEndPage(endPage);
		paging.setMaxPage(maxPage);
		
		System.out.println("paging.toString(): "+ paging.toString());
		
		return paging;
	}
	------------------------------------------------------------------------------
11. 게시판 글들을 로그인한 사람들이 수정 , 삭제 할 수 있도록 설정(관리자는 전부 삭제 가능하도록) <c:if test = "조건"></c:if>
13. 관리자로 로그인하면 회원목록 보여주도록 링크설정<c:if test = "조건"></c:if>
14. 회원목록을 들어가면 회원 리스트와 삭제할수 있는 기능 구현
15. 게시판 리스트 검색기능 추가. (mapper에서의 검색조건코드 작성)
- <choose>
			<when test="type=='b_title'">
				where b_title like concat('%', #{word}, '%') 
			</when>
			<when test="type=='m_id'">
				where m_id like concat('%', #{word}, '%') 
			</when>
		</choose>
  // 검색을 한 결과물도 페이징처리돼서 보여주도록 하고 싶었으나 실패.. 계속 코드를 짜 볼 예정
17. detail.jsp에 댓글폼 생성. + 스크립트까지 (ajax)
18. comment 클래스(Controller, Service, Repository, mapper.xml) 생성
19. 회정정보를 수정할 수 있는 마이페이지 링크 생성
 - 아이디는, 이름은 readonly로 변경 불가능하도록 설정 뒤 비밀번호가 일치한지 체크를 통하여 수정 가능하도록 함.
 
 20. 이번에 만든 기능들을 일전에 만들어둔 포트폴리오에 적용시킬 예정