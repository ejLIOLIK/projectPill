package com.liolik.project;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpression;
import javax.xml.xpath.XPathFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

import com.liolik.project.dto.CustomerDto;

public class ApiExplorer {
	
	public static List<CustomerDto> getAPIData() {
		
		List<CustomerDto> cList = new ArrayList<>();
		
        BufferedReader br = null;
        
        //DocumentBuilderFactory 생성
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        factory.setNamespaceAware(true);
        DocumentBuilder builder;
        Document doc = null;
        try {
            //OpenApi호출
            String urlstr = "http://apis.data.go.kr/"
                    + "B552657/ErmctInsttInfoInqireService/getParmacyListInfoInqire"
                    + "?numOfRows=110" 
                    + "&serviceKey=kAUw1ylBlW8g3vPs2nngTWrFPce2c%2F9uTxoVXTJAnhciA3h7wbDVs1jCCd6DCqVwJ5uNUbMB3pkHx6XeOftD0g%3D%3D"; //서비스키 가림
            
            URL url = new URL(urlstr);
            HttpURLConnection urlconnection = (HttpURLConnection) url.openConnection();
            
            //응답 읽기
            br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(), "UTF-8"));
            String result = "";
            String line;
            while ((line = br.readLine()) != null) {
                result = result + line.trim();// result = URL로 XML을 읽은 값
            }
            
            // xml 파싱
            InputSource is = new InputSource(new StringReader(result));
            builder = factory.newDocumentBuilder();
            doc = builder.parse(is);
            XPathFactory xpathFactory = XPathFactory.newInstance();
            XPath xpath = xpathFactory.newXPath();
            XPathExpression expr = xpath.compile("//items/item");
            NodeList nodeList = (NodeList) expr.evaluate(doc, XPathConstants.NODESET);
            
            for (int i = 0; i < nodeList.getLength(); i++) {
            	CustomerDto cdto = new CustomerDto();
            	String adressNum="";
                String splitAdress[] = {"",""};
                NodeList child = nodeList.item(i).getChildNodes();
                
                for (int j = 0; j < child.getLength(); j++) { 
                    Node node = child.item(j);
                    // 주소(dutyAddr), 약국명(dutyName), 전화(dutyTel1), 우편번호(postCdn1,postCdn2), 메모(dutyMapimg)

                    // 받아오는 값 외 기본설정
                    cdto.setSTATE("매출");
                    cdto.setBALANCE(0);
                    cdto.setEMPLOYEE_CODE("7");
                    cdto.setEMPLOYEE_NAME("김사과");
                    cdto.setEMPLOYEE_RANK("이사");
                    
                    // 데이터 Dto에 입력
                    if(node.getNodeName().equals("dutyName")) { cdto.setCNAME(node.getTextContent().trim());}
                    else if(node.getNodeName().equals("postCdn1")) { adressNum += node.getTextContent().trim(); }
                    else if(node.getNodeName().equals("postCdn2")) { 
                    	adressNum += node.getTextContent().trim();
                    	cdto.setADRESS_NUMBER(adressNum); } // 우편번호가 분리되어있어서 이어붙여 저장함
                    else if(node.getNodeName().equals("dutyAddr")) { 
                    	splitAdress = node.getTextContent().trim().split(","); // 주소 분리해서 상세 주소는 별도로 저장
                    	cdto.setADRESS_DORO(splitAdress[0]); //도로명
                    	if(splitAdress.length==2) { //상세주소 없는 경우 체크 //상세주소
                    		cdto.setADRESS_DETAIL(splitAdress[1]);} 
                    	} 
                    else if(node.getNodeName().equals("dutyTel1")) { cdto.setTEL(node.getTextContent().trim()); }
                    else if(node.getNodeName().equals("dutyMapimg")) { cdto.setMEMO(node.getTextContent().trim()); }
                }
                
                cList.add(cdto); // 리스트에 추가
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        
        return cList;
    }
    
}
