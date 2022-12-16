package com.skilldistillery.film.controllers;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.film.data.FilmDAO;
import com.skilldistillery.film.entities.Film;
import com.skilldistillery.film.entities.Language;

@Controller
public class FilmController {

	@Autowired
	private FilmDAO filmDao;

	@RequestMapping("home.do")
	public String home() {

		return "views/home";
	}

	@RequestMapping(path = "findFilmById.do", params = "id", method = RequestMethod.GET)
	public ModelAndView findFilmById(int id) throws SQLException {
		ModelAndView mv = new ModelAndView();
		Film f = filmDao.findFilmById(id);
		Language l = filmDao.findLangById(id);
		mv.addObject("language", l);

		mv.addObject("film", f);
		mv.setViewName("views/result");
		return mv;
	}

	@RequestMapping(path = "findFilmsByKeyword.do", method = RequestMethod.GET)
	public ModelAndView findFilmsByKeyword(@RequestParam("keyword") String keyword) {
		ModelAndView mv = new ModelAndView();

		List<Film> films = filmDao.findFilmsByKeyword(keyword);
		mv.addObject("films", films);

		mv.setViewName("views/filmList");

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

	@RequestMapping(path = "saveFilm.do", method = RequestMethod.POST)
	public ModelAndView saveFilm(Film film, RedirectAttributes redir) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("film", film);
		filmDao.saveFilm(film);
		mv.setViewName("views/result");
		return mv;
	}

	@RequestMapping(path = "filmUpdated.do", method = RequestMethod.POST)
	public ModelAndView filmSavedRedirect(Film filmUpdate) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("film", filmUpdate);
		mv.setViewName("views/saveFilm");
		return mv;
	}


	@RequestMapping(path = "deleteFilm.do", params = "filmid", method = RequestMethod.GET)
	public ModelAndView deleteFilm(Film film, int filmid) {
		ModelAndView mv = new ModelAndView();
		Film filmToBeDeleted = filmDao.findFilmById(filmid);
		boolean filmDeleted = filmDao.deleteFilm(filmToBeDeleted);
		mv.addObject("filmDeleted", filmDeleted);
		mv.setViewName("views/filmDeleted");

		return mv;
	}
}
