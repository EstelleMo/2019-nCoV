package com.estelle.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.estelle.bean.KkRegionD;
import com.estelle.mapper.KkRegionDMapper;

@Controller
public class ResionController {
	
	@Autowired
	KkRegionDMapper kMapper;
	
	@RequestMapping(value = "/area/getProvince")
	public List<KkRegionD> getProvince(HttpServletRequest request
			,HttpServletResponse response
			,@Param(value = "id") String id) {
		ModelAndView mav = new ModelAndView();
		List<KkRegionD> areas = kMapper.selectById(id);
		return areas;
	}
	@RequestMapping(value = "/area/getCity")
	public List<KkRegionD> getCity(HttpServletRequest request
			,HttpServletResponse response
			,@Param(value = "id") String id) {
		ModelAndView mav = new ModelAndView();
		List<KkRegionD> areas = kMapper.selectById(id);
		return areas;
	}
	@RequestMapping(value = "/area/getArea")
	public List<KkRegionD> getArea(HttpServletRequest request
			,HttpServletResponse response
			,@Param(value = "id") String id) {
		ModelAndView mav = new ModelAndView();
		List<KkRegionD> areas = kMapper.selectById(id);
		return areas;
	}
	
}

