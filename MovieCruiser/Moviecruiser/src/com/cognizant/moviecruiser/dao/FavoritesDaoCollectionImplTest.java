package com.cognizant.moviecruiser.dao;

import java.util.List;

import com.cognizant.moviecruiser.model.Movies;

public class FavoritesDaoCollectionImplTest {

	@SuppressWarnings("unchecked")
	public static void testAddFavoriteMovies() throws FavoritesEmptyException {
		FavoritesDao favoritesDao = new FavoritesDaoCollectionImpl();
		favoritesDao.addFavoriteMovies(1, 2L);
		favoritesDao.addFavoriteMovies(1, 5L);
		favoritesDao.addFavoriteMovies(2, 1L);
		favoritesDao.addFavoriteMovies(2, 3L);
		List<Movies> moviesListCustomer = (List<Movies>) favoritesDao.getAllFavoriteMovies(1);
		System.out.println("User Added Favorite Movies for CheckOut:");
		for (Movies movies : moviesListCustomer) {
			System.out.println(movies);
		}
		System.out.println("No.of fav : " + moviesListCustomer.size());
	}

	@SuppressWarnings("unchecked")
	public static void testRemoveFavoriteMovies() throws FavoritesEmptyException {
		FavoritesDao favoritesDao = new FavoritesDaoCollectionImpl();
		System.out.println("Movie List for Customer after remove:");
		try {
			favoritesDao.removeFavoriteMovies(1, 2L);
			favoritesDao.removeFavoriteMovies(1, 5L);

			List<Movies> moviesListCustomer = (List<Movies>) favoritesDao.getAllFavoriteMovies(1);

			for (Movies movies : moviesListCustomer) {
				System.out.println(movies);
			}
			System.out.println("No. of fav : " + moviesListCustomer.size());
		} catch (FavoritesEmptyException e) {
			System.out.println(e.getMessage());
		}
	}

	public static void testGetAllFavoriteMovies() {

	}

	public static void main(String[] args) throws FavoritesEmptyException {

		testAddFavoriteMovies();
		testRemoveFavoriteMovies();
		testGetAllFavoriteMovies();
	}

}
