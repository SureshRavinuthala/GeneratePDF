<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.1"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:fo="http://www.w3.org/1999/XSL/Format"
	xmlns="http://www.w3.org/2000/svg" exclude-result-prefixes="fo">
	<xsl:template match="data">
		<xsl:param name="page-size" select="'ltr'" />
		<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
			<fo:layout-master-set>
				<!-- letter-sized paper -->
				<xsl:choose>
					<xsl:when test="$page-size='ltr'">
						<fo:simple-page-master master-name="first"
							page-height="11in" page-width="8.5in" margin-right="20pt"
							margin-left="20pt" margin-bottom="20pt" margin-top="30pt">
							<fo:region-body margin-bottom="50pt" />
							<fo:region-after region-name="ra-right"
								extent="25pt" />
						</fo:simple-page-master>

						<fo:simple-page-master master-name="rest"
							page-height="11in" page-width="8.5in" margin-right="72pt"
							margin-left="72pt" margin-bottom="36pt" margin-top="36pt">
							<fo:region-body margin-top="50pt"
								margin-bottom="50pt" />
							<fo:region-before region-name="rb-left"
								extent="25pt" />
							<fo:region-after region-name="ra-left"
								extent="25pt" />
						</fo:simple-page-master>

						<fo:simple-page-master master-name="right"
							page-height="11in" page-width="8.5in" margin-right="72pt"
							margin-left="72pt" margin-bottom="36pt" margin-top="36pt">
							<fo:region-body margin-top="50pt"
								margin-bottom="50pt" />
							<fo:region-before region-name="rb-right"
								extent="25pt" />
							<fo:region-after region-name="ra-right"
								extent="25pt" />
						</fo:simple-page-master>
					</xsl:when>
					<xsl:otherwise>
						<!-- layout for the first page -->
						<fo:simple-page-master master-name="first"
							page-height="29.7cm" page-width="21cm" margin-top="1cm"
							margin-bottom="2cm" margin-left="2.5cm" margin-right="2.5cm">
							<fo:region-body margin-top="3cm" />
							<fo:region-before extent="1cm" />
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
					</xsl:otherwise>
				</xsl:choose>

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
				<fo:flow flow-name="xsl-region-body">

					<fo:table inline-progression-dimension="96%"
						table-layout="fixed" margin-left="4mm">
						<fo:table-column column-width="15%" />
						<fo:table-column column-width="75%" />
						<fo:table-body>
							<fo:table-row>
								<fo:table-cell>
									<fo:block>
										<fo:external-graphic content-height="60px"
											content-width="60px" scaling="non-uniform" src="logo.png" />
									</fo:block>
								</fo:table-cell>
								<fo:table-cell text-align="left">
									<fo:block font-size="28pt" margin-left="-2mm"
										margin-right="-10mm" padding="2mm" font-family="Arial"
										color="#0079c2" font-weight="bold" font-style="normal">MY NEW YORK LIFE
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-body>
					</fo:table>
					<!-- <fo:block> <fo:external-graphic content-height="18mm" content-width="18mm" 
						scaling="non-uniform" src="logo.png" /> <fo:inline space-before="3pt" font-size="28pt" 
						text-align="center" font-family="Arial" color="#0079c2" font-weight="bold" 
						font-style="normal">MY NEW YORK LIFE </fo:inline> </fo:block> -->
					<fo:block text-align="center" font-size="18pt"
						alignment-adjust="middle" space-before.optimum="25pt"
						font-family="Arial" line-height="18pt" color="black">
						You have submitted a loan request
						<fo:inline space-before="3pt">
							<fo:external-graphic content-height="8mm"
								content-width="8mm" scaling="non-uniform" src="success.png" />
						</fo:inline>
					</fo:block>
					<fo:block>
					</fo:block>
					<fo:block font-size="18pt" font-family="Arial"
						text-indent="0.5cm" line-height="24pt" space-before.optimum="15pt"
						background-color="#0A3C53" color="white" padding-top="3pt">LOAN REQUEST
						SUMMARY
					</fo:block>
					<fo:table inline-progression-dimension="100%"
						table-layout="fixed" space-before.optimum="15pt">
						<fo:table-column column-width="50%" />
						<fo:table-column column-width="50%" />
						<fo:table-body>
							<fo:table-row>
								<fo:table-cell text-align="left" text-indent="2cm">
									<fo:block font-size="10pt" font-family="Arial"
										font-style="normal">POLICY NUMBER
									</fo:block>
								</fo:table-cell>
								<fo:table-cell text-align="left">
									<fo:block font-size="10pt" font-family="Arial"
										font-style="normal">DATE SUBMITTED
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell text-align="left" text-indent="2cm">
									<fo:block font-size="10pt" font-family="Arial"
										font-style="normal">39242799
									</fo:block>
								</fo:table-cell>
								<fo:table-cell text-align="left">
									<fo:block font-size="10pt" font-family="Arial"
										font-style="normal">03/30/2018
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-body>
					</fo:table>
					<!-- draw empty line here -->
					<fo:block>
						<fo:leader leader-pattern="space" />
					</fo:block>
					<fo:block font-size="10pt" font-family="Arial"
						text-indent="2cm" space-before.optimum="25pt" font-style="normal">A
						confirmation will be sent
						by email
					</fo:block>
					<fo:block text-indent="2cm">
						<fo:block font-size="10pt" font-family="Arial"
							space-before.optimum="25pt" font-style="normal">SUMMARY
						</fo:block>
						<fo:block>
							<fo:leader leader-pattern="rule" leader-length="90%"
								rule-style="solid" rule-thickness="1pt" />
						</fo:block>
					</fo:block>
					<!-- <fo:block text-indent="2cm" border-top-style="solid" ></fo:block> -->

					<fo:table inline-progression-dimension="100%"
						table-layout="fixed" space-before.optimum="15pt">
						<fo:table-column column-width="50%" />
						<fo:table-column column-width="50%" />
						<fo:table-body>
							<fo:table-row>
								<fo:table-cell text-align="left" text-indent="2cm">
									<fo:block font-size="10pt" font-family="Arial"
										font-style="normal">POLICY
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell text-align="left" text-indent="2cm">
									<fo:block font-size="10pt" font-family="Arial"
										font-style="normal">Whole Life Insurance - 39242799
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell>
									<fo:block>
										<fo:leader leader-pattern="space" />
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell text-align="left" text-indent="2cm">
									<fo:block font-size="10pt" font-family="Arial"
										font-style="normal">LOAN REQUEST AMOUNT
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell text-align="left" text-indent="2cm">
									<fo:block font-size="10pt" font-family="Arial"
										font-style="normal">$2,000.00
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell>
									<fo:block>
										<fo:leader leader-pattern="space" />
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell text-align="left" text-indent="2cm">
									<fo:block font-size="10pt" font-family="Arial"
										font-style="normal">LOAN INTEREST RATE
									</fo:block>
								</fo:table-cell>
								<fo:table-cell text-align="left">
									<fo:block font-size="10pt" font-family="Arial"
										font-style="normal">BANK ACCOUNT
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell text-align="left" text-indent="2cm">
									<fo:block font-size="10pt" font-family="Arial"
										font-style="normal">5.00 % </fo:block>
								</fo:table-cell>
								<fo:table-cell text-align="left">
									<fo:block font-size="10pt" font-family="Arial"
										font-style="normal">WAYNE LEE WARREN JR REGIONS BANK C ********8908
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell>
									<fo:block>
										<fo:leader leader-pattern="space" />
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell text-align="left" text-indent="2cm">
									<fo:block font-size="10pt" font-family="Arial"
										font-style="normal">OUTSTANDING LOAN PRINCIPAL
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell text-align="left" text-indent="2cm">
									<fo:block font-size="10pt" font-family="Arial"
										font-style="normal">$13,332.98
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell>
									<fo:block>
										<fo:leader leader-pattern="space" />
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell text-align="left" text-indent="2cm">
									<fo:block font-size="10pt" font-family="Arial"
										font-style="normal">FEDERAL GAIN WITHHOLDING
									</fo:block>
								</fo:table-cell>
								<fo:table-cell text-align="left">
									<fo:block font-size="10pt" font-family="Arial"
										font-style="normal">STATE GAIN WITHHOLDING
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell text-align="left" text-indent="2cm">
									<fo:block font-size="10pt" font-family="Arial"
										font-style="normal">YES
									</fo:block>
								</fo:table-cell>
								<fo:table-cell text-align="left">
									<fo:block font-size="10pt" font-family="Arial"
										font-style="normal">YES
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell>
									<fo:block>
										<fo:leader leader-pattern="space" />
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell text-align="left" text-indent="2cm">
									<fo:block font-size="10pt" font-family="Arial"
										font-style="normal">CONFIRMATION MAIL
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell text-align="left" text-indent="2cm">
									<fo:block font-size="10pt" font-family="Arial"
										font-style="normal">TestEmail6780@gmail.com
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-body>
					</fo:table>
					<fo:block space-before.optimum="25pt" text-indent="2cm">
						<fo:inline space-before="3pt">
							<fo:external-graphic content-height="5mm"
								content-width="5mm" scaling="non-uniform" src="checkbox.png" />
						</fo:inline>
						<fo:inline space-before="3pt" font-size="10pt" margin-top="2mm"
							text-align="center" font-family="Arial" font-style="normal">
							I have read
							and agree to the terms of service
						</fo:inline>
					</fo:block>
				</fo:flow>
			</fo:page-sequence>
		</fo:root>
	</xsl:template>


</xsl:stylesheet>