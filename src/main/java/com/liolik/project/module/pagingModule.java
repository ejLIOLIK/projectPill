package com.liolik.project.module;

import com.liolik.project.dto.PagingDto;

public class pagingModule {
	
	public static final int PAGE = 3; // 페이지당 게시글
	public static final int PAGEBLOCK = 5; // 페이징블락
	
	/* 전체 페이지 구하기 */
	public static int setTotalPage(int totalData) {
		if(totalData%PAGE==0) {
			return totalData/PAGE;
		}
		else {
			return totalData/PAGE +1;
		}
	}

	/* 페이지블럭 전체 페이지 구하기*/
	public static int setTotalPageBlock(int totalPage) {
		if(totalPage%PAGEBLOCK==0) {
			return totalPage/PAGEBLOCK;
		}
		else {
			return totalPage/PAGEBLOCK +1;
		}
	}
	
	/* 시작-끝 */
	/* 페이징블럭 시작-끝 */	
	/* 페이징블럭 boolean */
	public static PagingDto setPaging(PagingDto pdto) {
		
		// int 값은 null체크 불가능
		// 기본값 0인데 페이지 정보는 0이 불가능기 때문에 0일 경우로 초기화 가능
		if(pdto.curPage==0) {pdto.curPage=1;}
		if(pdto.curPageBlock==0) {pdto.curPageBlock=1;}
		
		pdto.begin = (pdto.curPage-1)*PAGE;
		pdto.end = pdto.curPage*PAGE-1;
		
		if(pdto.end>pdto.totalData) {
			pdto.end=pdto.totalData;
		}
		
		pdto.beginBlock = (pdto.curPageBlock-1)*PAGEBLOCK +1;
		pdto.endBlock = pdto.curPageBlock*PAGEBLOCK;
		
		if(pdto.endBlock>pdto.totalPage) {
			pdto.endBlock = pdto.totalPage;
		}
		
		// 이전/다음 버튼 활성화를 위한 boolean 체크		
		if(pdto.curPageBlock==1) {
			pdto.blBeforeBlock = false;}
		else {pdto.blBeforeBlock = true;}
		
		if(pdto.curPageBlock==(pdto.totalPageBlock)) {
			pdto.blAfterBlock = false;}
		else {pdto.blAfterBlock = true;}
		
		return pdto;
	}
	

}
