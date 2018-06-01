package generatePDF;

import org.apache.fop.apps.*;

import javax.xml.transform.*;
import javax.xml.transform.sax.SAXResult;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URI;

public class GeneratePDF {

	public static final String RESOURCES_DIR;
	public static final String OUTPUT_DIR;

	static {
		RESOURCES_DIR = "src//main//resources//";
		OUTPUT_DIR = "src//main//resources//output//";
	}

	public static void main(String[] args) throws Exception {

		GeneratePDF test3Demo = new GeneratePDF();
		try {
			test3Demo.convertToPDF();
			//test3Demo.convertToFO();
			//test3Demo.convertPDFFromFO();

		} catch (FOPException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (TransformerException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		/*
		 * FileOutputStream outputStream = new FileOutputStream("test.pdf"); File
		 * templateFile = new File("D:\\Temp\\xhtml-to-xslfo.xsl"); File sourceFile =
		 * new File("D:\\Temp\\Employees.xml");
		 * 
		 * final Source xmlSource = new StreamSource(sourceFile); final Source
		 * sourceTemplate = new StreamSource(templateFile);
		 * 
		 * // version 1.0 of getting factory // final FopFactory fopFactory =
		 * FopFactory.newInstance();
		 * 
		 * // version 2.1 of getting factory FopFactoryBuilder builder = new
		 * FopFactoryBuilder(new URI("http://google.com"));
		 * builder.setSourceResolution(96); FopFactory fopFactory = builder.build();
		 * 
		 * final FOUserAgent foUserAgent = fopFactory.newFOUserAgent(); Fop fop; try {
		 * fop = fopFactory.newFop(MimeConstants.MIME_PDF, foUserAgent, outputStream);
		 * 
		 * final TransformerFactory factory = TransformerFactory.newInstance();
		 * Transformer transformer = factory.newTransformer(sourceTemplate);
		 * 
		 * final Result result = new SAXResult(fop.getDefaultHandler());
		 * transformer.transform(xmlSource, result);
		 * 
		 * outputStream.flush();
		 * 
		 * } catch (final Exception exp) { throw new
		 * RuntimeException("Error creating PDF", exp); }
		 */

	}

	/**
	 * Method that will convert the given XML to PDF
	 * 
	 * @throws IOException
	 * @throws FOPException
	 * @throws TransformerException
	 */
	public void convertToPDF() throws IOException, FOPException, TransformerException {
		// the XSL FO file
		//File xsltFile = new File(RESOURCES_DIR + "//xhtml-to-xslfo.xsl");
		File xsltFile = new File(RESOURCES_DIR + "//readme.xsl");
		// the XML file which provides the input
		//StreamSource xmlSource = new StreamSource(new File(RESOURCES_DIR + "//Employees.xml"));
		StreamSource xmlSource = new StreamSource(new File(RESOURCES_DIR + "//name.xml"));
		// create an instance of fop factory
		FopFactory fopFactory = FopFactory.newInstance(new File(".").toURI());
		// a user agent is needed for transformation
		FOUserAgent foUserAgent = fopFactory.newFOUserAgent();
		// Setup output
		OutputStream out;
		out = new java.io.FileOutputStream(OUTPUT_DIR + "//readme.pdf");

		try {
			// Construct fop with desired output format
			Fop fop = fopFactory.newFop(MimeConstants.MIME_PDF, foUserAgent, out);

			// Setup XSLT
			TransformerFactory factory = TransformerFactory.newInstance();
			Transformer transformer = factory.newTransformer(new StreamSource(xsltFile));

			// Resulting SAX events (the generated FO) must be piped through to FOP
			Result res = new SAXResult(fop.getDefaultHandler());

			// Start XSLT transformation and FOP processing
			// That's where the XML is first transformed to XSL-FO and then
			// PDF is created
			transformer.transform(xmlSource, res);
		} finally {
			out.close();
		}
	}

	/**
	 * This method will convert the given XML to XSL-FO
	 * 
	 * @throws IOException
	 * @throws FOPException
	 * @throws TransformerException
	 */
	public void convertToFO() throws IOException, FOPException, TransformerException {
		// the XSL FO file
		File xsltFile = new File(RESOURCES_DIR + "//xhtml-to-xslfo.xsl");

		/*
		 * TransformerFactory factory = TransformerFactory.newInstance(); Transformer
		 * transformer = factory.newTransformer(new StreamSource
		 * ("F:\\Temp\\template.xsl"));
		 */

		// the XML file which provides the input
		StreamSource xmlSource = new StreamSource(new File(RESOURCES_DIR + "//Employees.xml"));
		// a user agent is needed for transformation
		/* FOUserAgent foUserAgent = fopFactory.newFOUserAgent(); */
		// Setup output
		OutputStream out;

		out = new java.io.FileOutputStream(OUTPUT_DIR + "temp.fo");

		try {
			// Setup XSLT
			TransformerFactory factory = TransformerFactory.newInstance();
			Transformer transformer = factory.newTransformer(new StreamSource(xsltFile));

			// Resulting SAX events (the generated FO) must be piped through to FOP
			// Result res = new SAXResult(fop.getDefaultHandler());

			Result res = new StreamResult(out);

			// Start XSLT transformation and FOP processing
			// That's where the XML is first transformed to XSL-FO and then
			// PDF is created
			transformer.transform(xmlSource, res);
		} finally {
			out.close();
		}
	}

	/**
	 * @throws IOException
	 * @throws FOPException
	 * @throws TransformerException
	 */
	public void convertPDFFromFO() throws IOException, FOPException, TransformerException {
		// FopFactory fopFactory = FopFactory.newInstance(new File(RESOURCES_DIR +
		// "//conf//fop.xconf"));
		FopFactory fopFactory = FopFactory.newInstance(new File(".").toURI());
		// Step 2: Set up output stream.
		// Note: Using BufferedOutputStream for performance reasons (helpful with
		// FileOutputStreams).
		OutputStream out = new BufferedOutputStream(new FileOutputStream(new File(OUTPUT_DIR + "//temp.pdf")));

		try {
			// Step 3: Construct fop with desired output format
			Fop fop = fopFactory.newFop(MimeConstants.MIME_PDF, out);

			// Step 4: Setup JAXP using identity transformer
			TransformerFactory factory = TransformerFactory.newInstance();
			Transformer transformer = factory.newTransformer(); // identity transformer

			// Step 5: Setup input and output for XSLT transformation
			// Setup input stream
			Source src = new StreamSource(new File(OUTPUT_DIR + "//readme.fo"));

			// Resulting SAX events (the generated FO) must be piped through to FOP
			Result res = new SAXResult(fop.getDefaultHandler());

			// Step 6: Start XSLT transformation and FOP processing
			transformer.transform(src, res);

		} finally {
			// Clean-up
			out.close();
		}
	}
}