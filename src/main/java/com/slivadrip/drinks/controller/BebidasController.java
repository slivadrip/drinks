package com.slivadrip.drinks.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.slivadrip.drinks.controller.page.PageWrapper;
import com.slivadrip.drinks.dto.BebidaDTO;
import com.slivadrip.drinks.model.Bebida;
import com.slivadrip.drinks.model.Origem;
import com.slivadrip.drinks.model.Sabor;
import com.slivadrip.drinks.repository.Bebidas;
import com.slivadrip.drinks.repository.Estilos;
import com.slivadrip.drinks.repository.filter.BebidaFilter;
import com.slivadrip.drinks.service.CadastroBebidaService;
import com.slivadrip.drinks.service.exception.ImpossivelExcluirEntidadeException;

@Controller
@RequestMapping("/bebidas")
public class BebidasController {

	@Autowired
	private CadastroBebidaService cadastroBebidaService;

	@Autowired
	private Bebidas bebidas;

	@Autowired
	private Estilos estilos;
	
	@RequestMapping("/nova")
	public ModelAndView nova(Bebida bebida) {
		ModelAndView mv = new ModelAndView("bebida/CadastroBebida");
		mv.addObject("sabores", Sabor.values());
		mv.addObject("estilos", estilos.findAll());
		mv.addObject("origens", Origem.values());
		return mv;
	}
	
	@RequestMapping(value = { "/nova", "{\\d+}" }, method = RequestMethod.POST)
	public ModelAndView salvar(@Valid Bebida bebida, BindingResult result, Model model, RedirectAttributes attributes) {
		if (result.hasErrors()) {
			return nova(bebida);
		}
		
		cadastroBebidaService.salvar(bebida);
		attributes.addFlashAttribute("mensagem", "Bebida salva com sucesso!");
		return new ModelAndView("redirect:/bebidas/nova");
	}
	
	@GetMapping
	public ModelAndView pesquisar(BebidaFilter bebidaFilter, BindingResult result
			, @PageableDefault(size = 2) Pageable pageable, HttpServletRequest httpServletRequest) {
		ModelAndView mv = new ModelAndView("bebida/PesquisaBebidas");
		mv.addObject("estilos", estilos.findAll());
		mv.addObject("sabores", Sabor.values());
		mv.addObject("origens", Origem.values());
		
		PageWrapper<Bebida> paginaWrapper = new PageWrapper<>(bebidas.filtrar(bebidaFilter, pageable)
				, httpServletRequest);
		mv.addObject("pagina", paginaWrapper);
		return mv;
	}
	
	@RequestMapping(consumes = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody List<BebidaDTO> pesquisar(String skuOuNome) {
		return bebidas.porSkuOuNome(skuOuNome);
	}
	
	@DeleteMapping("/{codigo}")
	public @ResponseBody ResponseEntity<?> excluir(@PathVariable("codigo") Bebida bebida) {
		try {
			cadastroBebidaService.excluir(bebida);
		} catch (ImpossivelExcluirEntidadeException e) {
			return ResponseEntity.badRequest().body(e.getMessage());
		}
		return ResponseEntity.ok().build();
	}
	
	@GetMapping("/{codigo}")
	public ModelAndView editar(@PathVariable("codigo") Bebida bebida) {
		ModelAndView mv = nova(bebida);
		mv.addObject(bebida);
		return mv;
	}
	
}
