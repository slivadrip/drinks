package com.slivadrip.drinks.thymeleaf;

import java.util.HashSet;
import java.util.Set;

import org.thymeleaf.dialect.AbstractProcessorDialect;
import org.thymeleaf.processor.IProcessor;
import org.thymeleaf.standard.StandardDialect;

import com.slivadrip.drinks.thymeleaf.processor.ClassForErrorAttributeTagProcessor;
import com.slivadrip.drinks.thymeleaf.processor.MenuAttributeTagProcessor;
import com.slivadrip.drinks.thymeleaf.processor.MessageElementTagProcessor;
import com.slivadrip.drinks.thymeleaf.processor.OrderElementTagProcessor;
import com.slivadrip.drinks.thymeleaf.processor.PaginationElementTagProcessor;

public class DrinksDialect extends AbstractProcessorDialect {

	public DrinksDialect() {
		super("Slivadrip Drinks", "drinks", StandardDialect.PROCESSOR_PRECEDENCE);
	}
	
	@Override
	public Set<IProcessor> getProcessors(String dialectPrefix) {
		final Set<IProcessor> processadores = new HashSet<>();
		processadores.add(new ClassForErrorAttributeTagProcessor(dialectPrefix));
		processadores.add(new MessageElementTagProcessor(dialectPrefix));
		processadores.add(new OrderElementTagProcessor(dialectPrefix));
		processadores.add(new PaginationElementTagProcessor(dialectPrefix));
		processadores.add(new MenuAttributeTagProcessor(dialectPrefix));
		return processadores;
	}

}
