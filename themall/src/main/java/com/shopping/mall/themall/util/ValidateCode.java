package com.shopping.mall.themall.util;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.util.Random;

public class ValidateCode {

	public static final String RANDOMCODEKEY = "ValidateCode";
	//��ͼƬ��ŵ�Session�е�key
	
    private Random random = new Random();//���������
	
	private String randomString = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
	//ͼƬ�������������ĸ������
	
	private int width = 80;//ͼƬ��
	private int height = 26;//ͼƬ��
	private int lineSize = 40;//����������
	private int stringNum = 4;//��������ַ�����
	
	//�������
    private Font getFont(){
        return new Font("Fixedsys",Font.CENTER_BASELINE,18);
    }
    
    //��������ɫֵ
    private Color getRandColor(int fc,int bc){
        if(fc > 255) {
            fc = 255;
        }
        if(bc > 255) {
            bc = 255;
        }
        int r = fc + random.nextInt(bc-fc-16);
        int g = fc + random.nextInt(bc-fc-14);
        int b = fc + random.nextInt(bc-fc-18);
        return new Color(r,g,b);
    }
    
    /*
     * ����������ַ�
     */
    public String getRandomString(int num){
        return String.valueOf(randomString.charAt(num));
    }
    
    /*
     * �����ַ���
     */
    private String drawString(Graphics g, String randomString, int i){
        g.setFont(getFont());
        g.setColor(new Color(random.nextInt(101),random.nextInt(111),random.nextInt(121)));
        String rand = String.valueOf(getRandomString(random.nextInt(this.randomString.length())));
        randomString += rand;
        g.translate(random.nextInt(3), random.nextInt(3));
        g.drawString(rand, 13 * i, 16);
        return randomString;
    }
    
    /*
     * ���Ƹ�����
     */
    private void drawLine(Graphics g){
        int x = random.nextInt(width);
        int y = random.nextInt(height);
        int xl = random.nextInt(13);
        int yl = random.nextInt(15);
        g.drawLine(x, y, x + xl, y + yl);
    }
    
    //���ķ��������������֤�룬������
    public void getValidateCode(HttpServletRequest request, HttpServletResponse response) {
    	// ����Session����
		HttpSession session = request.getSession();
		BufferedImage image = new BufferedImage(width,height,BufferedImage.TYPE_INT_BGR);
		Graphics g = image.getGraphics();//����Image�����Graphics����,�Ķ��������ͼ���Ͻ��и��ֻ��Ʋ���
		g.fillRect(0, 0, width, height);
		g.setFont(new Font("Times New Roman",Font.ROMAN_BASELINE,18));
		g.setColor(getRandColor(110, 133));
		
		//���Ƹ�����
		for(int i = 0;i <= lineSize; i++){
			drawLine(g);
		}
		
		//��������ַ�
		String randomString = "";
		for(int i = 1; i <= stringNum; i++){
			randomString = drawString(g, randomString, i);
		}
		
		//�����ɵ�����ַ���װ��Session������
		session.removeAttribute(RANDOMCODEKEY);
		
		
		session.setAttribute(RANDOMCODEKEY, randomString);
		
		
		
		
		System.out.println(randomString);//������ɵ�����ַ���
		
		g.dispose();//�رմ��壬�ͷ���Դ
		try {
			ImageIO.write(image, "JPEG", response.getOutputStream());//���ڴ��е�ͼƬͨ��������ʽ������ͻ���
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}




