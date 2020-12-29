package com.sanga.pj.filter;

import org.sitemesh.builder.SiteMeshFilterBuilder;
import org.sitemesh.config.ConfigurableSiteMeshFilter;

public class SiteMeshFilter extends ConfigurableSiteMeshFilter {
	@Override
	protected void applyCustomConfiguration(SiteMeshFilterBuilder builder) {
		builder.addDecoratorPath("/admin*", "/themes/admin/decorator/admin.jsp")
			   .addExcludedPath("/login")
			   .addExcludedPath("/passwordChange")
			   .addDecoratorPath("/*", "/themes/front/decorator/front.jsp");

	}
}
