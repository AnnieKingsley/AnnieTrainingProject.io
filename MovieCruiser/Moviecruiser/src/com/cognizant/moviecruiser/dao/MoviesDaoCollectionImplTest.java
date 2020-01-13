package com.cognizant.moviecruiser.dao;

import java.util.List;

import com.cognizant.moviecruiser.model.Movies;

import com.cognizant.moviecruiser.util.DateUtil;

public class MoviesDaoCollectionImplTest {
	public static void testGetMoviesListAdmin() {
		System.out.println("Movies List For Admin:");
		@SuppressWarnings("unused")
		MoviesDao moviesDao = new MoviesDaoCollectionImpl();
		List<Movies> moviesList = new MoviesDaoCollectionImpl().getMoviesListAdmin();
		for (Movies movies : moviesList) {
			System.out.println(movies);
		}
	}

	public static void testGetMoviesListCustomer() {
		System.out.println("Movies List For Customer:");
		@SuppressWarnings("unused")
		MoviesDao moviesDao = new MoviesDaoCollectionImpl();
		List<Movies> moviesList = new MoviesDaoCollectionImpl().getMoviesListCustomer();
		for (Movies movies : moviesList) {
			System.out.println(movies);
		}
	}

	public static void testModifyMovies() {
		Movies item = new Movies(5L, "Insidious         ", 2750760348L, true,new DateUtil().convertToDate("02/11/2022"), "Horror     ", true);
		MoviesDao moviesDao = new MoviesDaoCollectionImpl();
		moviesDao.modifyMovies(item);
		System.out.println("***Modified List***");
		testGetMoviesListAdmin();
		Movies modified_item = moviesDao.getMovies(item.getId());
		System.out.println("Modified movie detail:\n" + modified_item);
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		testGetMoviesListAdmin();
		testGetMoviesListCustomer();
		testModifyMovies();
	}

}
