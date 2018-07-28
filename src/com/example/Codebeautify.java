package com.example;

import java.util.ArrayList;

import org.codehaus.jackson.annotate.JsonProperty;

import com.google.gson.annotations.SerializedName;

public class Codebeautify {
	
	@JsonProperty("productBaseInfoV1")
	ProductBaseInfoV1 productBaseInfoV1;
	
	ProductShippingInfoV1 productShippingInfoV1;
	CategorySpecificInfoV1 categorySpecificInfoV1;

	// Getter Methods

	public ProductBaseInfoV1 getProductBaseInfoV1() {
		return productBaseInfoV1;
	}

	public ProductShippingInfoV1 getProductShippingInfoV1() {
		return productShippingInfoV1;
	}

	public CategorySpecificInfoV1 getCategorySpecificInfoV1() {
		return categorySpecificInfoV1;
	}

	// Setter Methods

	public void setProductBaseInfoV1(ProductBaseInfoV1 productBaseInfoV1) {
		this.productBaseInfoV1 = productBaseInfoV1;
	}

	public void setProductShippingInfoV1(ProductShippingInfoV1 productShippingInfoV1) {
		this.productShippingInfoV1 = productShippingInfoV1;
	}

	public void setCategorySpecificInfoV1(CategorySpecificInfoV1 categorySpecificInfoV1) {
		this.categorySpecificInfoV1 = categorySpecificInfoV1;
	}
	public class CategorySpecificInfoV1 {
 		ArrayList<Object> detailedSpecs = new ArrayList<Object>();
		ArrayList<Object> specificationList = new ArrayList<Object>();
		BooksInfo booksInfo;
		LifeStyleInfo lifeStyleInfo;

		// Getter Methods

		public ArrayList<Object> robject () 
		{
			return detailedSpecs;
		}
		
		public ArrayList<Object> specilist () 
		{
			return specificationList;
		}
		
		public BooksInfo getBooksInfo() {
			return booksInfo;
		}

		public LifeStyleInfo getLifeStyleInfo() {
			return lifeStyleInfo;
		}

		// Setter Methods

		public void setBooksInfo(BooksInfo booksInfo) {
			this.booksInfo = booksInfo;
		}

		public void setLifeStyleInfo(LifeStyleInfo lifeStyleInfo) {
			this.lifeStyleInfo = lifeStyleInfo;
		}
	}

	public class LifeStyleInfo {
		private String sleeve = null;
		private String neck = null;
		private String idealFor = null;

		// Getter Methods

		public String getSleeve() {
			return sleeve;
		}

		public String getNeck() {
			return neck;
		}

		public String getIdealFor() {
			return idealFor;
		}

		// Setter Methods

		public void setSleeve(String sleeve) {
			this.sleeve = sleeve;
		}

		public void setNeck(String neck) {
			this.neck = neck;
		}

		public void setIdealFor(String idealFor) {
			this.idealFor = idealFor;
		}
	}

	public class BooksInfo {
		private String language = null;
		private String binding = null;
		private String pages = null;
		private String publisher = null;
		private float year;
		ArrayList<Object> authors = new ArrayList<Object>();

		// Getter Methods

		public ArrayList<Object> rauthor()
		{
			return authors;
		}
		
		public String getLanguage() {
			return language;
		}

		public String getBinding() {
			return binding;
		}

		public String getPages() {
			return pages;
		}

		public String getPublisher() {
			return publisher;
		}

		public float getYear() {
			return year;
		}

		// Setter Methods

		public void setLanguage(String language) {
			this.language = language;
		}

		public void setBinding(String binding) {
			this.binding = binding;
		}

		public void setPages(String pages) {
			this.pages = pages;
		}

		public void setPublisher(String publisher) {
			this.publisher = publisher;
		}

		public void setYear(float year) {
			this.year = year;
		}
	}

	public class ProductShippingInfoV1 {
		ShippingCharges shippingCharges;
		private String estimatedDeliveryTime;
		private String sellerName;
		private float sellerAverageRating;
		private float sellerNoOfRatings;
		private float sellerNoOfReviews;

		// Getter Methods

		public ShippingCharges getShippingCharges() {
			return shippingCharges;
		}

		public String getEstimatedDeliveryTime() {
			return estimatedDeliveryTime;
		}

		public String getSellerName() {
			return sellerName;
		}

		public float getSellerAverageRating() {
			return sellerAverageRating;
		}

		public float getSellerNoOfRatings() {
			return sellerNoOfRatings;
		}

		public float getSellerNoOfReviews() {
			return sellerNoOfReviews;
		}

		// Setter Methods

		public void setShippingCharges(ShippingCharges shippingCharges) {
			this.shippingCharges = shippingCharges;
		}

		public void setEstimatedDeliveryTime(String estimatedDeliveryTime) {
			this.estimatedDeliveryTime = estimatedDeliveryTime;
		}

		public void setSellerName(String sellerName) {
			this.sellerName = sellerName;
		}

		public void setSellerAverageRating(float sellerAverageRating) {
			this.sellerAverageRating = sellerAverageRating;
		}

		public void setSellerNoOfRatings(float sellerNoOfRatings) {
			this.sellerNoOfRatings = sellerNoOfRatings;
		}

		public void setSellerNoOfReviews(float sellerNoOfReviews) {
			this.sellerNoOfReviews = sellerNoOfReviews;
		}
	}

	public class ShippingCharges {
		private float amount;
		private String currency;

		// Getter Methods

		public float getAmount() {
			return amount;
		}

		public String getCurrency() {
			return currency;
		}

		// Setter Methods

		public void setAmount(float amount) {
			this.amount = amount;
		}

		public void setCurrency(String currency) {
			this.currency = currency;
		}
	}

	public class ProductBaseInfoV1 {
		private String productId;
		private String title;
		private String productDescription;
		ImageUrls imageUrls;
		ArrayList<Object> productFamily = new ArrayList<Object>();
		MaximumRetailPrice maximumRetailPrice;
		FlipkartSellingPrice flipkartSellingPrice;
		FlipkartSpecialPrice flipkartSpecialPrice;
		private String productUrl;
		private String productBrand;
		private boolean inStock;
		private boolean codAvailable;
		private float discountPercentage;
		ArrayList<Object> offers = new ArrayList<Object>();
		private String categoryPath;
		Attributes attributes;
	

		// Getter Methods
		
		public ArrayList<Object> roffers () 
		{
			return offers;
		}
		
		public String getProductId() {
			return productId;
		}

		public String getTitle() {
			return title;
		}

		public String getProductDescription() {
			return productDescription;
		}

		public ImageUrls getImageUrls() {
			return imageUrls;
		}

		public MaximumRetailPrice getMaximumRetailPrice() {
			return maximumRetailPrice;
		}

		public FlipkartSellingPrice getFlipkartSellingPrice() {
			return flipkartSellingPrice;
		}

		public FlipkartSpecialPrice getFlipkartSpecialPrice() {
			return flipkartSpecialPrice;
		}

		public String getProductUrl() {
			return productUrl;
		}

		public String getProductBrand() {
			return productBrand;
		}

		public boolean getInStock() {
			return inStock;
		}

		public boolean getCodAvailable() {
			return codAvailable;
		}

		public float getDiscountPercentage() {
			return discountPercentage;
		}

		public String getCategoryPath() {
			return categoryPath;
		}

		public Attributes getAttributes() {
			return attributes;
		}

		// Setter Methods

		public void setProductId(String productId) {
			this.productId = productId;
		}

		public void setTitle(String title) {
			this.title = title;
		}

		public void setProductDescription(String productDescription) {
			this.productDescription = productDescription;
		}

		public void setImageUrls(ImageUrls imageUrls) {
			this.imageUrls = imageUrls;
		}

		public void setMaximumRetailPrice(MaximumRetailPrice maximumRetailPrice) {
			this.maximumRetailPrice = maximumRetailPrice;
		}

		public void setFlipkartSellingPrice(FlipkartSellingPrice flipkartSellingPrice) {
			this.flipkartSellingPrice = flipkartSellingPrice;
		}

		public void setFlipkartSpecialPrice(FlipkartSpecialPrice flipkartSpecialPrice) {
			this.flipkartSpecialPrice = flipkartSpecialPrice;
		}

		public void setProductUrl(String productUrl) {
			this.productUrl = productUrl;
		}

		public void setProductBrand(String productBrand) {
			this.productBrand = productBrand;
		}

		public void setInStock(boolean inStock) {
			this.inStock = inStock;
		}

		public void setCodAvailable(boolean codAvailable) {
			this.codAvailable = codAvailable;
		}

		public void setDiscountPercentage(float discountPercentage) {
			this.discountPercentage = discountPercentage;
		}

		public void setCategoryPath(String categoryPath) {
			this.categoryPath = categoryPath;
		}

		public void setAttributes(Attributes attributes) {
			this.attributes = attributes;
		}
	}

	public class Attributes {
		private String size;
		private String color;
		private String storage;
		private String sizeUnit;
		private String displaySize;

		// Getter Methods

		public String getSize() {
			return size;
		}

		public String getColor() {
			return color;
		}

		public String getStorage() {
			return storage;
		}

		public String getSizeUnit() {
			return sizeUnit;
		}

		public String getDisplaySize() {
			return displaySize;
		}

		// Setter Methods

		public void setSize(String size) {
			this.size = size;
		}

		public void setColor(String color) {
			this.color = color;
		}

		public void setStorage(String storage) {
			this.storage = storage;
		}

		public void setSizeUnit(String sizeUnit) {
			this.sizeUnit = sizeUnit;
		}

		public void setDisplaySize(String displaySize) {
			this.displaySize = displaySize;
		}
	}

	public class FlipkartSpecialPrice {
		private float amount;
		private String currency;

		// Getter Methods

		public float getAmount() {
			return amount;
		}

		public String getCurrency() {
			return currency;
		}

		// Setter Methods

		public void setAmount(float amount) {
			this.amount = amount;
		}

		public void setCurrency(String currency) {
			this.currency = currency;
		}
	}

	public class FlipkartSellingPrice {
		private float amount;
		private String currency;

		// Getter Methods

		public float getAmount() {
			return amount;
		}

		public String getCurrency() {
			return currency;
		}

		// Setter Methods

		public void setAmount(float amount) {
			this.amount = amount;
		}

		public void setCurrency(String currency) {
			this.currency = currency;
		}
	}

	public class MaximumRetailPrice {
		private float amount;
		private String currency;

		// Getter Methods

		public float getAmount() {
			return amount;
		}

		public String getCurrency() {
			return currency;
		}

		// Setter Methods

		public void setAmount(float amount) {
			this.amount = amount;
		}

		public void setCurrency(String currency) {
			this.currency = currency;
		}
	}

	public class ImageUrls {

		@SerializedName("200x200")
		private String _200_x200;
		@SerializedName("400x400")
		private String _400_x400;
		@SerializedName("800x800")
		private String _800_x800;

		public String get_200_x200() {
			return _200_x200;
		}

		public void set_200_x200(String _200_x200) {
			this._200_x200 = _200_x200;
		}

		public String get_400_x400() {
			return _400_x400;
		}

		public void set_400_x400(String _400_x400) {
			this._400_x400 = _400_x400;
		}

		public String get_800_x800() {
			return _800_x800;
		}

		public void set_800_x800(String _800_x800) {
			this._800_x800 = _800_x800;
		}

	}
}

