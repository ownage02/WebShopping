package com.study.cart;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.cart.CartMapper;

@Service("com.study.cart.CartServiceImpl")
public class CartServiceImpl implements CartService {
  
  @Autowired
  private CartMapper mapper;

  @Override
  public int create(CartDTO dto) {
    // TODO Auto-generated method stub
    return mapper.create(dto);
  }

  @Override
  public List<CartDTO> list(String id) {
    // TODO Auto-generated method stub
    return mapper.list(id);
  }

  /*@Override
  public CartDTO read(int cartno) {
    // TODO Auto-generated method stub
    return mapper.read(cartno);
  }*/

  @Override
  public void delete(int cartno) {
    // TODO Auto-generated method stub
    mapper.delete(cartno);
  }
  /*
  @Override
  public int total(Map map) {
    // TODO Auto-generated method stub
    return mapper.total(map);
  }

  @Override
  public List<CartDTO> cartlist(Map map) {
    // TODO Auto-generated method stub
    return mapper.cartlist(map);
  }
  */
}
