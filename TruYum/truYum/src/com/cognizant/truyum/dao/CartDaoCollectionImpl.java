package com.cognizant.truyum.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.cognizant.truyum.model.Cart;
import com.cognizant.truyum.model.MenuItem;

public class CartDaoCollectionImpl implements CartDao {

	@SuppressWarnings("unused")
	private static HashMap<Long, Cart> userCarts;

	public CartDaoCollectionImpl() {
		super();
		// TODO Auto-generated constructor stub
		if (userCarts == null) {
			userCarts = new HashMap<>();
		}
	}

	@Override
	public void addCartItem(long userId, long menuItemId) {
		// TODO Auto-generated method stub
		MenuItemDao menuItemDao = new MenuItemDaoCollectionImpl();
		MenuItem menuItem = menuItemDao.getMenuItem(menuItemId);
		if (userCarts.containsKey(userId)) {
			userCarts.get(userId).getMenuItemList().add(menuItem);
		} else {
			Cart cart = new Cart();
			ArrayList<MenuItem> menuItemList = new ArrayList<>();
			menuItemList.add(menuItem);
			cart.setMenuItemList(menuItemList);
			userCarts.put(userId, cart);
		}
	}

	@Override
	public Cart getAllCartItems(long userId) throws CartEmptyException {
		
		//List<MenuItem> menuItemList = userCarts.get(userId).getMenuItemList();
		Cart cart = userCarts.get(userId);
		double total = 0.0;
		if (cart == null || cart.getMenuItemList().isEmpty()) {
			throw new CartEmptyException();
		} 
		List<MenuItem> menuItemList=cart.getMenuItemList();
			for (MenuItem menuItem : menuItemList) {
				total += menuItem.getPrice();
			}
		
		cart.setTotal(total);
		return cart;
	}

	@Override
	public void removeCartItem(long userId, long menuItemId) {
		// TODO Auto-generated method stub
		List<MenuItem> menuItemList = userCarts.get(userId).getMenuItemList();
		for (int i = 0; i < menuItemList.size(); i++) {
			if (menuItemList.get(i).getId() == menuItemId) {
				menuItemList.remove(i);
				return;
			}
		}
	}
}
