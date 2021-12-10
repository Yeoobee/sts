<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
  <style>
        @import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding&display=swap');
    </style>

    <style>
        @import url('https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Gugi&family=Nanum+Gothic+Coding:wght@700&display=swap');
    </style>

    <style>
        body {
            height: 3000px;
        }

        header {
            background-color: #212529;
        }

        section {
            background-color: white;
        }

        #skills {
            background-color: white;
        }

        #projects {
            background-color: white;
        }

        footer {
            background-color: rgb(182, 165, 199);
        }

        .vl {
            border-left: 6px solid rgba(0, 0, 0, 0.171);
            height: 500px;
        }
    </style>
</head>
<body>
    <!-- semantic tag -->
    <!-- 메뉴영역 -->
    <header>
        <!-- py-3: 패딩을 y축으로 위아래 3px씩 -->
        <div class="container d-flex align-items-center py-3">
            <ul class="nav flex-grow-1">
                <li class="nav-item">
                    <a href="#Aboutme" class="nav-link text-light">About me</a>
                </li>
                <li class="nav-item">
                    <a href="#Skills" class="nav-link text-light">Skills</a>
                </li>
                <li class="nav-item">
                    <!-- 해당 페이지 내에서 특정 영역으로 이동할 때. href 속성값에 id 값을 주면 해당 영역으로 스크롤이동됨 -->
                    <a href="#projects" class="nav-link text-light">Projects</a>
                </li>
                <li>
                    <a href="#" class="nav-link text-light">Contact</a>
                </li>
            </ul>
            <div class="d-flex">
                <input type="text" class="form-control" placeholder="Search">
                <button class="btn btn-link text-light text-decoration-none flex-shrink-0"
                    onclick="location.href='members/login'">Sign in</button>
                <button class="btn btn-outline-light flex-shrink-0" onclick="location.href='members/signup'">Sign
                    up</button>

            </div>
            <!-- data-bs-target="#offcanvas": offcanvas에서 보여줄 내용(id)가 offcanvas로 지정된 요소를 보여주겠다. -->
            <button class="btn" data-bs-toggle="offcanvas" data-bs-target="#offcanvas">
                <img src="../menu.svg" alt="">
            </button>
            <!-- offcanvas로 보여줄 내용 -->
            <div class="offcanvas offcanvas-end" id="offcanvas">
                <div class="offcanvas-header">
                    <button class="btn-close" data-bs-dismiss="offcanvas"></button>
                </div>
                <div class="offcanvas-body">
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item">About me</li>
                        <li class="list-group-item">Skills</li>
                        <li class="list-group-item">Projects</li>
                        <li class="list-group-item">Contact</li>
                    </ul>
                    <input type="text" class="form-control mb-2" placeholder="Search">
                    <!-- d-grid: 해당 요소를 한줄에 채워서 표시할 수 있음. -->
                    <div class="d-grid mb-2">
                        <button class="btn btn-outline-primary">Sign in</button>
                    </div>
                    <div class="d-grid">
                        <button class="btn btn-primary">Sign up</button>
                    </div>
                </div>
            </div>
        </div>
    </header>

    <!-- 본문영역 -->
    <section id="intro">
        <div class="container-md text-center bg-white"
            style="border: 1px solid rgba(128, 128, 128, 0.609); margin-top: 50px;">
            <!-- <h3 class="pt-2" style="color: #212529; ">KIM JAE YEOP</h3> -->
            <img src="./이미지/gray-icon-vectors-g8b6b08281_1280.png" alt="" width="900px">
            <h3 style="color: #212529b0; font-family: 'Nanum Gothic Coding', monospace;">프로젝트 보러가기</h3>
            <a href="" class="btn btn-primary my-2">Github link</a>
        </div>
    </section>

    <section id="introduce">
        <h2 id="Aboutme" style="margin-top: 50px; text-align:center; color: #212529; font-family: 'Gugi', cursive;">
            <b>About me</b></h2>
        <div class="container bg-white mb-3 pt-3 pb-3" style="display: flex;">
            <div id="flex" class="col-4 text-left bg-white " style="width:300px;">
                <img src="../이미지/artificial-intelligence-g76d7d1322_1920.png" alt="" width="300px">
                <p class="pt-2" style="font-size: 15px;"><b>이름</b> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 김재엽</p>
                <p class="pt-2" style="font-size: 15px;"><b>생년월일</b>&nbsp;&nbsp;&nbsp;1993년 4월 7일</p>
                <p class="pt-2" style="font-size: 15px;">
                    <b>주소</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;인천광역시</p>
                <p class="pt-2" style="font-size: 15px;">
                    <b>이메일</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ppang407@naver.com</p>
                <p class="pt-2" style="font-size: 15px;"><b>연락처</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;010-8549-4723</p>
            </div>
            <div class="vl"></div>
            <div class="container">
                <div class="col-4 text-center bg-white " style="width:300px;">
                    <p class="pt-2"
                        style="font-size: 22px; color: #3e3f44; font-family: 'Nanum Gothic Coding', monospace;">
                        <b>경력</b></p>
                    <br><br><br><br>
                </div>
                <div class="col-4 text-center bg-white " style="width:300px;">
                    <p class="pt-2"
                        style="font-size: 22px; color: #3e3f44; font-family: 'Nanum Gothic Coding', monospace;">
                        <b>자격증</b></p>
                    <br><br><br><br>
                </div>
                <div class="col-4 text-center bg-white " style="width:300px;">
                    <p class="pt-2"
                        style="font-size: 22px; color: #3e3f44; font-family: 'Nanum Gothic Coding', monospace;">
                        <b>학력</b></p>
                    <br><br><br><br>
                </div>
            </div>
        </div>
    </section>

    <section id="skills">
        <div class="container bg-white mb-3 pt-3 pb-3">
            <div class="row text-center">
                <h2 id="Skills" style="margin-top: 50px; color: #212529; font-family: 'Gugi', cursive;"><b>Skills</b>
                </h2>
            </div>
            <div class="row">
                <div class="col-4 text-center" style="background-color: white;">
                    <div>
                        <h4>Programming Languege</h4>
                        <h5>java</h5>
                        <h5>javascript</h5>
                    </div>
                    <div>
                        <h4>Databases</h4>
                        <h5>mysql</h5>
                        <h5>mydatis</h5>
                        <h5>jpa</h5>
                    </div>
                </div>
                <div class="col-4 text-center">
                    <img src="../이미지/computer-g347a5bcae_1920.png" alt="" width="600px">
                </div>
                <div class="col-4 text-center" style="background-color: white;">
                    <div>
                        <h4>Frameworks</h4>
                        <h5>Spring Boot</h5>
                        <h5>Spring Framework</h5>
                    </div>
                    <div>
                        <h4>Tools</h4>
                        <h5>IntelliJ IDEA</h5>
                        <h5>Visual Studio Code</h5>
                        <h5>Eclipse</h5>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section id="projects">
        <div class="container text-center bg-white mb-3 py-3">
            <h2 id="Skills" style="margin-top: 50px; color: #212529; font-family: 'Gugi', cursive;"><b>Projects</b></h2>
            <div class="row">
                <div id="carouselExampleDark" class="carousel carousel-dark slide" data-bs-ride="carousel">
                    <div class="carousel-indicators">
                        <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="0" class="active"
                            aria-current="true" aria-label="Slide 1"></button>
                        <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="1"
                            aria-label="Slide 2"></button>
                        <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="2"
                            aria-label="Slide 3"></button>
                    </div>
                    <div class="carousel-inner">
                        <div class="carousel-item active" data-bs-interval="10000">
                            <img src="./이미지/signinup.PNG" alt="" width="700px">
                            <div class="carousel-caption d-none d-md-block">
                                <h5 style="font-family: 'Gugi', cursive;">Signup</h5>
                                <p style="font-family: 'Nanum Gothic Coding', monospace;"><b>개발기간: 2021.11.18-2021.11.19</b></p>
                            </div>
                        </div>
                        <div class="carousel-item" data-bs-interval="2000">
                            <img src="./이미지/xxx.jpg" alt="" width="700px">
                            <div class="carousel-caption d-none d-md-block">
                                <h5>Second slide label</h5>
                                <p>Some representative placeholder content for the second slide.</p>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <img src="./이미지/xxx.jpg" alt="" width="700px">
                            <div class="carousel-caption d-none d-md-block">
                                <h5>Third slide label</h5>
                                <p>Some representative placeholder content for the third slide.</p>
                            </div>
                        </div>
                    </div>
                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark"
                        data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark"
                        data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                </div>
            </div>
        </div>
        </div>

    </section>

    <!-- 푸터영역 -->
    <footer>
        <div class="container bg-light">
            <div class="d-flex flex-wrap justify-content-between align-items-center py-3 my-4 border-top">
                <div class="col-md-4 d-flex align-items-center">
                    <a href="/" class="mb-3 me-2 mb-md-0 text-muted text-decoration-none lh-1">
                        <svg class="bi" width="30" height="24">
                            <use xlink:href="#bootstrap" />
                        </svg>
                    </a>
                    <span class="text-muted">&copy; 2021 your name</span>
                </div>
                <ul class="nav col-md-4 justify-content-end list-unstyled d-flex">
                    <li class="ms-3"><a class="text-muted" href="#"><svg xmlns="http://www.w3.org/2000/svg" width="16"
                                height="16" fill="currentColor" class="bi bi-github" viewBox="0 0 16 16">
                                <path
                                    d="M8 0C3.58 0 0 3.58 0 8c0 3.54 2.29 6.53 5.47 7.59.4.07.55-.17.55-.38 0-.19-.01-.82-.01-1.49-2.01.37-2.53-.49-2.69-.94-.09-.23-.48-.94-.82-1.13-.28-.15-.68-.52-.01-.53.63-.01 1.08.58 1.23.82.72 1.21 1.87.87 2.33.66.07-.52.28-.87.51-1.07-1.78-.2-3.64-.89-3.64-3.95 0-.87.31-1.59.82-2.15-.08-.2-.36-1.02.08-2.12 0 0 .67-.21 2.2.82.64-.18 1.32-.27 2-.27.68 0 1.36.09 2 .27 1.53-1.04 2.2-.82 2.2-.82.44 1.1.16 1.92.08 2.12.51.56.82 1.27.82 2.15 0 3.07-1.87 3.75-3.65 3.95.29.25.54.73.54 1.48 0 1.07-.01 1.93-.01 2.2 0 .21.15.46.55.38A8.012 8.012 0 0 0 16 8c0-4.42-3.58-8-8-8z" />
                            </svg></a></li>
                    <li class="ms-3"><a class="text-muted" href="#"><svg xmlns="http://www.w3.org/2000/svg" width="16"
                                height="16" fill="currentColor" class="bi bi-instagram" viewBox="0 0 16 16">
                                <path
                                    d="M8 0C5.829 0 5.556.01 4.703.048 3.85.088 3.269.222 2.76.42a3.917 3.917 0 0 0-1.417.923A3.927 3.927 0 0 0 .42 2.76C.222 3.268.087 3.85.048 4.7.01 5.555 0 5.827 0 8.001c0 2.172.01 2.444.048 3.297.04.852.174 1.433.372 1.942.205.526.478.972.923 1.417.444.445.89.719 1.416.923.51.198 1.09.333 1.942.372C5.555 15.99 5.827 16 8 16s2.444-.01 3.298-.048c.851-.04 1.434-.174 1.943-.372a3.916 3.916 0 0 0 1.416-.923c.445-.445.718-.891.923-1.417.197-.509.332-1.09.372-1.942C15.99 10.445 16 10.173 16 8s-.01-2.445-.048-3.299c-.04-.851-.175-1.433-.372-1.941a3.926 3.926 0 0 0-.923-1.417A3.911 3.911 0 0 0 13.24.42c-.51-.198-1.092-.333-1.943-.372C10.443.01 10.172 0 7.998 0h.003zm-.717 1.442h.718c2.136 0 2.389.007 3.232.046.78.035 1.204.166 1.486.275.373.145.64.319.92.599.28.28.453.546.598.92.11.281.24.705.275 1.485.039.843.047 1.096.047 3.231s-.008 2.389-.047 3.232c-.035.78-.166 1.203-.275 1.485a2.47 2.47 0 0 1-.599.919c-.28.28-.546.453-.92.598-.28.11-.704.24-1.485.276-.843.038-1.096.047-3.232.047s-2.39-.009-3.233-.047c-.78-.036-1.203-.166-1.485-.276a2.478 2.478 0 0 1-.92-.598 2.48 2.48 0 0 1-.6-.92c-.109-.281-.24-.705-.275-1.485-.038-.843-.046-1.096-.046-3.233 0-2.136.008-2.388.046-3.231.036-.78.166-1.204.276-1.486.145-.373.319-.64.599-.92.28-.28.546-.453.92-.598.282-.11.705-.24 1.485-.276.738-.034 1.024-.044 2.515-.045v.002zm4.988 1.328a.96.96 0 1 0 0 1.92.96.96 0 0 0 0-1.92zm-4.27 1.122a4.109 4.109 0 1 0 0 8.217 4.109 4.109 0 0 0 0-8.217zm0 1.441a2.667 2.667 0 1 1 0 5.334 2.667 2.667 0 0 1 0-5.334z" />
                            </svg></a></li>
                    <li class="ms-3"><a class="text-muted" href="#"><svg xmlns="http://www.w3.org/2000/svg" width="16"
                                height="16" fill="currentColor" class="bi bi-house-door" viewBox="0 0 16 16">
                                <path
                                    d="M8.354 1.146a.5.5 0 0 0-.708 0l-6 6A.5.5 0 0 0 1.5 7.5v7a.5.5 0 0 0 .5.5h4.5a.5.5 0 0 0 .5-.5v-4h2v4a.5.5 0 0 0 .5.5H14a.5.5 0 0 0 .5-.5v-7a.5.5 0 0 0-.146-.354L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.354 1.146zM2.5 14V7.707l5.5-5.5 5.5 5.5V14H10v-4a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5v4H2.5z" />
                            </svg></a></li>
                </ul>
            </div>
        </div>



    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>
</html>