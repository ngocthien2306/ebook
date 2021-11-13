package com.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.*;

import org.hibernate.annotations.Type;

@Entity
@Table(name = "product")
public class Product implements Serializable {

	@ManyToMany
	@JoinTable(name = "product_category", joinColumns = @JoinColumn(name = "productId", referencedColumnName = "id"), inverseJoinColumns = @JoinColumn(name = "categoryId", referencedColumnName = "id"))
	private List<Category> categorys;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	public int id;
	public String codeProduct;
	public String nameAuthor;
	@Type(type = "text")
	public String description;
	public String name;
	public String NXB;
	public String supplier;
	public int price;
	public String pictureUrl;
	public String Sku;
	public String typeBook;

	public Product(String codeProduct, String name, String nameAuthor, String des, String nxb, String supplier,
			String pictureUrl, String sku, String typeBook, int price) {
		this.codeProduct = codeProduct;
		this.nameAuthor = nameAuthor;
		this.name = name;
		this.description = des;
		this.NXB = nxb;
		this.supplier = supplier;
		this.pictureUrl = pictureUrl;
		this.Sku = sku;
		this.typeBook = typeBook;
		this.price = price;
	}

	public Product(String codeProduct, String productName, String nameAuthor, String description, int price,
			String typeBook) {
		super();
		this.codeProduct = codeProduct;
		this.name = productName;
		this.nameAuthor = nameAuthor;
		this.description = description;
		this.price = price;
		this.typeBook = typeBook;
	}

	


	public Product(int id, String nameAuthor, String description, String name, String nXB, String supplier, int price) {
		super();
		this.id = id;
		this.nameAuthor = nameAuthor;
		this.description = description;
		this.name = name;
		NXB = nXB;
		this.supplier = supplier;
		this.price = price;
	}

	public Product() {

	}

	public Product(String nameAuthor, String description, int price, String type) {
		super();
		this.nameAuthor = nameAuthor;
		this.description = description;
		this.price = price;
		this.typeBook = type;

	}

	public List<Category> getCategorys() {
		return categorys;
	}

	public void setCategorys(List<Category> categorys) {
		this.categorys = categorys;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCodeProduct() {
		return codeProduct;
	}

	public void setCodeProduct(String codeProduct) {
		this.codeProduct = codeProduct;
	}

	public String getNameAuthor() {
		return nameAuthor;
	}

	public void setNameAuthor(String nameAuthor) {
		this.nameAuthor = nameAuthor;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getPictureUrl() {
		return pictureUrl;
	}

	public void setPictureUrl(String pictureUrl) {
		this.pictureUrl = pictureUrl;
	}

	public String getSku() {
		return Sku;
	}

	public void setSku(String sku) {
		Sku = sku;
	}

	public String getTypeBook() {
		return typeBook;
	}

	public void setTypeBook(String typeBook) {
		this.typeBook = typeBook;
	}

	public void setProductName(String productName) {
		this.name = productName;
	}

	public String getProductName() {
		return this.name;
	}

	public String getNXB() {
		return this.NXB;
	}

	public void setNXB(String nxb) {
		this.NXB = nxb;
	}

	public String getSupplier() {
		return this.supplier;
	}

	public void setSupplier(String supplier) {
		this.supplier = supplier;
	}
}
