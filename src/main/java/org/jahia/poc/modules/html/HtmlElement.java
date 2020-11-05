package org.jahia.poc.modules.html;

/**
 * Representation of an html element use to build the jsp
 */
public class HtmlElement {
    private String name;
    private String type;
    private String html;

    public HtmlElement(String name, String type, String html) {
        this.name = name;
        this.type = type;
        this.html = html;
    }

    public String getName() {
        return name;
    }

    public String getType() {
        return type;
    }

    public String getHtml() {
        return html;
    }
}
