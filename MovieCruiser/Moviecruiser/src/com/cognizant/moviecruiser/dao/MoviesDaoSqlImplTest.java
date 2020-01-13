package com.cognizant.moviecruiser.dao;

import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import com.cognizant.moviecruiser.model.Movies;
import com.cognizant.moviecruiser.util.DateUtil;

public class MoviesDaoSqlImplTest {

	public static void testGetMoviesListAdmin() {

		System.out.println("Movies List Admin");
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
		ArrayList<Movies> moviesList = new MoviesDaoSqlImpl().getMoviesListAdmin();
		System.out.format("%-10s%-20s%-30s%-15s%-15s%-15s%-10s", "Id", "Title", "Gross", "Active", "Date of Launch",
				"Genre", "Has Teaser");
		String active;
		String hasTeaser;
		for (Movies movies : moviesList) {
			if (movies.getActive() == true) {
				active = "Yes";
			} else {
				active = "No";
			}
			if (movies.getHasTeaser() == true) {
				hasTeaser = "Yes";
			} else {
				hasTeaser = "No";
			}

			System.out.format("\n%-10s%-20s%-30s%-15s%-15s%-15s%-10s", movies.getId(), movies.getTitle(),
					movies.getGross(), active, sdf.format(movies.getDateOfLaunch()), movies.getGenre(),
					hasTeaser);
		}
	}


	public static void testGetMoviesListCustomer() {

		System.out.println("\n\nMovies List Customer");
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
		ArrayList<Movies> moviesList = new MoviesDaoSqlImpl().getMoviesListCustomer();
		System.out.format("%-10s%-20s%-25s%-15s%-15s%-15s%-10s", "Id", "Title", "Gross", "Active", "Date of Launch",
				"Genre", "Has Teaser");
		String active;
		String hasTeaser;
		for (Movies movies : moviesList) {
			if (movies.getActive() == true) {
				active = "Yes";
			} else {
				active = "No";
			}
			if (movies.getHasTeaser() == true) {
				hasTeaser = "Yes";
			} else {
				hasTeaser = "No";
			}

			System.out.format("\n%-10s%-20s%-25s%-15s%-15s%-15s%-10s", movies.getId(), movies.getTitle(),
					movies.getGross(), active , sdf.format(movies.getDateOfLaunch()), movies.getGenre(),
					hasTeaser );
		}
	}

	public static void testModifyMovies() {
		Movies movies = new Movies(4L, "The Medallion", 1253654789L, true, new DateUtil().convertToDate("12/12/2020"),
				"Fantasy", true);
		MoviesDaoSqlImpl moviesDaoSqlImpl = new MoviesDaoSqlImpl();
		moviesDaoSqlImpl.modifyMovies(movies);
		System.out.println("\n\nModified Set of Movies");
	}

	public static void main(String[] args) throws SQLException, NumberFormatException, IOException {
		testGetMoviesListAdmin();
		testGetMoviesListCustomer();
		testModifyMovies();
		testGetMoviesListAdmin();
	}
}
