package com.skilldistillery.film.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.film.data.FilmDAO;
import com.skilldistillery.film.entities.Actor;
import com.skilldistillery.film.entities.Film;

@Controller
public class FilmController {

	@Autowired
	private FilmDAO filmDao;

	@RequestMapping("home.do")
	public String home() {

		return "views/home";
	}
	
	
	
	@RequestMapping(path = "findFilmById.do", params = "id", method = RequestMethod.GET)
	public ModelAndView findFilmById(String id) {
		ModelAndView mv = new ModelAndView();
		Film f = filmDao.findFilmById(Integer.parseInt(id));
		mv.addObject("film", f);
		mv.setViewName("views/result");
		return mv;
	}
	
	@RequestMapping(path = "findActorById.do", params = "id", method = RequestMethod.GET)
	public ModelAndView findActorById(String id) {
		ModelAndView mv = new ModelAndView();
		Actor a = filmDao.findActorById(Integer.parseInt(id));
		mv.addObject("actor", a);
		mv.setViewName("result-actor");
		return mv;
	}

}
