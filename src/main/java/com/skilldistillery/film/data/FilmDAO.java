package com.skilldistillery.film.data;

import java.sql.SQLException;
import java.util.List;

import com.skilldistillery.film.entities.Actor;
import com.skilldistillery.film.entities.Film;
import com.skilldistillery.film.entities.Language;

public interface FilmDAO {

	public Actor findActorById(int actorId);

	public List<Actor> findActorsByFilmId(int filmId);

	public List<Film> findFilmsByKeyword(String keywords);

	public Film findFilmById(int Filmid);

	public Actor createActor(Actor actor);

	public boolean deleteActor(Actor actor);

	public boolean saveActor(Actor actor);

	public Film createFilm(Film film);

	public boolean deleteFilm(Film film);

	public boolean saveFilm(Film film);
	
	public Language findLangById(int languageId) throws SQLException;

}
