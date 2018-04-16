package com.music.action;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.music.dao.CustomerDao;
import com.music.dao.SongsDao;
import com.music.dao.OrderDao;
import com.music.model.*;
import com.opensymphony.xwork2.ActionSupport;

	@Controller @Scope("prototype")
	public class OrderAction extends ActionSupport{
		
		 
	    @Resource OrderDao orderDao;
	    @Resource CustomerDao customerDao;
	    @Resource SongsDao songsDao;
	    
	    private Music_order order;
	    private List<Music_order> orderList;
	    private Music_customer customer;
	    private Songs song;
	    
		public Music_order getOrder() {
			return order;
		}

		public void setOrder(Music_order order) {
			this.order = order;
		}
		
		public List<Music_order> getOrderList() {
			return orderList;
		}

		public void setOrderList(List<Music_order> orderList) {
			this.orderList = orderList;
		}

		public Music_customer getCustomer() {
			return customer;
		}

		public void setCustomer(Music_customer customer) {
			this.customer = customer;
		}

		public Songs getSong() {
			return song;
		}

		public void setSong(Songs song) {
			this.song = song;
		}
		
		
		public String addOrder() throws Exception{
			//Customer customer = new Customer();
			//customer = customerDao.QueryCustomerInfo(customer.getName()).get(0);
			ArrayList<Music_customer> customer_list = customerDao.QueryCustomerInfo(customer.getName());
			System.out.println(customer.getName());
			if (customer_list != null) {
				customer = customer_list.get(0);
				Music_order ord =new Music_order();
				ord.setMusic_customer(customer);
				ord.setSongs(song);
				
				ord.setSongnum(1);
				ord.setTotal(songsDao.GetSongById(song.getSongid()).getPrice()*1);
					orderDao.AddOrder(ord);
			}
			  
			return "order_message";
		}
		
		
	    public String showOrder() {
	    //	System.out.println(customer.getName());
	    	ArrayList<Music_customer> customer_list = customerDao.QueryCustomerInfo(customer.getName());
	    	if (customer_list != null) {
	    		Music_customer cus= customer_list.get(0);
		        
		        orderList = orderDao.QueryOrderInfo(cus,null);

	    	}
		    return "show_view";
	    }

	    
	    public String showDetail() {
	    	System.out.print(order.getOrderid());
	    	order = orderDao.GetOrderById(order.getOrderid());
	        return "detail_view";
	    }
	    
	    
	    public String showEdit() throws Exception {
	    	order = orderDao.GetOrderById(order.getOrderid());
	        return "edit_view";
	    }

	   
	    public String editOrder() throws Exception {
	    	orderDao.UpdateOrder(order);
	        return "edit_message";
	    }
	    
	    
	    public String deleteOrder() throws Exception {
	    	orderDao.DeleteOrder(song.getSongid());
	        return "delete_message";
	    }
	    
	    
	    public String queryOrders() throws Exception {
	    	orderList = orderDao.QueryOrderInfo(customer,song);
	        return "show_view";
	    }


	
}