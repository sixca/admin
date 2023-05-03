package com.kbstar.controller;

import com.kbstar.dto.Item;
import com.kbstar.service.ItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/item")
public class ItemController {

    @Autowired
    ItemService itemService;

    String dir = "item/";

    @RequestMapping("/add")
    public String add(Model model){
        model.addAttribute("center", dir+"add");
        return "index";
    }

    @RequestMapping("/all")
    public String all(Model model) throws Exception {
        List<Item> list = null;
        list = itemService.get();
        model.addAttribute("ilist", list);
        model.addAttribute("center", dir+"all");
        return "index";
    }

    @RequestMapping("/detail")   //로그인 사용자 아이디 클릭 시 정보조회
    public String detail(Model model, Integer id) throws Exception {   // /item/detail?id=${obj.id} 써먹으려면 Integer id를 받아야
        Item item =null;
        try {
            item = itemService.get(id);
        } catch (Exception e) {
            throw new Exception("시스템 장애");
        }
        model.addAttribute("iteminfo", item);    //뿌릴 정보를 준비하고
        model.addAttribute("center", dir+"detail");     //센터에 정보를 뿌림. 익숙해 지세요!
        return "index";
    }

    @RequestMapping("/updateimpl")
    public String updateimpl(Model model, Item item) throws Exception {
        itemService.modify(item);
        return "redirect:/item/detail?id="+item.getId();         //수정이 일어난 후, "/detail?id="로 다시 보냄
    }

    @RequestMapping("/deleteimpl")
    public String deleteimpl(Model model, Integer id) throws Exception {
        itemService.remove(id);
        return "redirect:/item/all";
    }

}
