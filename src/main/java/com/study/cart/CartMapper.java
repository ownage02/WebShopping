package com.study.cart;

import java.util.List;
import java.util.Map;

public interface CartMapper {
  int create(CartDTO dto);
  List<CartDTO> list(String id);
  //CartDTO read(int cartno);
  void delete(int cartno);
  //int total(Map map);
  //List<CartDTO> cartlist(Map map);
}
