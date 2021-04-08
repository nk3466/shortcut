package com.greedy.shortcut.mywork.controller;

import java.security.Principal;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.greedy.shortcut.common.paging.PageInfoDTO;
import com.greedy.shortcut.common.paging.Pagenation;
import com.greedy.shortcut.member.model.dto.MemberDTO;
import com.greedy.shortcut.mywork.model.dto.MyworkResponseCardAndTaskDTO;
import com.greedy.shortcut.mywork.model.service.MyworkService;
import static com.greedy.shortcut.common.paging.Pagenation.getPageInfo;
@Controller
@RequestMapping("/*")
public class MyworkController {
	private MyworkService myworkService;
	
	@Autowired
	public MyworkController(MyworkService myworkService) {
		this.myworkService = myworkService;
	}
	
	
	@GetMapping("mywork/mywork")
	public String Mywork(Principal principal, Model model) {
		/*1. 전체 카드 개수  */ // selectTaskTypeCount (memNo)
		/*2. 요청 전체 카드 개수 */ // selectTaskTypeCount(memNo, int type)
		/*3. 진행 전체 카드 개수  */ // selectTaskTypeCount(memNo, int type)
		/*4. 완료 전체 카드 개수  */ // selectTaskTypeCount(memNo, int type)
		/*5. 보류 전체 카드 개수  */ // selectTaskTypeCount(memNo, int type)
		/*6. 요청 카드 3개 (최초 1번부터 3번까지) */ // selectTaskTypeList(memNo, int type, PageNum)
		//   (PageNum*3 - 2 ) ~ (PageNum*3) 번호까지 조회 해서 전달  
		/*7. 완료 카드 3개 (최초 1번부터 3번까지) */ // selectTaskTypeList(memNo, int type, PageNum)
		/*8. 진행 카드 3개 (최초 1번부터 3번까지) */ // selectTaskTypeList(memNo, int type, PageNum)
		/*9. 보류 카드 3개 (최초 1번부터 3번까지) */ // selectTaskTypeList(memNo, int type, PageNum)
		
		
		System.out.println("메소드 진입 ");
		
		String userName = principal.getName();
		System.out.println("userName: " + userName);
		
		/* 회원 정보 조회 */
		MemberDTO member = myworkService.selectUserInfoOne(userName);
		System.out.println("member : " + member);
		
		/* 전체 카드 개수 조회  */
		
		int allCardCount = myworkService.selectTaskTypeCount(member.getNo(), 0);
		int reqCardCount = myworkService.selectTaskTypeCount(member.getNo(), 1);
		int doingCardCount = myworkService.selectTaskTypeCount(member.getNo(), 2);
		int doneCardCount = myworkService.selectTaskTypeCount(member.getNo(), 3);
		int waitCardCount = myworkService.selectTaskTypeCount(member.getNo(), 4);
		
		System.out.println("전체: " + allCardCount);
		System.out.println("요청: " + reqCardCount);
		System.out.println("진행: " + doingCardCount);
		System.out.println("완료: " + doneCardCount);
		System.out.println("보류: " + waitCardCount);
		
		/* 카드 리스트 불러오기 */
		List<MyworkResponseCardAndTaskDTO> cardProgress1List = new ArrayList<>();
		List<MyworkResponseCardAndTaskDTO> cardProgress2List = new ArrayList<>();
		List<MyworkResponseCardAndTaskDTO> cardProgress3List = new ArrayList<>();
		List<MyworkResponseCardAndTaskDTO> cardProgress4List = new ArrayList<>();
		
		PageInfoDTO reqPageInfo = Pagenation.getPageInfo(1, reqCardCount, 3, 5);
		PageInfoDTO doingPageInfo = Pagenation.getPageInfo(1, doingCardCount, 3, 5);
		PageInfoDTO donePageInfo = Pagenation.getPageInfo(1, doneCardCount, 3, 5);
		PageInfoDTO waitPageInfo = Pagenation.getPageInfo(1, waitCardCount, 3, 5);
		
		cardProgress1List = myworkService.selectTaskTypeList(member.getNo(), 1, reqPageInfo);
		cardProgress2List = myworkService.selectTaskTypeList(member.getNo(), 2, doingPageInfo);
		cardProgress3List = myworkService.selectTaskTypeList(member.getNo(), 3, donePageInfo);
		cardProgress4List = myworkService.selectTaskTypeList(member.getNo(), 4, waitPageInfo);
		
		System.out.println("cardProgress1List : " + cardProgress1List);
		System.out.println("cardProgress2List : " + cardProgress2List);
		System.out.println("cardProgress3List : " + cardProgress3List);
		System.out.println("cardProgress4List : " + cardProgress4List);
		
		PageInfoDTO pageInfo = Pagenation.getPageInfo(1, doingCardCount, 3, 5);
//		//List<ClientCardDTO> cardList = new ArrayList<>();
//		//cardList = myworkService.selectCardList(member.getNo()); 
//		List<MyworkResponseCardAndTaskDTO> cardList = new ArrayList<>();
//		List<MyworkResponseCardAndTaskDTO> cardProgress1List = new ArrayList<>();
//		List<MyworkResponseCardAndTaskDTO> cardProgress2List = new ArrayList<>();
//		List<MyworkResponseCardAndTaskDTO> cardProgress3List = new ArrayList<>();
//		List<MyworkResponseCardAndTaskDTO> cardProgress4List = new ArrayList<>();
//		
//		cardList = myworkService.selectTaskList(member.getNo()); 
//		
//		for(MyworkResponseCardAndTaskDTO card : cardList) {
//			System.out.println("card: " + card);
//			switch(card.getTkProgress()) {
//			case 1: cardProgress1List.add(card); break;
//			case 2: cardProgress2List.add(card); break;
//			case 3: cardProgress3List.add(card); break;
//			case 4: cardProgress4List.add(card); break;
//			default : /* 에러 페이지 발생 필요 */
//			}
//		}
//		
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("allCardCount", allCardCount);
		model.addAttribute("reqCardCount", reqCardCount);
		model.addAttribute("doingCardCount", doingCardCount);
		model.addAttribute("doneCardCount", doneCardCount);
		model.addAttribute("waitCardCount", waitCardCount);
		model.addAttribute("cardProgress1List",cardProgress1List);
		model.addAttribute("cardProgress2List",cardProgress2List);
		model.addAttribute("cardProgress3List",cardProgress3List);
		model.addAttribute("cardProgress4List",cardProgress4List);
		
		return "mywork/mywork";
		
		
	}
	
	@PostMapping(value="/mywork/requestPaging", produces ="application/json; charset=UTF-8")
	@ResponseBody
	public String requestPaging(Principal principal, Model model,  @RequestParam Map<String, String> parameters) throws JsonProcessingException {
		String currentPage = parameters.get("currentPage");
		int memNo = Integer.parseInt(parameters.get("memNo"));
		int pageNo = 1;
		int limit = 3;
		int buttonAmount = 5;
		
		if(currentPage != null && !"".equals(currentPage)) {
			pageNo = Integer.parseInt(currentPage);
		}
		
		if(pageNo <= 0) {
			pageNo = 1;
		}
		System.out.println("pageNo : " + pageNo);
		System.out.println("memNo:" + memNo);
		
		/* 진행중 카드 갯수 조회 */
		int totalCount = myworkService.selectTaskTypeCount(memNo, 2);
		
		/* 페이지 정보 생성*/
		PageInfoDTO pageInfo = Pagenation.getPageInfo(pageNo, totalCount, limit, buttonAmount);
		
		
		
		/* 진행중 카드 리스트 조회 */
		List<MyworkResponseCardAndTaskDTO> cardProgress2List = myworkService.selectTaskTypeList(memNo, 2, pageInfo);
		
		System.out.println("cardProgress2List : " +cardProgress2List);
		return new ObjectMapper().writeValueAsString(cardProgress2List);
		
		
	}
	

}
