package com.estelle.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.estelle.bean.KkRegionD;
import com.estelle.mapper.KkRegionDMapper;

@RestController
public class ResionController {

	@Autowired
	KkRegionDMapper kMapper;

	@RequestMapping(value = "/area/getProvince",method = RequestMethod.POST)
	public List<KkRegionD> getProvince(HttpServletRequest request
			, HttpServletResponse response
		) {
		ModelAndView mav = new ModelAndView();
		List<KkRegionD> areas = kMapper.selectById("1");
		System.out.println("province: "+areas);
		return areas;
	}

	@RequestMapping(value = "/area/getCity",method = RequestMethod.POST)
	public List<KkRegionD> getCity(HttpServletRequest request, HttpServletResponse response,
			@Param(value = "id") String id) {
		System.out.println("city id :"+id);
		List<KkRegionD> areas = kMapper.selectById(id);
		System.out.println("city: "+areas);
		return areas;
	}

	@RequestMapping(value = "/area/getArea",method = RequestMethod.POST)
	public List<KkRegionD> getArea(HttpServletRequest request, HttpServletResponse response,
			@Param(value = "id") String id) {
		System.out.println("area id: "+id);
		List<KkRegionD> areas = kMapper.selectById(id);
		System.out.println("area: "+areas);
		return areas;
	}

}
