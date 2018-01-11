<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="java.awt.Graphics"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.awt.Font"%>
<%@page import="java.awt.Color"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
	<body>
		<%!
			//��Χ��������ɫ
			Color getRandColor(int fc,int bc){
		        Random random = new Random(); 
		        if(fc>255) fc=255; 
		        if(bc>255) bc=255; 
		        int r=fc+random.nextInt(bc-fc); 
		        int g=fc+random.nextInt(bc-fc); 
		        int b=fc+random.nextInt(bc-fc); 
		        return new Color(r,g,b); 
		        } 
		%>
		<%
			//����ҳ�治���� 
			response.setHeader("Pragma", "No-cache");
			response.setHeader("Cache-Control", "no-cache");
			response.setDateHeader("Expires", 0);

			// ���ڴ��д���ͼ�� 
			int width = 100, height = 35;
			BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);

			// ��ȡͼ�������� 
			Graphics g = image.getGraphics();

			//�������� 
			Random random = new Random();

			// �趨����ɫ 
			g.setColor(getRandColor(240, 250));
			g.fillRect(0, 0, width, height);

			//�趨���� 
			g.setFont(new Font("Times New Roman", Font.PLAIN, 25));

			// ������155�������ߣ�ʹͼ���е���֤�벻�ױ��������̽�⵽
			g.setColor(getRandColor(180, 230));
			for (int i = 0; i < 10; i++) {
				int x = random.nextInt(width);
				int y = random.nextInt(height);
				int xl = random.nextInt(12);
				int yl = random.nextInt(12);
				g.drawLine(x, y, x + xl, y + yl);
			}
			//��֤�룬��2��һλ��ļӼ������ɣ����磺3 + 4 = ��
			String sRand = "";
			int num1 = (int)(Math.random() * 10);
			int num2 = (int)(Math.random() * 10);
			int funNo = random.nextInt(1);	//����[0,2]֮����������
			String funMethod = "";
			int result = 999;
			switch (funNo) {
				case 0: funMethod = "+"; result = num1 + num2; break;
				case 1: funMethod = "- "; result = num1 - num2; break;
				case 2: funMethod = "��"; result = num1 * num2; break;
			}
			String calc = num1 + " " + funMethod + " " + num2 + " = ?";
			g.setColor(new Color(20+random.nextInt(110),20+random.nextInt(110),20+random.nextInt(110)));
			g.drawString(calc, 5, 25);
			// ����֤�����SESSION 
			session.setAttribute("theCalcResult", String.valueOf(result));
			// ͼ����Ч 
			g.dispose();
			// ���ͼ��ҳ�� 
			ImageIO.write(image, "JPEG", response.getOutputStream());
			//�ر���Դ
			out.clear();
			out = pageContext.pushBody();
		%>
	</body>
</html>