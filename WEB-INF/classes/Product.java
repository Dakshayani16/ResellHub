public class Product {
    private int productId;
    private String productName;
    private String description;
    private double price;
    private byte[] imageBytes;

    public Product(int productId, String productName, String description, double price, byte[] imageBytes) {
        this.productId = productId;
        this.productName = productName;
        this.description = description;
        this.price = price;
        this.imageBytes = imageBytes;
    }

    // Getters and setters
    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public byte[] getImageBytes() {
        return imageBytes;
    }

    public void setImageBytes(byte[] imageBytes) {
        this.imageBytes = imageBytes;
    }
}
