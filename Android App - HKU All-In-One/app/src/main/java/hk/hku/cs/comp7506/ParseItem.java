package hk.hku.cs.comp7506;

public class ParseItem {
    private String title;
    private String detailUrl;

    public ParseItem(){
    }

    public ParseItem(String title, String detailUrl) {
        this.title = title;
        this.detailUrl = detailUrl;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDetailUrl() {
        return detailUrl;
    }

    public void setDetailUrl(String detailUrl) {
        this.detailUrl = detailUrl;
    }
}
