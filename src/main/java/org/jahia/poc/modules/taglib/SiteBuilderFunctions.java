package org.jahia.poc.modules.taglib;

import org.apache.commons.io.IOUtils;
import org.apache.commons.lang.StringUtils;
import org.jahia.api.Constants;
import org.jahia.poc.modules.html.HtmlElement;
import org.jahia.services.content.JCRNodeWrapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class SiteBuilderFunctions {
    private static final Logger logger = LoggerFactory.getLogger(SiteBuilderFunctions.class);;

    public static List<HtmlElement> getHtmlSource(JCRNodeWrapper node) {
        List<HtmlElement> output = new ArrayList<>();
        try {
            InputStream stream = node.getProperty("source").getNode().getNodes().nextNode().getProperty(Constants.JCR_DATA).getBinary().getStream();
            String html = IOUtils.toString(stream, StandardCharsets.UTF_8.name());

            Arrays.stream(StringUtils.splitByWholeSeparator(html, "<AREA")).forEach(fragment -> {
                String areaName = StringUtils.substringBefore(fragment, "/>").trim();
                if (output.isEmpty()) {
                    output.add(new HtmlElement("", "", fragment));
                } else {
                    output.add(new HtmlElement(areaName, "area", StringUtils.substringAfter(fragment, "/>")));
                }
            });



        } catch (Exception e) {
            logger.warn("unable to extract html from {}", node.getPath());
        }
        return output;
    }
}
