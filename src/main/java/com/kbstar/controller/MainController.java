package com.kbstar.controller;

import com.kbstar.dto.ItemDTO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
public class MainController {

    Logger logger = LoggerFactory.getLogger(this.getClass().getSimpleName());
    //로그기록 사용 선언

    // http://127.0.0.1/
    @RequestMapping("/")
    public String main(){
        return "index";
    }

    @RequestMapping("/charts")
    public String charts(Model model){
        model.addAttribute("center", "charts");
        return "index";
    }

    @RequestMapping("/tables")
    public String tables(Model model){
        List<ItemDTO> list = new ArrayList<>();
//            list.add(new ItemDTO(100,"사탕",1000,"a.jpg",new Date()));
//            list.add(new ItemDTO(101,"초코릿",2000,"b.jpg",new Date()));
//            list.add(new ItemDTO(102,"아스크림",3000,"c.jpg",new Date()));
//            list.add(new ItemDTO(103,"호떡",4000,"d.jpg",new Date()));
//            list.add(new ItemDTO(104,"커피",5000,"e.jpg",new Date()));
        //위아래 리스트를 둘 다 사용하려면, list1, list2으로 각각 저장하고, 또 각각 foreach로 jsp에 구현하면 가능

        for(int i=1 ; i < 100 ; i++ ){
            list.add(new ItemDTO(i, "상품"+ i, (int)Math.round(Math.random() * 10000), "a.jpg", new Date()));
        }

        model.addAttribute("allitem", list);

        model.addAttribute("center", "tables");
        return "index";
    }

    @RequestMapping("/livechart")
    public String livechart(Model model){
        model.addAttribute("center", "livechart");
        return "index";
    }
}
