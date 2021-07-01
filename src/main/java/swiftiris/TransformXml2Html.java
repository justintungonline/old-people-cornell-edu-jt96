package swiftiris;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;
import java.util.logging.Logger;
import java.util.logging.Level;

/**
 * Use the TraX interface to perform a transformation in the simplest manner possible (3
 * statements).
 */
public class TransformXml2Html {
    private static final Logger LOGGER = Logger.getLogger(TransformXml2Html.class.getName());

    public static void main(String[] args) throws TransformerException,
            TransformerConfigurationException, FileNotFoundException, IOException {

        LOGGER.setLevel(Level.INFO);

        // Use the static TransformerFactory.newInstance() method to instantiate
        // a TransformerFactory. The javax.xml.transform.TransformerFactory
        // system property setting determines the actual class to instantiate --
        // org.apache.xalan.transformer.TransformerImpl.
        TransformerFactory tFactory = TransformerFactory.newInstance();

        // Use the TransformerFactory to instantiate a Transformer that will work with
        // the stylesheet you specify. This method call also processes the stylesheet
        // into a compiled Templates object.
        Transformer transformer =
                tFactory.newTransformer(new StreamSource("stylesheets/xml2html.xsl"));

        // Use the Transformer to apply the associated Templates object to an XML document
        // (index.xml) and write the output to a file (index.out).

        String[] elements = {"index", "siteinfo/index", "siteinfo/sitemap", "siteinfo/support",
                "resources/academic", "resources/articles", "resources/index", "resources/oscoms",
                "resources/projects/cs490/cs490", "resources/projects/cs501/cs501", "resources/projects/cs501/feasibility", 
                "resources/docs/essays", "resources/docs/texts", "explore/links", "explore/personalink", "explore/writeme", "aboutme/bio", "aboutme/coursework", "aboutme/index", "aboutme/interests", "aboutme/readinglist", "aboutme/resume" };
        for (String fileName : elements) {
            transformer.transform(new StreamSource(fileName + ".xml"),
                    new StreamResult(new FileOutputStream(fileName + ".html")));

            LOGGER.log(Level.INFO, "Transformed: {0}.xml to {0}.html", fileName);

        }

    }
}
