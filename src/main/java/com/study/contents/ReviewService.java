package com.study.contents;

import java.util.List;
import java.util.Map;

public interface ReviewService {
  int create(ReviewDTO dto);
  List<ReviewDTO> list(Map map);
  ReviewDTO read(int rnum);
  int update(ReviewDTO dto);
  int delete(int rnum);
  int total(int contentsno);
}
