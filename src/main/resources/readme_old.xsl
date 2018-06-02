<?xml version="1.0" encoding="utf-8"?>

<!-- THIS IS NOT THE LATEST VERSION OF THE FOP DOCUMENTATION BUT ONLY AN 
	EXAMPLE FILE This files shows next to the trivial usage of fo:block and fo:inline 
	examples of - fo:basic-link external-destination - fo:basic-link internal-destination 
	- fo:table - fo:list-block (including a bullet from the font Symbol as list-item-label) 
	- fo:page-number-citation (computes dynamically the page number in section 
	'content') -->
<xsl:stylesheet version="1.1"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:fo="http://www.w3.org/1999/XSL/Format"
	exclude-result-prefixes="fo">
	<xsl:template match="/">

		<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
			<fo:layout-master-set>

				<!-- layout for the first page -->
				<fo:simple-page-master master-name="first"
					page-height="29.7cm" page-width="21cm" margin-top="1cm"
					margin-bottom="2cm" margin-left="2.5cm" margin-right="2.5cm">
					<fo:region-body margin-top="3cm" />
					<fo:region-before extent="3cm" />
					<fo:region-after extent="1.5cm" />
				</fo:simple-page-master>

				<!-- layout for the other pages -->
				<fo:simple-page-master master-name="rest"
					page-height="29.7cm" page-width="21cm" margin-top="1cm"
					margin-bottom="2cm" margin-left="2.5cm" margin-right="2.5cm">
					<fo:region-body margin-top="2.5cm" />
					<fo:region-before extent="2.5cm" />
					<fo:region-after extent="1.5cm" />
				</fo:simple-page-master>

				<fo:page-sequence-master
					master-name="basicPSM">
					<fo:repeatable-page-master-alternatives>
						<fo:conditional-page-master-reference
							master-reference="first" page-position="first" />
						<fo:conditional-page-master-reference
							master-reference="rest" page-position="rest" />
						<!-- recommended fallback procedure -->
						<fo:conditional-page-master-reference
							master-reference="rest" />
					</fo:repeatable-page-master-alternatives>
				</fo:page-sequence-master>

			</fo:layout-master-set>
			<!-- end: defines page layout -->

			<!-- actual layout -->
			<fo:page-sequence master-reference="basicPSM">


				<fo:static-content flow-name="xsl-region-before">
					<fo:block text-align="end" font-size="10pt"
						font-family="serif" line-height="14pt" color="red">
						This is not the latest Fop documentation, but just an fo example.
						FOP - p.
						<fo:page-number />
					</fo:block>
				</fo:static-content>


				<fo:flow flow-name="xsl-region-body">
					<fo:block font-size="18pt" font-family="sans-serif"
						line-height="24pt" space-after.optimum="15pt"
						background-color="blue" color="white" text-align="center"
						padding-top="3pt">FOP: An Open-Source XSL Formatter and Renderer
					</fo:block>
					<fo:block id="sec1" font-size="18pt" font-family="serif"
						line-height="20pt" space-before.optimum="20pt"
						space-after.optimum="14pt">A)
						What is FOP? Hello, <xsl:value-of select="name"/>!
					</fo:block>
					<fo:block space-after.optimum="3pt" font-family="serif">FOP is the
						world's first print formatter driven by XSL formatting
						objects. It is a Java 1.1 application that reads a formatting object
						tree and then turns it into a PDF document. The formatting object
						tree, can be in the form of an XML document (output by an XSLT
						engine
						like XT or Xalan) or can be passed in memory as a DOM Document or (in
						the case of XT) SAX events.

					</fo:block>
					<fo:block space-after.optimum="3pt" font-family="serif">
						FOP is part of Apache's XML Graphics Project. The homepage of FOP
						is
						<fo:inline font-style="italic" font-family="serif">
							<fo:basic-link color="blue"
								external-destination="http://xmlgraphics.apache.org/fop">http://xmlgraphics.apache.org/fop
							</fo:basic-link>
						</fo:inline>
					</fo:block>



					<fo:block id="sec2" font-size="18pt" font-family="serif"
						line-height="20pt" space-before.optimum="20pt"
						space-after.optimum="14pt">B)
						Downloading FOP
					</fo:block>
					<fo:block space-after.optimum="3pt" font-family="serif">
						The latest release version is
						<fo:inline font-style="italic" font-family="serif">FOP
							0.20.5
						</fo:inline>
						<fo:inline font-family="serif">
							()
						</fo:inline>
						.
					</fo:block>
					<fo:block space-after.optimum="3pt" font-family="serif">NOTE: you
						do not have to unjar or unzip this jar file.</fo:block>
					<fo:block space-after.optimum="3pt" font-family="serif">
						Documentation can be downloaded here as
						<fo:inline font-style="italic" font-family="serif">HMTL file
						</fo:inline>
						<fo:inline font-family="serif">
							()
						</fo:inline>
						or
						as
						<fo:inline font-style="italic" font-family="serif">PDF file
						</fo:inline>
						<fo:inline font-family="serif">
							()
						</fo:inline>
						.
					</fo:block>
					<fo:block space-after.optimum="3pt" font-family="serif">To run FOP
						from the command line, see Running FOP. If you are interested in
						embedding FOP in a Java application of your own, see Embedding
						FOP.
					</fo:block>
					<fo:block space-after.optimum="3pt" font-family="serif">
						You can also download the
						<fo:inline font-style="italic" font-family="serif">source code
							v. 0.20.5</fo:inline>
						<fo:inline font-family="serif">
							()
						</fo:inline>
						as jar file
					</fo:block>





					<fo:block id="sec3" font-size="18pt" font-family="serif"
						line-height="20pt" space-before.optimum="20pt"
						space-after.optimum="14pt">C)
						Running FOP
					</fo:block>

					<fo:block font-size="16pt" font-family="serif"
						line-height="18pt" space-before.optimum="8pt"
						space-after.optimum="8pt">1) Prerequisites</fo:block>
					<fo:block space-after.optimum="3pt" font-family="serif">Following
						software must be installed:</fo:block>
					<fo:block space-after.optimum="3pt" font-family="serif">a) Java
						1.1.x or later</fo:block>
					<fo:block space-after.optimum="3pt" font-family="serif">
						For the fo-file viewer mode of FOP (see below) you must have the
						swing classes installed.
						From Java 1.2 on (aka Java 2) they are part of the standard java
						distribution.
						If you use Java 1.1.x you must seperately include the swing classes,
						which can
						be found at the
						<fo:inline font-style="italic" font-family="serif">
							Sun website
						</fo:inline>
						<fo:inline font-family="serif">
							(http://java.sun.com/products/jfc/#download-swing)
						</fo:inline>
						.
					</fo:block>
					<fo:block space-after.optimum="3pt" font-family="serif">
						b) An XML parser which supports SAX and DOM like
						<fo:inline font-style="italic" font-family="serif">Xerces-J
						</fo:inline>
						<fo:inline font-family="serif">
							(http://xerces.apache.org/xerces-j/index.html)
						</fo:inline>
						.
					</fo:block>
					<fo:block space-after.optimum="3pt" font-family="serif">
						c) If you have to produce the flow objects files, which are the
						input for FOP,
						you need a transformation utility to create this files from your xml
						files.
						Normally this is an XSLT stylesheet processor like
						<fo:inline font-style="italic" font-family="serif">XT
						</fo:inline>
						<fo:inline font-family="serif">
							(http://www.jclark.com/xml/xt.html)
						</fo:inline>
						or
						<fo:inline font-style="italic" font-family="serif">XALAN
						</fo:inline>
						<fo:inline font-family="serif">
							(http://xalan.apache.org/index.html)
						</fo:inline>
						.
					</fo:block>


					<fo:block font-size="16pt" font-family="serif"
						line-height="18pt" space-before.optimum="8pt"
						space-after.optimum="8pt">2) Starting FOP as an standalone
						application</fo:block>
					<fo:block space-after.optimum="3pt" font-family="serif">There are
						three ways to run FOP from the command line.</fo:block>
					<fo:block space-after.optimum="3pt" font-family="serif">a) Batch
						processing formatting objects (fo) files: </fo:block>
					<fo:block font-size="10pt" font-family="monospace"
						line-height="12pt" space-before.optimum="0pt"
						space-after.optimum="0pt">java org.apache.fop.apps.CommandLine fo-file
						pdf-file</fo:block>
					<fo:block space-after.optimum="3pt" font-family="serif">b) Batch
						processing xml files (includes production of the fo-files):
					</fo:block>
					<fo:block font-size="10pt" font-family="monospace"
						line-height="12pt" space-before.optimum="0pt"
						space-after.optimum="0pt">java org.apache.fop.apps.CommandLine xml-file
						xsl-file pdf-file</fo:block>
					<fo:block space-after.optimum="3pt" font-family="serif">c)
						Previewing the fo-file:</fo:block>
					<fo:block font-size="10pt" font-family="monospace"
						line-height="12pt" space-before.optimum="0pt"
						space-after.optimum="0pt">java org.apache.fop.apps.AWTCommandLine
						fo-file</fo:block>
					<fo:block space-after.optimum="3pt" font-family="serif">Each
						method uses next to the fop classes other packages. The following
						describes
						each method in detail.
					</fo:block>

					<fo:block font-size="14pt" font-family="serif"
						line-height="16pt" space-before.optimum="8pt"
						space-after.optimum="4pt">a) Method One</fo:block>
					<fo:block space-after.optimum="3pt" font-family="serif">One is to
						first use an XSLT engine to produce the formatting object tree as
						an
						XML document and then running the class
						org.apache.fop.apps.CommandLine with the
						formatting object file name and PDF filename as arguments. You will need to
						include
						FOP and your XML Parser in your classpath and so you might invoke
					</fo:block>
					<fo:block font-size="10pt" font-family="monospace"
						line-height="12pt" space-before.optimum="0pt"
						space-after.optimum="0pt">java -cp fop_x_xx_x.jar;xerces.jar</fo:block>
					<fo:block font-size="10pt" font-family="monospace"
						line-height="12pt" space-before.optimum="0pt"
						space-after.optimum="0pt">org.apache.fop.apps.CommandLine fo-file
						pdf-file</fo:block>
					<fo:block space-after.optimum="3pt" font-family="serif">If your
						SAX Parser is other than Xerces, you will need to set the property
						org.xml.sax.parser to the SAX Parser class to use. The following
						example shows
						the command line, if you use XP, the XML parser from James Clark:
					</fo:block>
					<fo:block font-size="10pt" font-family="monospace"
						line-height="12pt" space-before.optimum="0pt"
						space-after.optimum="0pt">java
						-Dorg.xml.sax.parser=com.jclark.xml.sax.Driver</fo:block>
					<fo:block font-size="10pt" font-family="monospace"
						line-height="12pt" space-before.optimum="0pt"
						space-after.optimum="0pt">-cp
						fop_x_xx_x.jar;sax.jar;xt.jar;xp.jar;xerces.jar</fo:block>
					<fo:block font-size="10pt" font-family="monospace"
						line-height="12pt" space-before.optimum="0pt"
						space-after.optimum="0pt">org.apache.fop.apps.AWTCommandLine
						formatting-tree-file pdf-file</fo:block>
					<fo:block space-after.optimum="3pt" font-family="serif">(You have
						to include xerces.jar or another xml parser which supports DOM in
						your classpath.) </fo:block>


					<fo:block font-size="14pt" font-family="serif"
						line-height="16pt" space-before.optimum="8pt"
						space-after.optimum="4pt">b) Method Two</fo:block>
					<fo:block space-after.optimum="3pt" font-family="serif">Rather
						than performing transformation with an XSLT before invoking FOP,
						it is
						possible, if you use XT as your XSLT engine, to just call FOP and have it
						call
						XT for you. To do this, run the class
						org.apache.fop.apps.CommandLine with the
						source XML file name, XSL file name and PDF file name as arguments. You
						will
						need to include FOP, SAX, your SAX Parser and XT in your classpath and
						so you might
						invoke
					</fo:block>
					<fo:block font-size="10pt" font-family="monospace"
						line-height="12pt" space-before.optimum="0pt"
						space-after.optimum="0pt">java
						-Dorg.xml.sax.parser=com.jclark.xml.sax.Driver</fo:block>
					<fo:block font-size="10pt" font-family="monospace"
						line-height="12pt" space-before.optimum="0pt"
						space-after.optimum="0pt">-cp fop_x_xx_x.jar;xt.jar;xerces.jar
					</fo:block>
					<fo:block font-size="10pt" font-family="monospace"
						line-height="12pt" space-before.optimum="0pt"
						space-after.optimum="0pt">org.apache.fop.apps.CommandLine xml-file
						xsl-file pdf-file</fo:block>
					<fo:block space-after.optimum="3pt" font-family="serif">Again, if
						your SAX Parser is other than Xerces, you will need to set the
						property
						org.xml.sax.parser to the SAX Parser class to use.
					</fo:block>


					<fo:block font-size="14pt" font-family="serif"
						line-height="16pt" space-before.optimum="8pt"
						space-after.optimum="4pt">c) Method Three</fo:block>
					<fo:block space-after.optimum="3pt" font-family="serif">If you
						already produced the FO file, you can preview the results of your
						transformation without using any pdf viewer by invoking FOP with
						the viewer
						application. You will need to include FOP and your XML Parser in your
						classpath
					</fo:block>
					<fo:block font-size="10pt" font-family="monospace"
						line-height="12pt" space-before.optimum="0pt"
						space-after.optimum="0pt">java -cp fop_x_xx_x.jar;xerces.jar</fo:block>
					<fo:block font-size="10pt" font-family="monospace"
						line-height="12pt" space-before.optimum="0pt"
						space-after.optimum="0pt">org.apache.fop.apps.AWTCommandLine fo-file
					</fo:block>
					<fo:block space-after.optimum="3pt" font-family="serif">The viewer
						uses the swing classes.</fo:block>
					<fo:block space-after.optimum="3pt" font-family="serif">Note: If
						you are using java 2 or later (i.e. jdk 1.2. or later) you can put
						all
						needed jar files into the subdirectory jdk1.2.x\jre\lib\ext (windows
						example). Then
						FOP can be started without classpath:
					</fo:block>
					<fo:block font-size="10pt" font-family="monospace"
						line-height="12pt" space-before.optimum="0pt"
						space-after.optimum="0pt">java org.apache.fop.apps.CommandLine fo-file
						pdf-file</fo:block>



					<fo:block font-size="16pt" font-family="serif"
						line-height="18pt" space-before.optimum="8pt"
						space-after.optimum="8pt">3) Running FOP on MacOS</fo:block>

					<fo:block space-after.optimum="3pt" font-family="serif">Ensure
						that you have a recent MRJ, and that you have downloaded and
						unpacked the XP and SAX distributions. The xp.jar and sax.jar
						files work
						as is on MacOS.
					</fo:block>
					<fo:block space-after.optimum="3pt" font-family="serif">Drag the
						FOP jarfile onto the JBindery icon. When the first dialog
						appears, type "org.apache.fop.apps.CommandLine" in the "Class name" field.
						Using UNIX syntax, type the names of the input formatting-object
						file and
						the output PDF in the "Optional parameters" field.
					</fo:block>
					<fo:block space-after.optimum="3pt" font-family="serif">Click on
						the Classpath icon. To add the xp.jar and sax.jar files, click
						the "Add .zip file" button, navigate to the file in question, and
						click
						Open.
					</fo:block>
					<fo:block space-after.optimum="3pt" font-family="serif">Once both
						are added (the FOP jarfile will already be in the list), click
						Run. A "stdout" window will appear and display FOP runtime
						messages.
					</fo:block>


					<fo:block font-size="16pt" font-family="serif"
						line-height="18pt" space-before.optimum="8pt"
						space-after.optimum="8pt">4) Problems</fo:block>
					<fo:block space-after.optimum="3pt" font-family="serif">
						If you have problems running FOP, please have a look at the
						<fo:inline font-style="italic" font-family="serif">FOP FAQ
						</fo:inline>
						<fo:inline font-family="serif">
							(faq.html)
						</fo:inline>
						. If you don't find a solution there,
						you can ask for help on the list fop-dev@xmlgraphics.apache.org.
						Maybe it's bug and
						maybe somebody is already working on it.
					</fo:block>




					<fo:block id="sec4" font-size="18pt" font-family="serif"
						line-height="20pt" space-before.optimum="20pt"
						space-after.optimum="14pt">D)
						Embedding FOP
					</fo:block>
					<fo:block space-after.optimum="3pt" font-family="serif">Instantiate
						org.apache.fop.apps.Driver. Once this class is
						instantiated, methods are called to set the
						Renderer to use, the (possibly multiple) ElementMapping(s) to
						use and the PrintWriter to use to output the results of the
						rendering (where applicable). In the case of the Renderer and
						ElementMapping(s), the Driver may be supplied either with the
						object itself, or the name of the class, in which case Driver will
						instantiate the class itself. The advantage of the latter is it
						enables runtime determination of Renderer and ElementMapping(s).
					</fo:block>
					<fo:block space-after.optimum="3pt" font-family="serif">Once the
						Driver is set up, the buildFOTree method
						is called. Depending on whether DOM or SAX is being used, the
						invocation of the method is either buildFOTree(Document) or
						buildFOTree(Parser, InputSource) respectively.
					</fo:block>
					<fo:block space-after.optimum="3pt" font-family="serif">A third
						possibility may be used to build the FO Tree, namely
						calling getDocumentHandler() and firing the SAX events yourself.
					</fo:block>
					<fo:block space-after.optimum="3pt" font-family="serif">Once the
						FO Tree is built, the format() and render() methods may be
						called in that order.
					</fo:block>
					<fo:block space-after.optimum="3pt" font-family="serif">Here is an
						example use of Driver from CommandLine.java:</fo:block>
					<fo:block font-size="10pt" font-family="monospace"
						line-height="12pt" space-before.optimum="0pt"
						space-after.optimum="0pt">Driver driver = new Driver();</fo:block>
					<fo:block font-size="10pt" font-family="monospace"
						line-height="12pt" space-before.optimum="0pt"
						space-after.optimum="0pt">driver.setRenderer("org.apache.fop.render.pdf.PDFRenderer",
						version);</fo:block>
					<fo:block font-size="10pt" font-family="monospace"
						line-height="12pt" space-before.optimum="0pt"
						space-after.optimum="0pt">driver.addElementMapping("org.apache.fop.fo.StandardElementMapping");
					</fo:block>
					<fo:block font-size="10pt" font-family="monospace"
						line-height="12pt" space-before.optimum="0pt"
						space-after.optimum="0pt">driver.addElementMapping("org.apache.fop.svg.SVGElementMapping");
					</fo:block>
					<fo:block font-size="10pt" font-family="monospace"
						line-height="12pt" space-before.optimum="0pt"
						space-after.optimum="0pt">driver.setWriter(new PrintWriter(new
						FileWriter(args[1])));</fo:block>
					<fo:block font-size="10pt" font-family="monospace"
						line-height="12pt" space-before.optimum="0pt"
						space-after.optimum="0pt">driver.buildFOTree(parser,
						fileInputSource(args[0]));</fo:block>
					<fo:block font-size="10pt" font-family="monospace"
						line-height="12pt" space-before.optimum="0pt"
						space-after.optimum="0pt">driver.format();</fo:block>
					<fo:block font-size="10pt" font-family="monospace"
						line-height="12pt" space-before.optimum="0pt"
						space-after.optimum="0pt">driver.render();</fo:block>






					<fo:block id="sec5" font-size="18pt" font-family="serif"
						line-height="20pt" space-before.optimum="20pt"
						space-after.optimum="14pt">E)
						What's Implemented?
					</fo:block>
					<fo:block space-after.optimum="3pt" font-family="serif">Also see
						STATUS for what is being worked on.</fo:block>

					<fo:block font-size="16pt" font-family="serif"
						line-height="18pt" space-before.optimum="8pt"
						space-after.optimum="8pt">1) Formatting Objects</fo:block>
					<fo:list-block start-indent="1cm"
						provisional-distance-between-starts="12pt" font-family="serif">
						<fo:list-item>
							<fo:list-item-label end-indent="label-end()">
								<fo:block>
									<fo:inline font-family="Symbol">&#x2022;</fo:inline>
								</fo:block>
							</fo:list-item-label>
							<fo:list-item-body start-indent="body-start()">
								<fo:block>root </fo:block>
							</fo:list-item-body>
						</fo:list-item>
						<fo:list-item>
							<fo:list-item-label end-indent="label-end()">
								<fo:block>
									<fo:inline font-family="Symbol">&#x2022;</fo:inline>
								</fo:block>
							</fo:list-item-label>
							<fo:list-item-body start-indent="body-start()">
								<fo:block>layout-master-set </fo:block>
							</fo:list-item-body>
						</fo:list-item>
						<fo:list-item>
							<fo:list-item-label end-indent="label-end()">
								<fo:block>
									<fo:inline font-family="Symbol">&#x2022;</fo:inline>
								</fo:block>
							</fo:list-item-label>
							<fo:list-item-body start-indent="body-start()">
								<fo:block>simple-page-master </fo:block>
							</fo:list-item-body>
						</fo:list-item>
						<fo:list-item>
							<fo:list-item-label end-indent="label-end()">
								<fo:block>
									<fo:inline font-family="Symbol">&#x2022;</fo:inline>
								</fo:block>
							</fo:list-item-label>
							<fo:list-item-body start-indent="body-start()">
								<fo:block>region-body </fo:block>
							</fo:list-item-body>
						</fo:list-item>
						<fo:list-item>
							<fo:list-item-label end-indent="label-end()">
								<fo:block>
									<fo:inline font-family="Symbol">&#x2022;</fo:inline>
								</fo:block>
							</fo:list-item-label>
							<fo:list-item-body start-indent="body-start()">
								<fo:block>region-before </fo:block>
							</fo:list-item-body>
						</fo:list-item>
						<fo:list-item>
							<fo:list-item-label end-indent="label-end()">
								<fo:block>
									<fo:inline font-family="Symbol">&#x2022;</fo:inline>
								</fo:block>
							</fo:list-item-label>
							<fo:list-item-body start-indent="body-start()">
								<fo:block>region-after </fo:block>
							</fo:list-item-body>
						</fo:list-item>
						<fo:list-item>
							<fo:list-item-label end-indent="label-end()">
								<fo:block>
									<fo:inline font-family="Symbol">&#x2022;</fo:inline>
								</fo:block>
							</fo:list-item-label>
							<fo:list-item-body start-indent="body-start()">
								<fo:block>page-sequence </fo:block>
							</fo:list-item-body>
						</fo:list-item>
						<fo:list-item>
							<fo:list-item-label end-indent="label-end()">
								<fo:block>
									<fo:inline font-family="Symbol">&#x2022;</fo:inline>
								</fo:block>
							</fo:list-item-label>
							<fo:list-item-body start-indent="body-start()">
								<fo:block>sequence-specification </fo:block>
							</fo:list-item-body>
						</fo:list-item>
						<fo:list-item>
							<fo:list-item-label end-indent="label-end()">
								<fo:block>
									<fo:inline font-family="Symbol">&#x2022;</fo:inline>
								</fo:block>
							</fo:list-item-label>
							<fo:list-item-body start-indent="body-start()">
								<fo:block>sequence-specifier-single </fo:block>
							</fo:list-item-body>
						</fo:list-item>
						<fo:list-item>
							<fo:list-item-label end-indent="label-end()">
								<fo:block>
									<fo:inline font-family="Symbol">&#x2022;</fo:inline>
								</fo:block>
							</fo:list-item-label>
							<fo:list-item-body start-indent="body-start()">
								<fo:block>sequence-specifier-repeating </fo:block>
							</fo:list-item-body>
						</fo:list-item>
						<fo:list-item>
							<fo:list-item-label end-indent="label-end()">
								<fo:block>
									<fo:inline font-family="Symbol">&#x2022;</fo:inline>
								</fo:block>
							</fo:list-item-label>
							<fo:list-item-body start-indent="body-start()">
								<fo:block>sequence-specifier-alternating </fo:block>
							</fo:list-item-body>
						</fo:list-item>
						<fo:list-item>
							<fo:list-item-label end-indent="label-end()">
								<fo:block>
									<fo:inline font-family="Symbol">&#x2022;</fo:inline>
								</fo:block>
							</fo:list-item-label>
							<fo:list-item-body start-indent="body-start()">
								<fo:block>flow </fo:block>
							</fo:list-item-body>
						</fo:list-item>
						<fo:list-item>
							<fo:list-item-label end-indent="label-end()">
								<fo:block>
									<fo:inline font-family="Symbol">&#x2022;</fo:inline>
								</fo:block>
							</fo:list-item-label>
							<fo:list-item-body start-indent="body-start()">
								<fo:block>static-content </fo:block>
							</fo:list-item-body>
						</fo:list-item>
						<fo:list-item>
							<fo:list-item-label end-indent="label-end()">
								<fo:block>
									<fo:inline font-family="Symbol">&#x2022;</fo:inline>
								</fo:block>
							</fo:list-item-label>
							<fo:list-item-body start-indent="body-start()">
								<fo:block>block </fo:block>
							</fo:list-item-body>
						</fo:list-item>
						<fo:list-item>
							<fo:list-item-label end-indent="label-end()">
								<fo:block>
									<fo:inline font-family="Symbol">&#x2022;</fo:inline>
								</fo:block>
							</fo:list-item-label>
							<fo:list-item-body start-indent="body-start()">
								<fo:block>list-block </fo:block>
							</fo:list-item-body>
						</fo:list-item>
						<fo:list-item>
							<fo:list-item-label end-indent="label-end()">
								<fo:block>
									<fo:inline font-family="Symbol">&#x2022;</fo:inline>
								</fo:block>
							</fo:list-item-label>
							<fo:list-item-body start-indent="body-start()">
								<fo:block>list-item </fo:block>
							</fo:list-item-body>
						</fo:list-item>
						<fo:list-item>
							<fo:list-item-label end-indent="label-end()">
								<fo:block>
									<fo:inline font-family="Symbol">&#x2022;</fo:inline>
								</fo:block>
							</fo:list-item-label>
							<fo:list-item-body start-indent="body-start()">
								<fo:block>list-item-label </fo:block>
							</fo:list-item-body>
						</fo:list-item>
						<fo:list-item>
							<fo:list-item-label end-indent="label-end()">
								<fo:block>
									<fo:inline font-family="Symbol">&#x2022;</fo:inline>
								</fo:block>
							</fo:list-item-label>
							<fo:list-item-body start-indent="body-start()">
								<fo:block>list-item-body </fo:block>
							</fo:list-item-body>
						</fo:list-item>
						<fo:list-item>
							<fo:list-item-label end-indent="label-end()">
								<fo:block>
									<fo:inline font-family="Symbol">&#x2022;</fo:inline>
								</fo:block>
							</fo:list-item-label>
							<fo:list-item-body start-indent="body-start()">
								<fo:block>page-number </fo:block>
							</fo:list-item-body>
						</fo:list-item>
						<fo:list-item>
							<fo:list-item-label end-indent="label-end()">
								<fo:block>
									<fo:inline font-family="Symbol">&#x2022;</fo:inline>
								</fo:block>
							</fo:list-item-label>
							<fo:list-item-body start-indent="body-start()">
								<fo:block>display-sequence </fo:block>
							</fo:list-item-body>
						</fo:list-item>
						<fo:list-item>
							<fo:list-item-label end-indent="label-end()">
								<fo:block>
									<fo:inline font-family="Symbol">&#x2022;</fo:inline>
								</fo:block>
							</fo:list-item-label>
							<fo:list-item-body start-indent="body-start()">
								<fo:block>inline </fo:block>
							</fo:list-item-body>
						</fo:list-item>
						<fo:list-item>
							<fo:list-item-label end-indent="label-end()">
								<fo:block>
									<fo:inline font-family="Symbol">&#x2022;</fo:inline>
								</fo:block>
							</fo:list-item-label>
							<fo:list-item-body start-indent="body-start()">
								<fo:block>display-rule </fo:block>
							</fo:list-item-body>
						</fo:list-item>
						<fo:list-item>
							<fo:list-item-label end-indent="label-end()">
								<fo:block>
									<fo:inline font-family="Symbol">&#x2022;</fo:inline>
								</fo:block>
							</fo:list-item-label>
							<fo:list-item-body start-indent="body-start()">
								<fo:block>display-graphic </fo:block>
							</fo:list-item-body>
						</fo:list-item>
						<fo:list-item>
							<fo:list-item-label end-indent="label-end()">
								<fo:block>
									<fo:inline font-family="Symbol">&#x2022;</fo:inline>
								</fo:block>
							</fo:list-item-label>
							<fo:list-item-body start-indent="body-start()">
								<fo:block>table (minimal support)</fo:block>
							</fo:list-item-body>
						</fo:list-item>
						<fo:list-item>
							<fo:list-item-label end-indent="label-end()">
								<fo:block>
									<fo:inline font-family="Symbol">&#x2022;</fo:inline>
								</fo:block>
							</fo:list-item-label>
							<fo:list-item-body start-indent="body-start()">
								<fo:block>table-column (minimal support)</fo:block>
							</fo:list-item-body>
						</fo:list-item>
						<fo:list-item>
							<fo:list-item-label end-indent="label-end()">
								<fo:block>
									<fo:inline font-family="Symbol">&#x2022;</fo:inline>
								</fo:block>
							</fo:list-item-label>
							<fo:list-item-body start-indent="body-start()">
								<fo:block>table-body (minimal support)</fo:block>
							</fo:list-item-body>
						</fo:list-item>
						<fo:list-item>
							<fo:list-item-label end-indent="label-end()">
								<fo:block>
									<fo:inline font-family="Symbol">&#x2022;</fo:inline>
								</fo:block>
							</fo:list-item-label>
							<fo:list-item-body start-indent="body-start()">
								<fo:block>table-row (minimal support)</fo:block>
							</fo:list-item-body>
						</fo:list-item>
						<fo:list-item>
							<fo:list-item-label end-indent="label-end()">
								<fo:block>
									<fo:inline font-family="Symbol">&#x2022;</fo:inline>
								</fo:block>
							</fo:list-item-label>
							<fo:list-item-body start-indent="body-start()">
								<fo:block>table-cell (minimal support)</fo:block>
							</fo:list-item-body>
						</fo:list-item>
					</fo:list-block>



					<fo:block font-size="16pt" font-family="serif"
						line-height="18pt" space-before.optimum="8pt"
						space-after.optimum="8pt">2) Properties</fo:block>
					<fo:list-block start-indent="1cm"
						provisional-distance-between-starts="12pt" font-family="serif">
						<fo:list-item>
							<fo:list-item-label end-indent="label-end()">
								<fo:block>
									<fo:inline font-family="Symbol">&#x2022;</fo:inline>
								</fo:block>
							</fo:list-item-label>
							<fo:list-item-body start-indent="body-start()">
								<fo:block>end-indent </fo:block>
							</fo:list-item-body>
						</fo:list-item>
						<fo:list-item>
							<fo:list-item-label end-indent="label-end()">
								<fo:block>
									<fo:inline font-family="Symbol">&#x2022;</fo:inline>
								</fo:block>
							</fo:list-item-label>
							<fo:list-item-body start-indent="body-start()">
								<fo:block>page-master-name </fo:block>
							</fo:list-item-body>
						</fo:list-item>
						<fo:list-item>
							<fo:list-item-label end-indent="label-end()">
								<fo:block>
									<fo:inline font-family="Symbol">&#x2022;</fo:inline>
								</fo:block>
							</fo:list-item-label>
							<fo:list-item-body start-indent="body-start()">
								<fo:block>page-master-first </fo:block>
							</fo:list-item-body>
						</fo:list-item>
						<fo:list-item>
							<fo:list-item-label end-indent="label-end()">
								<fo:block>
									<fo:inline font-family="Symbol">&#x2022;</fo:inline>
								</fo:block>
							</fo:list-item-label>
							<fo:list-item-body start-indent="body-start()">
								<fo:block>page-master-repeating </fo:block>
							</fo:list-item-body>
						</fo:list-item>
						<fo:list-item>
							<fo:list-item-label end-indent="label-end()">
								<fo:block>
									<fo:inline font-family="Symbol">&#x2022;</fo:inline>
								</fo:block>
							</fo:list-item-label>
							<fo:list-item-body start-indent="body-start()">
								<fo:block>page-master-odd </fo:block>
							</fo:list-item-body>
						</fo:list-item>
						<fo:list-item>
							<fo:list-item-label end-indent="label-end()">
								<fo:block>
									<fo:inline font-family="Symbol">&#x2022;</fo:inline>
								</fo:block>
							</fo:list-item-label>
							<fo:list-item-body start-indent="body-start()">
								<fo:block>page-master-even </fo:block>
							</fo:list-item-body>
						</fo:list-item>
						<fo:list-item>
							<fo:list-item-label end-indent="label-end()">
								<fo:block>
									<fo:inline font-family="Symbol">&#x2022;</fo:inline>
								</fo:block>
							</fo:list-item-label>
							<fo:list-item-body start-indent="body-start()">
								<fo:block>margin-top (only on pages and regions)</fo:block>
							</fo:list-item-body>
						</fo:list-item>
						<fo:list-item>
							<fo:list-item-label end-indent="label-end()">
								<fo:block>
									<fo:inline font-family="Symbol">&#x2022;</fo:inline>
								</fo:block>
							</fo:list-item-label>
							<fo:list-item-body start-indent="body-start()">
								<fo:block>margin-bottom (only on pages and regions)</fo:block>
							</fo:list-item-body>
						</fo:list-item>
						<fo:list-item>
							<fo:list-item-label end-indent="label-end()">
								<fo:block>
									<fo:inline font-family="Symbol">&#x2022;</fo:inline>
								</fo:block>
							</fo:list-item-label>
							<fo:list-item-body start-indent="body-start()">
								<fo:block>margin-left (only on pages and regions)</fo:block>
							</fo:list-item-body>
						</fo:list-item>
						<fo:list-item>
							<fo:list-item-label end-indent="label-end()">
								<fo:block>
									<fo:inline font-family="Symbol">&#x2022;</fo:inline>
								</fo:block>
							</fo:list-item-label>
							<fo:list-item-body start-indent="body-start()">
								<fo:block>margin-right (only on pages and regions)</fo:block>
							</fo:list-item-body>
						</fo:list-item>
						<fo:list-item>
							<fo:list-item-label end-indent="label-end()">
								<fo:block>
									<fo:inline font-family="Symbol">&#x2022;</fo:inline>
								</fo:block>
							</fo:list-item-label>
							<fo:list-item-body start-indent="body-start()">
								<fo:block>extent </fo:block>
							</fo:list-item-body>
						</fo:list-item>
						<fo:list-item>
							<fo:list-item-label end-indent="label-end()">
								<fo:block>
									<fo:inline font-family="Symbol">&#x2022;</fo:inline>
								</fo:block>
							</fo:list-item-label>
							<fo:list-item-body start-indent="body-start()">
								<fo:block>page-width </fo:block>
							</fo:list-item-body>
						</fo:list-item>
						<fo:list-item>
							<fo:list-item-label end-indent="label-end()">
								<fo:block>
									<fo:inline font-family="Symbol">&#x2022;</fo:inline>
								</fo:block>
							</fo:list-item-label>
							<fo:list-item-body start-indent="body-start()">
								<fo:block>page-height </fo:block>
							</fo:list-item-body>
						</fo:list-item>
						<fo:list-item>
							<fo:list-item-label end-indent="label-end()">
								<fo:block>
									<fo:inline font-family="Symbol">&#x2022;</fo:inline>
								</fo:block>
							</fo:list-item-label>
							<fo:list-item-body start-indent="body-start()">
								<fo:block>flow-name </fo:block>
							</fo:list-item-body>
						</fo:list-item>
						<fo:list-item>
							<fo:list-item-label end-indent="label-end()">
								<fo:block>
									<fo:inline font-family="Symbol">&#x2022;</fo:inline>
								</fo:block>
							</fo:list-item-label>
							<fo:list-item-body start-indent="body-start()">
								<fo:block>font-family </fo:block>
							</fo:list-item-body>
						</fo:list-item>
						<fo:list-item>
							<fo:list-item-label end-indent="label-end()">
								<fo:block>
									<fo:inline font-family="Symbol">&#x2022;</fo:inline>
								</fo:block>
							</fo:list-item-label>
							<fo:list-item-body start-indent="body-start()">
								<fo:block>font-style </fo:block>
							</fo:list-item-body>
						</fo:list-item>
						<fo:list-item>
							<fo:list-item-label end-indent="label-end()">
								<fo:block>
									<fo:inline font-family="Symbol">&#x2022;</fo:inline>
								</fo:block>
							</fo:list-item-label>
							<fo:list-item-body start-indent="body-start()">
								<fo:block>font-weight </fo:block>
							</fo:list-item-body>
						</fo:list-item>
						<fo:list-item>
							<fo:list-item-label end-indent="label-end()">
								<fo:block>
									<fo:inline font-family="Symbol">&#x2022;</fo:inline>
								</fo:block>
							</fo:list-item-label>
							<fo:list-item-body start-indent="body-start()">
								<fo:block>font-size </fo:block>
							</fo:list-item-body>
						</fo:list-item>
						<fo:list-item>
							<fo:list-item-label end-indent="label-end()">
								<fo:block>
									<fo:inline font-family="Symbol">&#x2022;</fo:inline>
								</fo:block>
							</fo:list-item-label>
							<fo:list-item-body start-indent="body-start()">
								<fo:block>line-height </fo:block>
							</fo:list-item-body>
						</fo:list-item>
						<fo:list-item>
							<fo:list-item-label end-indent="label-end()">
								<fo:block>
									<fo:inline font-family="Symbol">&#x2022;</fo:inline>
								</fo:block>
							</fo:list-item-label>
							<fo:list-item-body start-indent="body-start()">
								<fo:block>text-align </fo:block>
							</fo:list-item-body>
						</fo:list-item>
						<fo:list-item>
							<fo:list-item-label end-indent="label-end()">
								<fo:block>
									<fo:inline font-family="Symbol">&#x2022;</fo:inline>
								</fo:block>
							</fo:list-item-label>
							<fo:list-item-body start-indent="body-start()">
								<fo:block>text-align-last </fo:block>
							</fo:list-item-body>
						</fo:list-item>
						<fo:list-item>
							<fo:list-item-label end-indent="label-end()">
								<fo:block>
									<fo:inline font-family="Symbol">&#x2022;</fo:inline>
								</fo:block>
							</fo:list-item-label>
							<fo:list-item-body start-indent="body-start()">
								<fo:block>space-before.optimum </fo:block>
							</fo:list-item-body>
						</fo:list-item>
						<fo:list-item>
							<fo:list-item-label end-indent="label-end()">
								<fo:block>
									<fo:inline font-family="Symbol">&#x2022;</fo:inline>
								</fo:block>
							</fo:list-item-label>
							<fo:list-item-body start-indent="body-start()">
								<fo:block>space-after.optimum </fo:block>
							</fo:list-item-body>
						</fo:list-item>
						<fo:list-item>
							<fo:list-item-label end-indent="label-end()">
								<fo:block>
									<fo:inline font-family="Symbol">&#x2022;</fo:inline>
								</fo:block>
							</fo:list-item-label>
							<fo:list-item-body start-indent="body-start()">
								<fo:block>start-indent </fo:block>
							</fo:list-item-body>
						</fo:list-item>
						<fo:list-item>
							<fo:list-item-label end-indent="label-end()">
								<fo:block>
									<fo:inline font-family="Symbol">&#x2022;</fo:inline>
								</fo:block>
							</fo:list-item-label>
							<fo:list-item-body start-indent="body-start()">
								<fo:block>end-indent </fo:block>
							</fo:list-item-body>
						</fo:list-item>
						<fo:list-item>
							<fo:list-item-label end-indent="label-end()">
								<fo:block>
									<fo:inline font-family="Symbol">&#x2022;</fo:inline>
								</fo:block>
							</fo:list-item-label>
							<fo:list-item-body start-indent="body-start()">
								<fo:block>provisional-distance-between-starts </fo:block>
							</fo:list-item-body>
						</fo:list-item>
						<fo:list-item>
							<fo:list-item-label end-indent="label-end()">
								<fo:block>
									<fo:inline font-family="Symbol">&#x2022;</fo:inline>
								</fo:block>
							</fo:list-item-label>
							<fo:list-item-body start-indent="body-start()">
								<fo:block>provisional-label-separation </fo:block>
							</fo:list-item-body>
						</fo:list-item>
						<fo:list-item>
							<fo:list-item-label end-indent="label-end()">
								<fo:block>
									<fo:inline font-family="Symbol">&#x2022;</fo:inline>
								</fo:block>
							</fo:list-item-label>
							<fo:list-item-body start-indent="body-start()">
								<fo:block>rule-thickness </fo:block>
							</fo:list-item-body>
						</fo:list-item>
						<fo:list-item>
							<fo:list-item-label end-indent="label-end()">
								<fo:block>
									<fo:inline font-family="Symbol">&#x2022;</fo:inline>
								</fo:block>
							</fo:list-item-label>
							<fo:list-item-body start-indent="body-start()">
								<fo:block>color </fo:block>
							</fo:list-item-body>
						</fo:list-item>
						<fo:list-item>
							<fo:list-item-label end-indent="label-end()">
								<fo:block>
									<fo:inline font-family="Symbol">&#x2022;</fo:inline>
								</fo:block>
							</fo:list-item-label>
							<fo:list-item-body start-indent="body-start()">
								<fo:block>wrap-option </fo:block>
							</fo:list-item-body>
						</fo:list-item>
						<fo:list-item>
							<fo:list-item-label end-indent="label-end()">
								<fo:block>
									<fo:inline font-family="Symbol">&#x2022;</fo:inline>
								</fo:block>
							</fo:list-item-label>
							<fo:list-item-body start-indent="body-start()">
								<fo:block>white-space-treatment </fo:block>
							</fo:list-item-body>
						</fo:list-item>
						<fo:list-item>
							<fo:list-item-label end-indent="label-end()">
								<fo:block>
									<fo:inline font-family="Symbol">&#x2022;</fo:inline>
								</fo:block>
							</fo:list-item-label>
							<fo:list-item-body start-indent="body-start()">
								<fo:block>break-before </fo:block>
							</fo:list-item-body>
						</fo:list-item>
						<fo:list-item>
							<fo:list-item-label end-indent="label-end()">
								<fo:block>
									<fo:inline font-family="Symbol">&#x2022;</fo:inline>
								</fo:block>
							</fo:list-item-label>
							<fo:list-item-body start-indent="body-start()">
								<fo:block>break-after </fo:block>
							</fo:list-item-body>
						</fo:list-item>
						<fo:list-item>
							<fo:list-item-label end-indent="label-end()">
								<fo:block>
									<fo:inline font-family="Symbol">&#x2022;</fo:inline>
								</fo:block>
							</fo:list-item-label>
							<fo:list-item-body start-indent="body-start()">
								<fo:block>text-indent </fo:block>
							</fo:list-item-body>
						</fo:list-item>
						<fo:list-item>
							<fo:list-item-label end-indent="label-end()">
								<fo:block>
									<fo:inline font-family="Symbol">&#x2022;</fo:inline>
								</fo:block>
							</fo:list-item-label>
							<fo:list-item-body start-indent="body-start()">
								<fo:block>href</fo:block>
							</fo:list-item-body>
						</fo:list-item>
						<fo:list-item>
							<fo:list-item-label end-indent="label-end()">
								<fo:block>
									<fo:inline font-family="Symbol">&#x2022;</fo:inline>
								</fo:block>
							</fo:list-item-label>
							<fo:list-item-body start-indent="body-start()">
								<fo:block>column-width</fo:block>
							</fo:list-item-body>
						</fo:list-item>
						<fo:list-item>
							<fo:list-item-label end-indent="label-end()">
								<fo:block>
									<fo:inline font-family="Symbol">&#x2022;</fo:inline>
								</fo:block>
							</fo:list-item-label>
							<fo:list-item-body start-indent="body-start()">
								<fo:block>background-color</fo:block>
							</fo:list-item-body>
						</fo:list-item>
						<fo:list-item>
							<fo:list-item-label end-indent="label-end()">
								<fo:block>
									<fo:inline font-family="Symbol">&#x2022;</fo:inline>
								</fo:block>
							</fo:list-item-label>
							<fo:list-item-body start-indent="body-start()">
								<fo:block>padding-top (only in conjunction with background
									color)</fo:block>
							</fo:list-item-body>
						</fo:list-item>
						<fo:list-item>
							<fo:list-item-label end-indent="label-end()">
								<fo:block>
									<fo:inline font-family="Symbol">&#x2022;</fo:inline>
								</fo:block>
							</fo:list-item-label>
							<fo:list-item-body start-indent="body-start()">
								<fo:block>padding-left (only in conjunction with background
									color)</fo:block>
							</fo:list-item-body>
						</fo:list-item>
						<fo:list-item>
							<fo:list-item-label end-indent="label-end()">
								<fo:block>
									<fo:inline font-family="Symbol">&#x2022;</fo:inline>
								</fo:block>
							</fo:list-item-label>
							<fo:list-item-body start-indent="body-start()">
								<fo:block>padding-bottom (only in conjunction with background
									color)</fo:block>
							</fo:list-item-body>
						</fo:list-item>
						<fo:list-item>
							<fo:list-item-label end-indent="label-end()">
								<fo:block>
									<fo:inline font-family="Symbol">&#x2022;</fo:inline>
								</fo:block>
							</fo:list-item-label>
							<fo:list-item-body start-indent="body-start()">
								<fo:block>padding-right (only in conjunction with background
									color)</fo:block>
							</fo:list-item-body>
						</fo:list-item>
					</fo:list-block>






					<fo:block id="sec6" font-size="18pt" font-family="serif"
						line-height="20pt" space-before.optimum="20pt"
						space-after.optimum="14pt">F)
						Limitations
					</fo:block>
					<fo:block space-after.optimum="3pt" font-family="serif">Although
						FOP implements the above listed fo objects and properties,
						sometimes it does so
						only in a limited way.
					</fo:block>

					<fo:block font-size="16pt" font-family="serif"
						line-height="18pt" space-before.optimum="8pt"
						space-after.optimum="8pt">list-block</fo:block>
					<fo:block space-after.optimum="3pt" font-family="serif">The fo
						working draft allows describes two ways to markup lists.The
						list-block must have as
						children either: 1) pairs of fo:list-item-label and fo:list-item-body
						formatting objects, or
						2) fo:list-item formatting objects.
					</fo:block>
					<fo:block space-after.optimum="3pt" font-family="serif">At the
						moment FOP only implements the second way. Therefore a list has a
						basic structure like this:</fo:block>
					<fo:block font-size="10pt" font-family="monospace"
						line-height="12pt" space-before.optimum="0pt"
						space-after.optimum="0pt">&lt;fo:list-block&gt;</fo:block>
					<fo:block font-size="10pt" font-family="monospace"
						line-height="12pt" space-before.optimum="0pt"
						space-after.optimum="0pt">&lt;fo:list-item&gt;</fo:block>
					<fo:block font-size="10pt" font-family="monospace"
						line-height="12pt" space-before.optimum="0pt"
						space-after.optimum="0pt">&lt;fo:list-item-label&gt;&lt;fo:block&gt;&lt;/fo:block&gt;&lt;/fo:list-item-label&gt;
					</fo:block>
					<fo:block font-size="10pt" font-family="monospace"
						line-height="12pt" space-before.optimum="0pt"
						space-after.optimum="0pt">&lt;fo:list-item-body&gt;&lt;fo:block&gt;&lt;/fo:block&gt;&lt;/fo:list-item-body&gt;
					</fo:block>
					<fo:block font-size="10pt" font-family="monospace"
						line-height="12pt" space-before.optimum="0pt"
						space-after.optimum="0pt">&lt;/fo:list-item&gt;</fo:block>
					<fo:block font-size="10pt" font-family="monospace"
						line-height="12pt" space-before.optimum="0pt"
						space-after.optimum="0pt">&lt;/fo:list-block&gt;</fo:block>


					<fo:block font-size="16pt" font-family="serif"
						line-height="18pt" space-before.optimum="8pt"
						space-after.optimum="8pt">Padding</fo:block>
					<fo:block space-after.optimum="3pt" font-family="serif">Padding
						works in conjunction with indents and spaces. It is only
						implemented
						for blocks. At the moment padding can't be used to make extra space
						(indents+spaces
						must be used), but only to control how much the background-color
						extends beyond
						the content rectangle.
					</fo:block>


					<fo:block font-size="16pt" font-family="serif"
						line-height="18pt" space-before.optimum="8pt"
						space-after.optimum="8pt">Tables</fo:block>
					<fo:block space-after.optimum="3pt" font-family="serif">There two
						limitations for tables: 1) FOP needs you to explicitly specify
						column widths
						2) Cells have to contain block-level FOs. They can't contain
						straight character data.
					</fo:block>
					<fo:block space-after.optimum="3pt" font-family="serif">A working
						basic example of a table looks like this: </fo:block>
					<fo:block font-size="10pt" font-family="monospace"
						line-height="12pt" space-before.optimum="0pt"
						space-after.optimum="0pt">&lt;fo:table&gt;</fo:block>
					<fo:block font-size="10pt" font-family="monospace"
						line-height="12pt" space-before.optimum="0pt"
						space-after.optimum="0pt"> &lt;fo:table-column column-width="150pt"/&gt;
					</fo:block>
					<fo:block font-size="10pt" font-family="monospace"
						line-height="12pt" space-before.optimum="0pt"
						space-after.optimum="0pt"> &lt;fo:table-column column-width="150pt"/&gt;
					</fo:block>
					<fo:block font-size="10pt" font-family="monospace"
						line-height="12pt" space-before.optimum="0pt"
						space-after.optimum="0pt"> &lt;fo:table-body font-size="10pt"
						font-family="sans-serif"&gt;</fo:block>
					<fo:block font-size="10pt" font-family="monospace"
						line-height="12pt" space-before.optimum="0pt"
						space-after.optimum="0pt"> &lt;fo:table-row&gt;</fo:block>
					<fo:block font-size="10pt" font-family="monospace"
						line-height="12pt" space-before.optimum="0pt"
						space-after.optimum="0pt"> &lt;fo:table-cell&gt;</fo:block>
					<fo:block font-size="10pt" font-family="monospace"
						line-height="12pt" space-before.optimum="0pt"
						space-after.optimum="0pt"> &lt;fo:block&gt;text&lt;/fo:block&gt;
					</fo:block>
					<fo:block font-size="10pt" font-family="monospace"
						line-height="12pt" space-before.optimum="0pt"
						space-after.optimum="0pt"> &lt;/fo:table-cell&gt;</fo:block>
					<fo:block font-size="10pt" font-family="monospace"
						line-height="12pt" space-before.optimum="0pt"
						space-after.optimum="0pt"> &lt;fo:table-cell&gt;</fo:block>
					<fo:block font-size="10pt" font-family="monospace"
						line-height="12pt" space-before.optimum="0pt"
						space-after.optimum="0pt"> &lt;fo:block&gt;text&lt;/fo:block&gt;
					</fo:block>
					<fo:block font-size="10pt" font-family="monospace"
						line-height="12pt" space-before.optimum="0pt"
						space-after.optimum="0pt"> &lt;/fo:table-cell&gt;</fo:block>
					<fo:block font-size="10pt" font-family="monospace"
						line-height="12pt" space-before.optimum="0pt"
						space-after.optimum="0pt"> &lt;/fo:table-row&gt;</fo:block>
					<fo:block font-size="10pt" font-family="monospace"
						line-height="12pt" space-before.optimum="0pt"
						space-after.optimum="0pt"> &lt;fo:table-row&gt;</fo:block>
					<fo:block font-size="10pt" font-family="monospace"
						line-height="12pt" space-before.optimum="0pt"
						space-after.optimum="0pt"> &lt;fo:table-cell&gt;</fo:block>
					<fo:block font-size="10pt" font-family="monospace"
						line-height="12pt" space-before.optimum="0pt"
						space-after.optimum="0pt"> &lt;fo:block&gt;text&lt;/fo:block&gt;
					</fo:block>
					<fo:block font-size="10pt" font-family="monospace"
						line-height="12pt" space-before.optimum="0pt"
						space-after.optimum="0pt"> &lt;/fo:table-cell&gt;</fo:block>
					<fo:block font-size="10pt" font-family="monospace"
						line-height="12pt" space-before.optimum="0pt"
						space-after.optimum="0pt"> &lt;fo:table-cell&gt;</fo:block>
					<fo:block font-size="10pt" font-family="monospace"
						line-height="12pt" space-before.optimum="0pt"
						space-after.optimum="0pt"> &lt;fo:block&gt;text&lt;/fo:block&gt;
					</fo:block>
					<fo:block font-size="10pt" font-family="monospace"
						line-height="12pt" space-before.optimum="0pt"
						space-after.optimum="0pt"> &lt;/fo:table-cell&gt;</fo:block>
					<fo:block font-size="10pt" font-family="monospace"
						line-height="12pt" space-before.optimum="0pt"
						space-after.optimum="0pt"> &lt;/fo:table-row&gt;</fo:block>
					<fo:block font-size="10pt" font-family="monospace"
						line-height="12pt" space-before.optimum="0pt"
						space-after.optimum="0pt"> &lt;fo:table-row&gt;</fo:block>
					<fo:block font-size="10pt" font-family="monospace"
						line-height="12pt" space-before.optimum="0pt"
						space-after.optimum="0pt"> &lt;fo:table-cell&gt;</fo:block>
					<fo:block font-size="10pt" font-family="monospace"
						line-height="12pt" space-before.optimum="0pt"
						space-after.optimum="0pt"> &lt;fo:block&gt;text&lt;/fo:block&gt;
					</fo:block>
					<fo:block font-size="10pt" font-family="monospace"
						line-height="12pt" space-before.optimum="0pt"
						space-after.optimum="0pt"> &lt;/fo:table-cell&gt;</fo:block>
					<fo:block font-size="10pt" font-family="monospace"
						line-height="12pt" space-before.optimum="0pt"
						space-after.optimum="0pt"> &lt;fo:table-cell&gt;</fo:block>
					<fo:block font-size="10pt" font-family="monospace"
						line-height="12pt" space-before.optimum="0pt"
						space-after.optimum="0pt"> &lt;fo:block&gt;text&lt;/fo:block&gt;
					</fo:block>
					<fo:block font-size="10pt" font-family="monospace"
						line-height="12pt" space-before.optimum="0pt"
						space-after.optimum="0pt"> &lt;/fo:table-cell&gt;</fo:block>
					<fo:block font-size="10pt" font-family="monospace"
						line-height="12pt" space-before.optimum="0pt"
						space-after.optimum="0pt"> &lt;/fo:table-row&gt;</fo:block>
					<fo:block font-size="10pt" font-family="monospace"
						line-height="12pt" space-before.optimum="0pt"
						space-after.optimum="0pt"> &lt;/fo:table-body&gt;</fo:block>
					<fo:block font-size="10pt" font-family="monospace"
						line-height="12pt" space-before.optimum="0pt"
						space-after.optimum="0pt">&lt;/fo:table&gt;</fo:block>











					<fo:block id="sec7" font-size="18pt" font-family="serif"
						line-height="20pt" space-before.optimum="20pt"
						space-after.optimum="14pt">G)
						Bugs
					</fo:block>
					<fo:block space-after.optimum="3pt" font-family="serif">see STATUS
						file</fo:block>






					<fo:block id="sec8" font-size="18pt" font-family="serif"
						line-height="20pt" space-before.optimum="20pt"
						space-after.optimum="14pt">H)
						Compiling FOP
					</fo:block>

					<fo:block font-size="16pt" font-family="serif"
						line-height="18pt" space-before.optimum="8pt"
						space-after.optimum="8pt">1. Prerequisites</fo:block>

					<fo:block font-size="14pt" font-family="serif"
						line-height="16pt" space-before.optimum="8pt"
						space-after.optimum="4pt">a) Java 1.1.x or later</fo:block>
					<fo:block space-after.optimum="3pt" font-family="serif">
						If you use Java 1.1.x you must also seperately include the swing
						classes, which can
						be found at the
						<fo:inline font-style="italic" font-family="serif">
							Sun website
						</fo:inline>
						<fo:inline font-family="serif">
							(http://java.sun.com/products/jfc/#download-swing)
						</fo:inline>
						. From Java 1.2 on (aka Java 2) they are part of the standard
						distribution.
					</fo:block>


					<fo:block font-size="14pt" font-family="serif"
						line-height="16pt" space-before.optimum="8pt"
						space-after.optimum="4pt">b) An XML parser</fo:block>
					<fo:block space-after.optimum="3pt" font-family="serif">
						An XML parser which supports DOM like
						<fo:inline font-style="italic" font-family="serif">Xerces-J
						</fo:inline>
						<fo:inline font-family="serif">
							(http://xerces.apache.org/xerces-j/index.html)
						</fo:inline>
						.
					</fo:block>


					<fo:block font-size="14pt" font-family="serif"
						line-height="16pt" space-before.optimum="8pt"
						space-after.optimum="4pt">c) XT from James Clark</fo:block>
					<fo:block space-after.optimum="3pt" font-family="serif">Some of
						the Java source code in FOP is generated from XML using
						XSLT. XT must be used to generate this code.
					</fo:block>
					<fo:block space-after.optimum="3pt" font-family="serif">
						XT is an XSL stylesheet processor written in java. At the moment
						you
						can't use any other processor, because the make file makes use of some
						proprietary features of Clark's xt which allow to write output in
						more
						then one document. You can find XT at
						<fo:inline font-style="italic" font-family="serif">
							James Clark's website
						</fo:inline>
						<fo:inline font-family="serif">
							(http://www.jclark.com/xml/xt.html)
						</fo:inline>
						. You have to use XT version 19991105 or later.
					</fo:block>
					<fo:block space-after.optimum="3pt" font-family="serif">(Under
						windows you shouldn't use the prepackaged xt.exe but also the
						generic jar file, otherwise make won't work)
					</fo:block>
					<fo:block space-after.optimum="3pt" font-family="serif">
						XT relies on an sax parser like XP (also J. Clark), which can be
						downloaded at
						<fo:inline font-style="italic" font-family="serif">James
							Clark's Website
						</fo:inline>
						<fo:inline font-family="serif">
							(http://www.jclark.com/xml/xp/index.html)
						</fo:inline>
					</fo:block>


					<fo:block font-size="14pt" font-family="serif"
						line-height="16pt" space-before.optimum="8pt"
						space-after.optimum="4pt">d) make</fo:block>
					<fo:block space-after.optimum="3pt" font-family="serif">
						Under windows it has been reported that the use of the cygnus
						solutions port
						of the GNU utilities works. You can find it at
						<fo:inline font-style="italic" font-family="serif">Cygnus
							Solutions</fo:inline>
						<fo:inline font-family="serif">
							(http://sourceware.cygnus.com/cygwin/)
						</fo:inline>
					</fo:block>



					<fo:block font-size="16pt" font-family="serif"
						line-height="18pt" space-before.optimum="8pt"
						space-after.optimum="8pt">Compiling FOP on MacOS</fo:block>

					<fo:block space-after.optimum="3pt" font-family="serif">We
						strongly recommend the use of Codewarrior Java. This Readme will
						contain a link to more information in the near future.
					</fo:block>







					<fo:block id="sec9" font-size="18pt" font-family="serif"
						line-height="20pt" space-before.optimum="20pt"
						space-after.optimum="14pt">I)
						Getting involved
					</fo:block>
					<fo:block space-after.optimum="3pt" font-family="serif">1.
						Subscribe to fop-dev@xmlgraphics.apache.org by sending an email
						to fop-dev-subscribe@xmlgraphics.apache.org
					</fo:block>
					<fo:block space-after.optimum="3pt" font-family="serif">2. Read
						the archives to fop-dev to get an idea of the issues being
						discussed.
					</fo:block>
					<fo:block space-after.optimum="3pt" font-family="serif">3.
						Subscribe to fop-cvs@xmlgraphics.apache.org by sending an email to
						fop-cvs-subscribe@xmlgraphics.apache.org (it is important
						that you follow changes being made).
					</fo:block>
					<fo:block space-after.optimum="3pt" font-family="serif">4. Try :-)
						to wrap your head around the XSL working draft. </fo:block>
					<fo:block space-after.optimum="3pt" font-family="serif">5. Get CVS
						working on your system. </fo:block>
					<fo:block space-after.optimum="3pt" font-family="serif">6. Ask, on
						fop-dev, any questions you have at all about the code, design,
						etc. </fo:block>
					<fo:block space-after.optimum="3pt" font-family="serif">7. When
						you feel comfortable modifying the code, send diffs to
						fop-dev with your contributions.
					</fo:block>
					<fo:block space-after.optimum="3pt" font-family="serif">8. Have
						fun!</fo:block>






					<fo:block id="sec10" font-size="18pt" font-family="serif"
						line-height="20pt" space-before.optimum="20pt"
						space-after.optimum="14pt">J)
						FOP Relevant Specifications
					</fo:block>
					<fo:list-block start-indent="1cm"
						provisional-distance-between-starts="12pt" font-family="serif">
						<fo:list-item>
							<fo:list-item-label end-indent="label-end()">
								<fo:block>
									<fo:inline font-family="Symbol">&#x2022;</fo:inline>
								</fo:block>
							</fo:list-item-label>
							<fo:list-item-body start-indent="body-start()">
								<fo:block>
									<fo:inline font-style="italic" font-family="serif">XML
										Recommendation</fo:inline>
									<fo:inline font-family="serif">
										(
										<fo:basic-link color="blue"
											external-destination="http://www.w3.org/TR/REC-xml">http://www.w3.org/TR/REC-xml
										</fo:basic-link>
										)
									</fo:inline>
								</fo:block>
							</fo:list-item-body>
						</fo:list-item>
						<fo:list-item>
							<fo:list-item-label end-indent="label-end()">
								<fo:block>
									<fo:inline font-family="Symbol">&#x2022;</fo:inline>
								</fo:block>
							</fo:list-item-label>
							<fo:list-item-body start-indent="body-start()">
								<fo:block>
									<fo:inline font-style="italic" font-family="serif">XSL-FO
										Working Draft</fo:inline>
									<fo:inline font-family="serif">
										(
										<fo:basic-link color="blue"
											external-destination="http://www.w3.org/TR/WD-xsl/">http://www.w3.org/TR/WD-xsl/
										</fo:basic-link>
										)
									</fo:inline>
								</fo:block>
							</fo:list-item-body>
						</fo:list-item>
						<fo:list-item>
							<fo:list-item-label end-indent="label-end()">
								<fo:block>
									<fo:inline font-family="Symbol">&#x2022;</fo:inline>
								</fo:block>
							</fo:list-item-label>
							<fo:list-item-body start-indent="body-start()">
								<fo:block>
									<fo:inline font-style="italic" font-family="serif">XSLT
										Recommendation</fo:inline>
									<fo:inline font-family="serif">
										(
										<fo:basic-link color="blue"
											external-destination="http://www.w3.org/TR/xslt">http://www.w3.org/TR/xslt
										</fo:basic-link>
										)
									</fo:inline>
								</fo:block>
							</fo:list-item-body>
						</fo:list-item>
						<fo:list-item>
							<fo:list-item-label end-indent="label-end()">
								<fo:block>
									<fo:inline font-family="Symbol">&#x2022;</fo:inline>
								</fo:block>
							</fo:list-item-label>
							<fo:list-item-body start-indent="body-start()">
								<fo:block>
									<fo:inline font-style="italic" font-family="serif">PDF
										Documentation</fo:inline>
									<fo:inline font-family="serif">
										(
										<fo:basic-link color="blue"
											external-destination="http://partners.adobe.com/asn/developer/acrosdk/DOCS/pdfspec.pdf">http://partners.adobe.com/asn/developer/acrosdk/DOCS/pdfspec.pdf
										</fo:basic-link>
										)
									</fo:inline>
								</fo:block>
							</fo:list-item-body>
						</fo:list-item>
						<fo:list-item>
							<fo:list-item-label end-indent="label-end()">
								<fo:block>
									<fo:inline font-family="Symbol">&#x2022;</fo:inline>
								</fo:block>
							</fo:list-item-label>
							<fo:list-item-body start-indent="body-start()">
								<fo:block>
									<fo:inline font-style="italic" font-family="serif">Simple API
										for XML (SAX)</fo:inline>
									<fo:inline font-family="serif">
										(
										<fo:basic-link color="blue"
											external-destination="http://www.megginson.com/SAX/">http://www.megginson.com/SAX/
										</fo:basic-link>
										)
									</fo:inline>
								</fo:block>
							</fo:list-item-body>
						</fo:list-item>
						<fo:list-item>
							<fo:list-item-label end-indent="label-end()">
								<fo:block>
									<fo:inline font-family="Symbol">&#x2022;</fo:inline>
								</fo:block>
							</fo:list-item-label>
							<fo:list-item-body start-indent="body-start()">
								<fo:block>
									<fo:inline font-style="italic" font-family="serif">Document
										Object Model (DOM)</fo:inline>
									<fo:inline font-family="serif">
										(
										<fo:basic-link color="blue"
											external-destination="http://www.w3.org/TR/REC-DOM-Level-1">http://www.w3.org/TR/REC-DOM-Level-1
										</fo:basic-link>
										)
									</fo:inline>
								</fo:block>
							</fo:list-item-body>
						</fo:list-item>
						<fo:list-item>
							<fo:list-item-label end-indent="label-end()">
								<fo:block>
									<fo:inline font-family="Symbol">&#x2022;</fo:inline>
								</fo:block>
							</fo:list-item-label>
							<fo:list-item-body start-indent="body-start()">
								<fo:block>
									<fo:inline font-style="italic" font-family="serif">Namespaces
										in XML Recommendation</fo:inline>
									<fo:inline font-family="serif">
										(
										<fo:basic-link color="blue"
											external-destination="http://www.w3.org/TR/REC-xml-names/">http://www.w3.org/TR/REC-xml-names/
										</fo:basic-link>
										)
									</fo:inline>
								</fo:block>
							</fo:list-item-body>
						</fo:list-item>
						<fo:list-item>
							<fo:list-item-label end-indent="label-end()">
								<fo:block>
									<fo:inline font-family="Symbol">&#x2022;</fo:inline>
								</fo:block>
							</fo:list-item-label>
							<fo:list-item-body start-indent="body-start()">
								<fo:block>
									<fo:inline font-style="italic" font-family="serif">Java JDK
										1.1 Documentation</fo:inline>
									<fo:inline font-family="serif">
										(
										<fo:basic-link color="blue"
											external-destination="http://java.sun.com/products/jdk/1.1/docs/index.html">http://java.sun.com/products/jdk/1.1/docs/index.html
										</fo:basic-link>
										)
									</fo:inline>
								</fo:block>
							</fo:list-item-body>
						</fo:list-item>
					</fo:list-block>






					<fo:block id="sec11" font-size="18pt" font-family="serif"
						line-height="20pt" space-before.optimum="20pt"
						space-after.optimum="14pt">K)
						Licence
					</fo:block>
					<fo:block space-after.optimum="3pt" font-family="serif">
						===================================================================
					</fo:block>
					<fo:block space-after.optimum="3pt" font-family="serif"> The
						Apache Software License, Version 1.1</fo:block>
					<fo:block space-after.optimum="3pt" font-family="serif">
						===================================================================
					</fo:block>
					<fo:block space-after.optimum="3pt" font-family="serif"> Copyright
						(C) 1999 The Apache Software Foundation. All rights reserved.
					</fo:block>
					<fo:block space-after.optimum="3pt" font-family="serif">
						Redistribution and use in source and binary forms, with or without
						modification,
						are permitted provided that the following conditions are met:
					</fo:block>
					<fo:block space-after.optimum="3pt" font-family="serif">1.
						Redistributions of source code must retain the above copyright
						notice,
						this list of conditions and the following disclaimer.
					</fo:block>

					<fo:block space-after.optimum="3pt" font-family="serif">2.
						Redistributions in binary form must reproduce the above copyright
						notice,
						this list of conditions and the following disclaimer in the
						documentation
						and/or other materials provided with the distribution.
					</fo:block>

					<fo:block space-after.optimum="3pt" font-family="serif">3. The
						end-user documentation included with the redistribution, if any,
						must
						include the following acknowledgment: "This product includes software
						developed by the Apache Software Foundation
						(http://www.apache.org/)."
						Alternately, this acknowledgment may appear in the software itself, if
						and wherever such third-party acknowledgments normally appear.
					</fo:block>

					<fo:block space-after.optimum="3pt" font-family="serif">4. The
						names "FOP" and "Apache Software Foundation" must not be used to
						endorse or promote products derived from this software without
						prior
						written permission. For written permission, please contact
						apache@apache.org.
					</fo:block>

					<fo:block space-after.optimum="3pt" font-family="serif">5.
						Products derived from this software may not be called "Apache",
						nor may
						"Apache" appear in their name, without prior written permission of the
						Apache Software Foundation.
					</fo:block>
					<fo:block space-after.optimum="3pt" font-family="serif">THIS
						SOFTWARE IS PROVIDED ``AS IS'' AND ANY EXPRESSED OR IMPLIED
						WARRANTIES,
						INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
						FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL
						THE
						APACHE SOFTWARE FOUNDATION OR ITS CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
						INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
						(INCLU-
						DING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
						LOSS
						OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED
						AND ON
						ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR
						TORT
						(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
						THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
					</fo:block>

					<fo:block space-after.optimum="3pt" font-family="serif">
						This software consists of voluntary contributions made by many
						individuals
						on behalf of the Apache Software Foundation and was originally
						created by
						James Tauber &lt;jtauber@jtauber.com&gt;. For more information on the
						Apache
						Software Foundation, please see
						<fo:inline font-style="italic" font-family="serif">http://www.apache.org/
						</fo:inline>
						<fo:inline font-family="serif">
							(http://www.apache.org/)
						</fo:inline>
						.
					</fo:block>

					<fo:block font-size="14pt" font-family="sans-serif"
						line-height="10pt" space-after.optimum="15pt" font-weight="bold"
						start-indent="15pt" break-before="page">
						Content
					</fo:block>
					<fo:table table-layout="fixed" width="100%"
						border-collapse="separate">
						<fo:table-column column-width="1cm" />
						<fo:table-column column-width="12cm" />
						<fo:table-column column-width="1cm" />
						<fo:table-body font-size="10pt"
							font-family="sans-serif">
							<fo:table-row line-height="12pt">
								<fo:table-cell>
									<fo:block text-align="end">A)
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block text-align="start">
										<fo:basic-link color="blue"
											internal-destination="sec1">What is FOP?</fo:basic-link>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block text-align="end">
										<fo:page-number-citation ref-id="sec1" />
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row line-height="12pt">
								<fo:table-cell>
									<fo:block text-align="end">B)
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block text-align="start">
										<fo:basic-link color="blue"
											internal-destination="sec2">Downloading FOP</fo:basic-link>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block text-align="end">
										<fo:page-number-citation ref-id="sec2" />
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row line-height="12pt">
								<fo:table-cell>
									<fo:block text-align="end">C)
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block text-align="start">
										<fo:basic-link color="blue"
											internal-destination="sec3">Running FOP</fo:basic-link>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block text-align="end">
										<fo:page-number-citation ref-id="sec3" />
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row line-height="12pt">
								<fo:table-cell>
									<fo:block text-align="end">D)
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block text-align="start">
										<fo:basic-link color="blue"
											internal-destination="sec4">Embedding FOP</fo:basic-link>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block text-align="end">
										<fo:page-number-citation ref-id="sec4" />
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row line-height="12pt">
								<fo:table-cell>
									<fo:block text-align="end">E)
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block text-align="start">
										<fo:basic-link color="blue"
											internal-destination="sec5">What's Implemented?</fo:basic-link>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block text-align="end">
										<fo:page-number-citation ref-id="sec5" />
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row line-height="12pt">
								<fo:table-cell>
									<fo:block text-align="end">F)
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block text-align="start">
										<fo:basic-link color="blue"
											internal-destination="sec6">Limitations</fo:basic-link>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block text-align="end">
										<fo:page-number-citation ref-id="sec6" />
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row line-height="12pt">
								<fo:table-cell>
									<fo:block text-align="end">G)
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block text-align="start">
										<fo:basic-link color="blue"
											internal-destination="sec7">Bugs</fo:basic-link>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block text-align="end">
										<fo:page-number-citation ref-id="sec7" />
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row line-height="12pt">
								<fo:table-cell>
									<fo:block text-align="end">H)
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block text-align="start">
										<fo:basic-link color="blue"
											internal-destination="sec8">Compiling FOP</fo:basic-link>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block text-align="end">
										<fo:page-number-citation ref-id="sec8" />
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row line-height="12pt">
								<fo:table-cell>
									<fo:block text-align="end">I)
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block text-align="start">
										<fo:basic-link color="blue"
											internal-destination="sec9">Getting involved</fo:basic-link>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block text-align="end">
										<fo:page-number-citation ref-id="sec9" />
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row line-height="12pt">
								<fo:table-cell>
									<fo:block text-align="end">J)
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block text-align="start">
										<fo:basic-link color="blue"
											internal-destination="sec10">FOP Relevant Specifications
										</fo:basic-link>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block text-align="end">
										<fo:page-number-citation
											ref-id="sec10" />
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row line-height="12pt">
								<fo:table-cell>
									<fo:block text-align="end">K)
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block text-align="start">
										<fo:basic-link color="blue"
											internal-destination="sec11">Licence</fo:basic-link>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block text-align="end">
										<fo:page-number-citation
											ref-id="sec11" />
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-body>
					</fo:table>



				</fo:flow>
			</fo:page-sequence>
		</fo:root>
	</xsl:template>
</xsl:stylesheet>