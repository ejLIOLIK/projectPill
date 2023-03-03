package com.liolik.project.dto;

import lombok.Data;

@Data
public class PagingDto {
	/* 페이징 */
	public int totalData; // 데이터 수
	public int totalPage;
	public int curPage;
	public int begin;
	public int end;
	/* 페이징 블럭 */
	public int totalPageBlock;
	public int curPageBlock;
	public int beginBlock;
	public int endBlock;
	public boolean blBeforeBlock; 
	public boolean blAfterBlock; 
	
	public PagingDto(int totalData, int curPage, int curPageBlock) {
		this.totalData = totalData;
		this.curPage = curPage;
		this.curPageBlock = curPageBlock;
	}
}
