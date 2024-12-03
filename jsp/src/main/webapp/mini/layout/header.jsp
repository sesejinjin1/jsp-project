<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="header">
    <header>
        <h1><a href="../main/main.jsp" class="active"><span>체육센터</span></a></h1>
        <p class="slogan">
            체육센터 홈페이지에 오신것을 환영합니다.</p>
        <div id="GNB">
            <aside class="top">
                <div class="align_box">
                    <nav>
                        <ul>
                        	<% if((String)session.getAttribute("userId") != null){ %>
                        	<li><a class="session"><span> <%=(String)session.getAttribute("userId") %> 님 환영합니다.</span><a></li>
                        	<li><a href="../user/logoutAction.jsp">로그아웃</a></li>
                        	<li><a href="../user/userlist.jsp"><span>회원관리</span></a></li>
                        	<%} else{ %>
                            <li><a id="process_login" class="login proc_add_referer_" href="../user/login.jsp"><span>로그인</span></a></li>
                            <li><a class="join" href="../user/join.jsp"><span>회원가입</span></a></li>
                            <li><a class="sitemap" href="#"><span>사이트맵</span></a></li>
                            <%} %>
                        </ul>
                    </nav>
                </div>
            </aside>
            <div id="topmenu">
                <nav>
                    <button type="button" class="show_all_menu">전체메뉴보기</button>
                    <ul id="menu_topmenu" class="menu_topmenu ld1">
                        <li class="cd1 cd1c2 hasChild childCount10">
                            <a href="#" id="topmenu_id_2" class="l1 menusrl_4 menutype_move_child hasChild childCount10" data-depth="1">
                                <span>센터소개</span>
                            </a>
                        </li>
                        <li class="cd1 cd1c3 hasChild childCount4">
                            <a href="#" id="topmenu_id_13" class="l1 menusrl_2 menutype_move_child hasChild childCount4" data-depth="1">
                                <span>프로그램안내/강좌신청</span>
                            </a>
                        </li>
                        <li class="cd1 cd1c4 hasChild childCount3">
                            <a href="#" id="topmenu_id_31" class="l1 menusrl_3 menutype_move_child hasChild childCount3" data-depth="1">
                                <span>대관안내/신청</span>
                            </a>
                        </li>
                        <li class="cd1 cd1c5 hasChild childCount2">
                            <a href="#" id="topmenu_id_39" class="l1 menusrl_5 menutype_move_child hasChild childCount2" data-depth="1">
                                <span>참여/공간</span>
                            </a>
                        </li>
                        <li class="cd1 cd1c6 hasChild childCount3">
                            <a href="#" id="topmenu_id_44" class="l1 menusrl_6 menutype_move_child hasChild childCount3" data-depth="1">
                                <span>마이페이지</span>
                            </a>
                        </li>
                    </ul>
                </nav>
                
            </div>
        </div>
    </header>
</div>