package com.cognizant.truyum.dao;

import java.util.List;

import com.cognizant.truyum.model.MenuItem;

public class CartDaoCollectionImplTest {

	@SuppressWarnings("unchecked")
	public static void testAddCartItem() throws CartEmptyException {
		CartDao cartDao = new CartDaoCollectionImpl();
		cartDao.addCartItem(1, 2L);
		cartDao.addCartItem(1, 5L);
		cartDao.addCartItem(2, 1L);
		cartDao.addCartItem(2, 3L);
		List<MenuItem> menuItemListCustomer = (List<MenuItem>) cartDao.getAllCartItems(1);
		System.out.println("User Added Cart List for CheckOut");
		for (MenuItem menuItem : menuItemListCustomer) {
			System.out.println(menuItem);
		}
	}

	@SuppressWarnings("unchecked")
	public static void testRemoveCartItem() throws CartEmptyException {
		CartDao cartDao = new CartDaoCollectionImpl();
		try {
			cartDao.removeCartItem(1, 2L);
			cartDao.removeCartItem(1, 5L);
			// cartDao.removeCartItem(1, 3L);
			List<MenuItem> menuItemListCustomer = (List<MenuItem>) cartDao.getAllCartItems(1);
			System.out.println("Item List for Customer after remove");
			for (MenuItem menuItem : menuItemListCustomer) {
				System.out.println(menuItem);
			}
		} catch (CartEmptyException e) {
			System.out.println(e);
		}
	}

	public static void testGetAllCartItems() {

	}

	public static void main(String[] args) throws CartEmptyException {

		testAddCartItem();
		testRemoveCartItem();
	}
}
