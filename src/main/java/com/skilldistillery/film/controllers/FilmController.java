package com.skilldistillery.film.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.skilldistillery.film.data.FilmDAO;
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
	public ModelAndView findFilmById(int id) {
		ModelAndView mv = new ModelAndView();
		Film f = filmDao.findFilmById(id);
		mv.addObject("film", f);
		mv.setViewName("views/result");
		return mv;
	}

	@RequestMapping(path = "createFilm.do", method = RequestMethod.POST)
	public ModelAndView createFilm(Film film, RedirectAttributes redir) {
		filmDao.createFilm(film);
		ModelAndView mv = new ModelAndView();
		redir.addFlashAttribute("film", film);
		mv.setViewName("redirect:filmAdded.do");
		return mv;
	}

	@RequestMapping(path = "filmAdded.do", method = RequestMethod.GET)
	public ModelAndView filmAddedRedirect() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("views/result");
		return mv;
	}
	
	@RequestMapping(path = "saveFilm.do", params ="id", method = RequestMethod.POST)
	public ModelAndView saveFilm(Film film, RedirectAttributes redir) {
		filmDao.saveFilm(film);
		ModelAndView mv = new ModelAndView();
		redir.addFlashAttribute("film", film);
		mv.setViewName("redirect:filmUpdated.do");
		return mv;
	}
	
	@RequestMapping(path = "filmUpdated.do", method = RequestMethod.GET)
	public ModelAndView filmSavedRedirect() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("views/result");
		return mv;
	}
@RequestMapping(path = "deleteFilm.do", method = RequestMethod.GET)
public ModelAndView deleteFilm(Film film) {
	ModelAndView mv = new ModelAndView();
	boolean filmDeleted = filmDao.deleteFilm(film);
	mv.addObject("filmDeleted", filmDeleted);
	mv.setViewName("views/filmDeleted");
	
	return mv;
}}
