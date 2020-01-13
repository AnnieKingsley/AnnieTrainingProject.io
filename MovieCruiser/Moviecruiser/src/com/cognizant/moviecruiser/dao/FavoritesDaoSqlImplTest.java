package com.cognizant.moviecruiser.dao;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
//import java.sql.Connection;
//import java.sql.SQLException;

import com.cognizant.moviecruiser.model.Favorites;

public class FavoritesDaoSqlImplTest {

	public static void testAddFavoriteMovies() {

		FavoritesDao favoritesDao = new FavoritesDaoSqlImpl();
		favoritesDao.addFavoriteMovies(1L, 1);
		System.out.println("Done");
	}

	public static void testGetAllFavoriteMovies() throws FavoritesEmptyException {

		FavoritesDaoSqlImpl FavoritesDaoSqlImpl = new FavoritesDaoSqlImpl();
		Favorites favorites = FavoritesDaoSqlImpl.getAllFavoriteMovies(1L);
		System.out.println(favorites.getMoviesList());
		System.out.println("Total no.of. favorites: " + favorites.getTotal());
	}

	public static void testRemoveFavoriteMovies() throws NumberFormatException, IOException {

		BufferedReader bf = new BufferedReader(new InputStreamReader(System.in));
		System.out.println("Enter user id");
		long userId = Long.parseLong(bf.readLine());
		System.out.println("Enter user movies id");
		long moviesId = Long.parseLong(bf.readLine());

		new FavoritesDaoSqlImpl().removeFavoriteMovies(userId, moviesId);

	}

	public static void main(String[] args) throws NumberFormatException, IOException, FavoritesEmptyException {
		//testAddFavoriteMovies();
		 testGetAllFavoriteMovies();
		//testRemoveFavoriteMovies();
	

	}

}
