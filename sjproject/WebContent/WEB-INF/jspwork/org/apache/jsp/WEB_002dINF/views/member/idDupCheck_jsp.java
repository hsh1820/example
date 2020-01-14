/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.50
 * Generated at: 2020-01-13 08:35:50 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.views.member;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class idDupCheck_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    final java.lang.String _jspx_method = request.getMethod();
    if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET POST or HEAD");
      return;
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<title>아이디 중복 검사</title>\r\n");
      out.write("</head>\r\n");
      out.write("<!-- onload를 이용해 idValue() 실행 -->\r\n");
      out.write("<body onload=\"idValue();\"> <!-- 페이지 로딩이 다 된 다음 idValue() 실행 -->\r\n");
      out.write("\t<h4>아이디 중복 검사</h4>\r\n");
      out.write("\t<br>\r\n");
      out.write("\t<form action=\"");
      out.print( request.getContextPath() );
      out.write("/member/idDupCheck.do\" id=\"idChekcForm\" method=\"post\">\r\n");
      out.write("\t\t<input type=\"text\" id=\"id\" name=\"id\">\r\n");
      out.write("\t\t<input type=\"submit\" value=\"중복확인\">\r\n");
      out.write("\t</form>\r\n");
      out.write("\t<br>\r\n");
      out.write("\t\r\n");
      out.write("\t");
 
		if(request.getAttribute("result") != null){ 
			
			int result = (int)request.getAttribute("result");
			
			if(result > 0){
	
      out.write("\r\n");
      out.write("\t\t\t\t이미 사용중인 아이디입니다.\r\n");
      out.write("\t");

			} else{ 
	
      out.write("\r\n");
      out.write("\t\t\t\t사용 가능한 아이디입니다.\r\n");
      out.write("\t");

			}
		}
	
      out.write("\r\n");
      out.write("\t\r\n");
      out.write("\t<br>\r\n");
      out.write("\t<br>\r\n");
      out.write("\t\r\n");
      out.write("\t<input type=\"button\" id=\"cancel\" value=\"취소\" onclick=\"window.close();\">\r\n");
      out.write("\t<input type=\"button\" id=\"confirmId\" value=\"확인\" onclick=\"confirmId();\" disabled=\"disabled\">\r\n");
      out.write("\t<!-- usedId() 함수 작성하자 -->\r\n");
      out.write("\t\r\n");
      out.write("\t<script type=\"text/javascript\">\r\n");
      out.write("\t\r\n");
      out.write("\t\t// 중복체크창 아이디 입력부분 초기 값 및 확인버튼 활성/비활성 설정\r\n");
      out.write("\t\tfunction idValue(){\r\n");
      out.write("\t\t\tvar id;\r\n");
      out.write("\t\t\tif(\"");
      out.print( request.getAttribute("result") );
      out.write("\" == \"null\"){\r\n");
      out.write("\t\t\t\tid = opener.document.signUpForm.id.value; // 부모창의 아이디 저장\r\n");
      out.write("\t\t\t\t// 나를 연 부모창. 문서에서. signUpForm인 name값. id라는 input태그의. value값을 가져와라\r\n");
      out.write("\t\t\t}else{ // result가 있으면 DB에서 조회해서 값을 가져온 것\r\n");
      out.write("\t\t\t\t// 중복 체크 후 아이디 저장\r\n");
      out.write("\t\t\t\tid = \"");
      out.print( request.getAttribute("id") );
      out.write("\"; /* DB에서 가져온 ID값 저장 */\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\t// 중복체크 확인 버튼 활성/비활성\r\n");
      out.write("\t\t\t\tif(");
      out.print( request.getAttribute("result"));
      out.write(" == 0){ // 0이면 사용가능\r\n");
      out.write("\t\t\t\t\tdocument.getElementById(\"confirmId\").removeAttribute(\"disabled\");\t// disabled 속성 제거\t\t\r\n");
      out.write("\t\t\t\t}else{\r\n");
      out.write("\t\t\t\t\tdocument.getElementById(\"confirmId\").setAttribute(\"disabled\", \"disabled\");\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\tdocument.getElementById(\"id\").value = id;\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\r\n");
      out.write("\t\tfunction confirmId(){ // 중복체크 확인 시 회원가입창 아이디 부분 비활성화\r\n");
      out.write("\t\t\tconsole.log(opener.document.signUpForm.idDup);\r\n");
      out.write("\t\t\tif(");
      out.print( request.getAttribute("result"));
      out.write(" == 0){\r\n");
      out.write("\t\t\t\topener.document.signUpForm.id.value = document.getElementById(\"id\").value;\r\n");
      out.write("\t\t\t\t// 중복체크를 확인받아온 아이디 값을 부모창의 id input태그 value 로 전달\r\n");
      out.write("\t\t\t\topener.document.signUpForm.idDup.value = true;\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t}else{\r\n");
      out.write("\t\t\t\topener.document.signUpForm.idDup.value = false;\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t\tif(opener != null){ // 아이디 중복창 닫기 \r\n");
      out.write("\t\t\t\t// 부모창이 있으면 현재 창 닫기\r\n");
      out.write("\t\t\t\topener.checkForm = null;\r\n");
      out.write("\t\t\t\tself.close();\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t\r\n");
      out.write("\t</script>\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}