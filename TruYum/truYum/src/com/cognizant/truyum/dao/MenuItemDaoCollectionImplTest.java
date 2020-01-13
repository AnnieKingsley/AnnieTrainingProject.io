
package com.cognizant.truyum.dao;

import java.util.List;

import com.cognizant.truyum.model.MenuItem;

import com.cognizant.truyum.util.DateUtil;

public class MenuItemDaoCollectionImplTest {

	public static void testGetMenuItemListAdmin() {

		List<MenuItem> menuItemList = new MenuItemDaoCollectionImpl().getMenuItemListAdmin();
		for (MenuItem menuItem : menuItemList) {
			// System.out.println(menuItem);
			System.out.println(new DateUtil().convertToString(menuItem.getDateOfLaunch()));
		}
	}

	public static void testGetMenuItemListCustomer() {
		System.out.println("Item List For Customer");
		@SuppressWarnings("unused")
		MenuItemDao menuItemDao = new MenuItemDaoCollectionImpl();
		List<MenuItem> menuItemList = new MenuItemDaoCollectionImpl().getMenuItemListCustomer();
		for (MenuItem menuItem : menuItemList) {
			System.out.println(menuItem);
		}
	}

	public static void testModifyMenuItem() {

		MenuItem item = new MenuItem(5L, "Chocolate Brownie", 52.00f, true, new DateUtil().convertToDate("02/12/2022"),
				"Main Course", true);
		MenuItemDao menuItemDao = new MenuItemDaoCollectionImpl();
		menuItemDao.modifyMenuItem(item);
		System.out.println("***Modified List***");
		testGetMenuItemListAdmin();
		MenuItem modified_item = menuItemDao.getMenuItem(item.getId());
		System.out.println("Modified item detail\n" + modified_item);
	}

	public static void main(String[] args) {
		testGetMenuItemListAdmin();
		testGetMenuItemListCustomer();
		testModifyMenuItem();

	}
}
