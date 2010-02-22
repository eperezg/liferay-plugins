<%
/**
 * Copyright (c) 2000-2010 Liferay, Inc. All rights reserved.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */
%>

<%@ include file="/init.jsp" %>

<%
PortletURL portletURL = renderResponse.createRenderURL();
%>

<liferay-ui:search-container
	emptyResultsMessage="there-are-no-gadgets"
	headerNames="name"
	iteratorURL="<%= portletURL %>"
>
	<liferay-ui:search-container-results
		results="<%= GadgetLocalServiceUtil.getGadgets(company.getCompanyId(), searchContainer.getStart(), searchContainer.getEnd()) %>"
		total="<%= GadgetLocalServiceUtil.getGadgetsCount(company.getCompanyId()) %>"
	/>

	<liferay-ui:search-container-row
		className="com.liferay.opensocial.model.Gadget"
		escapedModel="<%= false %>"
		keyProperty="gadgetId"
		modelVar="gadget"
	>
		<portlet:renderURL var="rowURL">
			<portlet:param name="jspPage" value="/admin/edit_gadget.jsp" />
			<portlet:param name="redirect" value="<%= currentURL %>" />
			<portlet:param name="gadgetId" value="<%= String.valueOf(gadget.getGadgetId()) %>" />
		</portlet:renderURL>

		<liferay-ui:search-container-column-text
			href="<%= rowURL %>"
			name="gadget"
			property="name"
		/>

		<liferay-ui:search-container-column-jsp
			align="right"
			path="/admin/gadget_action.jsp"
			valign="top"
		/>
	</liferay-ui:search-container-row>

	<div>
		<input type="button" value="<liferay-ui:message key="add-gadget" />" onClick="location.href = '<portlet:renderURL><portlet:param name="jspPage" value="/admin/edit_gadget.jsp" /><portlet:param name="redirect" value="<%= currentURL %>" /></portlet:renderURL>';" />
	</div>

	<br />

	<liferay-ui:search-iterator />
</liferay-ui:search-container>