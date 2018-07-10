package net.sppan.base.controller.admin.system;

import net.sppan.base.common.JsonResult;
import net.sppan.base.controller.BaseController;
import net.sppan.base.entity.Commercial;
import net.sppan.base.service.ICommercialService;
import net.sppan.base.service.specification.SimpleSpecificationBuilder;
import net.sppan.base.service.specification.SpecificationOperator.Operator;
import net.sppan.base.vo.ZtreeView;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/admin/commercial")
public class CommercialController extends BaseController {
	@Autowired
	private ICommercialService commercialService;
	

	@RequestMapping("/index")
	public String index() {
		return "admin/commercial/index";
	}

	@RequestMapping("/list")
	@ResponseBody
	public Page<Commercial> list() {
		SimpleSpecificationBuilder<Commercial> builder = new SimpleSpecificationBuilder<Commercial>();
		String searchText = request.getParameter("searchText");
		if(StringUtils.isNotBlank(searchText)){
			builder.add("commercial_name", Operator.likeAll.name(), searchText);
		}
		Page<Commercial> page = commercialService.findAll(builder.generateSpecification(),getPageRequest());
		return page;
	}
	
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String add(ModelMap map) {
		List<Commercial> list = commercialService.findAll();
		map.put("list", list);
		return "admin/commercial/form";
	}
	

	@RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
	public String edit(@PathVariable Integer id,ModelMap map) {
		Commercial commercial = commercialService.find(id);
		map.put("commercial", commercial);
		
		List<Commercial> list = commercialService.findAll();
		map.put("list", list);
		return "admin/commercial/form";
	}
	
	@RequestMapping(value= {"/edit"}, method = RequestMethod.POST)
	@ResponseBody
	public JsonResult edit(Commercial commercial,ModelMap map){
		try {
			commercialService.saveOrUpdate(commercial);
		} catch (Exception e) {
			return JsonResult.failure(e.getMessage());
		}
		return JsonResult.success();
	}
	
	@RequestMapping(value = "/delete/{id}", method = RequestMethod.POST)
	@ResponseBody
	public JsonResult delete(@PathVariable Integer id,ModelMap map) {
		try {
			commercialService.delete(id);
		} catch (Exception e) {
			e.printStackTrace();
			return JsonResult.failure(e.getMessage());
		}
		return JsonResult.success();
	}
}
