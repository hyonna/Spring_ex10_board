package com.iu.util;

public class PageMaker {
	
	private int perPage = 10;
	private Integer curPage; //레퍼런스 타입이라서 null이 들어갈 수 있음
	private String kind; //title, writer, contents
	private String search;
	
	//rownum의 숫자를 만들려고 하는 것, 안에서 계산하기 때문에 setter는 필요없고
	//밖에서 쓸거기 때문에 getter만 필요함
	private int startRow;
	private int lastRow;
	
	
	//Page
	private int totalBlock;
	private int curBlock;
	private int startNum;
	private int lastNum;
	
	
	
	
	
	public int getTotalBlock() {
		return totalBlock;
	}
	public int getCurBlock() {
		return curBlock;
	}
	public int getStartNum() {
		return startNum;
	}
	public int getLastNum() {
		return lastNum;
	}
	public int getStartRow() {
		return startRow;
	}
	public int getLastRow() {
		return lastRow;
	}
	
	
	public Integer getCurPage() {
		
		if(curPage==null) {
			this.curPage = 1;
		}
		
		return curPage;
	}
	public void setCurPage(Integer curPage) {
		this.curPage = curPage;
		if(curPage==null) {
			this.curPage = 1;
		}
 	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public String getSearch() {
		
		if(this.search==null) {
			this.search="";
		}
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	} 
	
	
	//startRow, lastRow 계산
	public void makeRow() {
		
		this.startRow = (this.getCurPage()-1)*this.perPage+1;
		this.lastRow = this.curPage*this.perPage;
		
	}
	
	public void makePage(int totalCount) {
		
		//1.전체 글의 개수
		
		//2.전체 페이지 수
		
		int totalPage = totalCount / perPage;
		
		if(totalCount % perPage != 0) {
			totalPage++;
		}
		
		//3. totalBlock
		int perBlock = 5;
		this.totalBlock = totalPage/perBlock;
		if(totalPage % perBlock != 0) {
			totalBlock++;
		}
		
		//4. curPage를 이용해서 curBlock구하기
		this.curBlock = curPage / perBlock;
		if(this.curPage % perBlock != 0) {
			curBlock++;
		}

		//5. startNum, lastNum
		this.startNum = (this.curBlock-1)*perBlock+1;
		this.lastNum = this.curBlock*perBlock;
		
		//6. 현재 블럭이 마지막 블럭일때 (curBlock이 totalBlock일때)
		if(this.curBlock == totalBlock) {
			this.lastNum = totalPage;
			
		}
		
		
	}

}
