package com.study.cart;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.study.utility.Utility;

@Controller
public class CartController {
  
  private static final Logger log = LoggerFactory.getLogger(CartController.class);
  
  @Autowired
  @Qualifier("com.study.cart.CartServiceImpl")
  private CartService service;
    
  @GetMapping("/cart/delete/{cartno}")
  public String delete(@PathVariable int cartno) {
    
    service.delete(cartno);
    
    return "redirect:/cart/list";
  }
  
  @GetMapping("/cart/list")
  public String list(HttpSession session, Model model) {
    String id = (String)session.getAttribute("id");
    
    model.addAttribute("list", service.list(id));
    
    return "/cart/list";
  }
  
  /*
  @RequestMapping("/cart/list")
  public String list(HttpServletRequest request) {
    // 검색관련------------------------
    String col = Utility.checkNull(request.getParameter("col"));
    String word = Utility.checkNull(request.getParameter("word"));

    if (col.equals("total")) {
      word = "";
    }
    
    // 페이지관련-----------------------
    int nowPage = 1;// 현재 보고있는 페이지
    if (request.getParameter("nowPage") != null) {
      nowPage = Integer.parseInt(request.getParameter("nowPage"));
    }
    int recordPerPage = 5;// 한페이지당 보여줄 레코드갯수

    // DB에서 가져올 순번-----------------
    int sno = (nowPage - 1) * recordPerPage;
    int eno = recordPerPage;

    Map map = new HashMap();
    map.put("col", col);
    map.put("word", word);
    map.put("sno", sno);
    map.put("eno", eno);

    int total = service.total(map);

    List<CartDTO> list = service.list(map);

    String paging = Utility.paging(total, nowPage, recordPerPage, col, word);

    // request에 Model사용 결과 담는다
    request.setAttribute("list", list);
    request.setAttribute("nowPage", nowPage);
    request.setAttribute("col", col);
    request.setAttribute("word", word);
    request.setAttribute("paging", paging);
    
    // view페이지 리턴
    return "/cart/list";
  }*/
  
  @PostMapping("/cart/create")
  @ResponseBody
  public String create(@RequestBody CartDTO dto, HttpSession session) {

    log.info("dto: " + dto);
    log.info("contentsno: " + dto.getContentsno());
    log.info("dto: " + dto.getCount());
    log.info("id: " + dto.getId());

    int cnt = service.create(dto);

    if(cnt == 1) return "장바구니에 저장했어요";
    else return HttpStatus.INTERNAL_SERVER_ERROR.toString();
  }
}