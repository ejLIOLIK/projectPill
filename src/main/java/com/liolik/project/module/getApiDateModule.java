package com.liolik.project.module;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpression;
import javax.xml.xpath.XPathExpressionException;
import javax.xml.xpath.XPathFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;

import com.liolik.project.dto.CustomerDto;

public class getApiDateModule {

	//팩토리 생성 후 Document 반환
	public Document DocumentBuild(InputSource is) throws ParserConfigurationException, SAXException, IOException {
		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        factory.setNamespaceAware(true);
        DocumentBuilder builder;
        Document doc = null;
        
        builder = factory.newDocumentBuilder();
        doc = builder.parse(is);
        
        return doc;
	}
	
	//응답 읽기
	public InputSource getInputSource(HttpURLConnection urlconnection) throws UnsupportedEncodingException, IOException {
		
		BufferedReader br = null;
		
		br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(), "UTF-8"));
        String result = "";
        String line;
        while ((line = br.readLine()) != null) {
            result = result + line.trim();// result = URL로 XML을 읽은 값
        }
        
        InputSource is = new InputSource(new StringReader(result));
        return is;
	}

	//검색어 인코딩
	public String endodingSearch(String sido, String sigungu, String name) {
		
		try {
			if(sido !=null) {
				sido = URLEncoder.encode(sido, "UTF-8");}
			if(sigungu !=null) {
				sigungu = URLEncoder.encode(sigungu, "UTF-8");}
			if(name !=null) {
				name = URLEncoder.encode(name, "UTF-8");}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		String urlstr = "Q0="+sido+"&Q1="+sigungu+"&QN="+name+"&numOfRows=10";
		
		return urlstr;
	}
	
	//검색어 받아서 openApi호출
	public URL SearchApi(String search) throws IOException {
		//OpenApi호출
        String urlstr = "http://apis.data.go.kr/"
                + "B552657/ErmctInsttInfoInqireService/getParmacyListInfoInqire?"
                + "serviceKey=" //서비스키 가림
                + search + "&numOfRows=20";
        
        URL url = new URL(urlstr);

        return url;
	}
	
	//xPath	
	public NodeList getNodeList(Document doc) throws XPathExpressionException {
		XPathFactory xpathFactory = XPathFactory.newInstance();
        XPath xpath = xpathFactory.newXPath();
        XPathExpression expr = xpath.compile("//items/item");
        NodeList nodeList = (NodeList) expr.evaluate(doc, XPathConstants.NODESET);
        
        return nodeList ;
	}
	
	//
	public List<CustomerDto> getApiDataList(String search){
		
		HttpURLConnection urlconnection;
		List<CustomerDto> cList = new ArrayList<>();
		
		try {
			urlconnection = (HttpURLConnection) SearchApi(search).openConnection();
			InputSource is = getInputSource(urlconnection);
			Document doc = DocumentBuild(is);
			NodeList nodeList = getNodeList(doc);
			cList =	nodeToDtoList(nodeList);
		
		} catch (IOException | ParserConfigurationException | SAXException | XPathExpressionException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return cList;
	}
	
	//노드리스트 > Dto리스트로 가공
	public List<CustomerDto> nodeToDtoList(NodeList nodeList){
		
		List<CustomerDto> cList = new ArrayList<>();
		// 상호명, 도로명 주소, 연락처만
		
		for (int i = 0; i < nodeList.getLength(); i++) {
        	CustomerDto cdto = new CustomerDto();
        	String adressNum="";
            String splitAdress[] = {"",""};
            NodeList child = nodeList.item(i).getChildNodes();
            
            for (int j = 0; j < child.getLength(); j++) { 
                Node node = child.item(j);
                // 주소(dutyAddr), 약국명(dutyName), 전화(dutyTel1), 우편번호(postCdn1,postCdn2), 메모(dutyMapimg)
                
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
        return cList;
	}
	
}
